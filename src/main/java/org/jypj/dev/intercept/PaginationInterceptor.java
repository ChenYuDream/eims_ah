package org.jypj.dev.intercept;

import cn.org.rapid_framework.jdbc.dialect.Dialect;
import cn.org.rapid_framework.util.PropertiesHelper;
import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.mapping.*;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;
import org.apache.log4j.Logger;
import org.jypj.dev.util.Page;

import javax.xml.bind.PropertyException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

// 只拦截select部分
@Intercepts({@Signature(type = Executor.class, method = "query", args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class})})
public class PaginationInterceptor implements Interceptor {

    private static Logger log = Logger.getLogger(PaginationInterceptor.class);

    private Dialect dialect;    //数据库方言

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        try {
            MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
            Object parameter = invocation.getArgs()[1];
            BoundSql boundSql = mappedStatement.getBoundSql(parameter);
            String originalSql = boundSql.getSql() == null || "".equals(boundSql.getSql()) ? boundSql.getSql() : boundSql.getSql().trim();
            Object invocationObj = invocation.getArgs()[2];
            if (originalSql != null && invocationObj != null && invocationObj instanceof Page) {
                originalSql = originalSql.trim();
                Page page = (Page) invocationObj;
                Object parameterObject = boundSql.getParameterObject();
                if (boundSql == null || boundSql.getSql() == null || "".equals(boundSql.getSql())) {
                    return null;
                }
                int totpage = page.getTotalRows();
                // 得到总记录数
                if (totpage == 0) { // 对符合条件的数据进行统计 生成总页数
                    StringBuffer countSql = new StringBuffer(originalSql.length() + 100);
                    countSql.append("select count(1) from (").append(originalSql).append(") t");
                    Connection connection = mappedStatement.getConfiguration().getEnvironment().getDataSource().getConnection();
                    PreparedStatement countStmt = connection.prepareStatement(countSql.toString());
                    BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), countSql.toString(), boundSql.getParameterMappings(), parameterObject);

                    for (ParameterMapping mapping : boundSql.getParameterMappings()) {
                        String prop = mapping.getProperty();
                        if (boundSql.hasAdditionalParameter(prop)) {
                            countBS.setAdditionalParameter(prop, boundSql.getAdditionalParameter(prop));
                        }
                    }

                    setParameters(countStmt, mappedStatement, countBS, parameterObject);
                    ResultSet rs = countStmt.executeQuery();
                    if (rs.next()) {
                        totpage = rs.getInt(1);
                    }
                    page.setTotalRows(totpage);
                    rs.close();
                    countStmt.close();
                    connection.close();
                }
                // 分页查询 本地化对象 修改数据库注意修改实现 
                String pagesql = generatePageSql(originalSql, page);
                invocation.getArgs()[2] = new RowBounds(RowBounds.NO_ROW_OFFSET, RowBounds.NO_ROW_LIMIT);
                BoundSql newBoundSql = new BoundSql(mappedStatement.getConfiguration(), pagesql, boundSql.getParameterMappings(), boundSql.getParameterObject());
                MappedStatement newMs = copyFromMappedStatement(mappedStatement, new BoundSqlSqlSource(newBoundSql));
                invocation.getArgs()[0] = newMs;
                return invocation.proceed();
            } else {
                return invocation.proceed();
            }
        } catch (Exception e) {
            log.error("分页拦截插件.", e);
            return invocation.proceed();
        }
    }

    public static class BoundSqlSqlSource implements SqlSource {
        BoundSql boundSql;

        public BoundSqlSqlSource(BoundSql boundSql) {
            this.boundSql = boundSql;
        }

        @Override
        public BoundSql getBoundSql(Object parameterObject) {
            return boundSql;
        }
    }

    @Override
    public Object plugin(Object arg0) {
        return Plugin.wrap(arg0, this);
    }


    /**
     * 根据数据库方言，生成Sql
     *
     * @param originalSql
     * @param page
     * @return
     * @throws PropertyException
     */
    private String generatePageSql(String originalSql, Page page) throws PropertyException {
        String pageSql = dialect.getLimitString(originalSql, (page.getCurrentPage() - 1) * page.getPageSize(), page.getPageSize());
        log.debug((page.getCurrentPage() - 1) * page.getPageSize());
        log.debug(page.getCurrentPage() * page.getPageSize());
        log.debug(pageSql);
        return pageSql.toString();
    }

    @Override
    public void setProperties(Properties p) {
        String dialectClass = new PropertiesHelper(p).getRequiredString("dialectClass");
        try {
            dialect = (Dialect) Class.forName(dialectClass).newInstance();
        } catch (Exception e) {
            throw new RuntimeException("cannot create dialect instance by dialectClass:" + dialectClass, e);
        }
    }


    /**
     * 对SQL参数(?)设值,参考org.apache.ibatis.executor.parameter.
     * DefaultParameterHandler
     *
     * @param ps
     * @param mappedStatement
     * @param boundSql
     * @param parameterObject
     * @throws SQLException
     */
    @SuppressWarnings("unchecked")
    private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql, Object parameterObject) throws SQLException {
        ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
        List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
        if (parameterMappings != null) {
            Configuration configuration = mappedStatement.getConfiguration();
            TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
            MetaObject metaObject = parameterObject == null ? null : configuration.newMetaObject(parameterObject);
            for (int i = 0; i < parameterMappings.size(); i++) {
                ParameterMapping parameterMapping = parameterMappings.get(i);
                if (parameterMapping.getMode() != ParameterMode.OUT) {
                    Object value;
                    String propertyName = parameterMapping.getProperty();
                    PropertyTokenizer prop = new PropertyTokenizer(propertyName);
                    if (parameterObject == null) {
                        value = null;
                    } else if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
                        value = parameterObject;
                    } else if (boundSql.hasAdditionalParameter(propertyName)) {
                        value = boundSql.getAdditionalParameter(propertyName);
                    } else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX) && boundSql.hasAdditionalParameter(prop.getName())) {
                        value = boundSql.getAdditionalParameter(prop.getName());
                        if (value != null) {
                            value = configuration.newMetaObject(value).getValue(propertyName.substring(prop.getName().length()));
                        }
                    } else {
                        value = metaObject == null ? null : metaObject.getValue(propertyName);
                    }
                    TypeHandler<Object> typeHandler = (TypeHandler<Object>) parameterMapping.getTypeHandler();
                    if (typeHandler == null) {
                        throw new ExecutorException("There was no TypeHandler found for parameter " + propertyName + " of statement " + mappedStatement.getId());
                    }
                    typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
                }
            }
        }
    }

    private MappedStatement copyFromMappedStatement(MappedStatement ms, SqlSource newSqlSource) {
        Builder builder = new Builder(ms.getConfiguration(), ms.getId(), newSqlSource, ms.getSqlCommandType());
        builder.resource(ms.getResource());
        builder.fetchSize(ms.getFetchSize());
        builder.statementType(ms.getStatementType());
        builder.keyGenerator(ms.getKeyGenerator());
        builder.timeout(ms.getTimeout());
        builder.parameterMap(ms.getParameterMap());
        builder.resultMaps(ms.getResultMaps());
        builder.cache(ms.getCache());
        MappedStatement newMs = builder.build();
        return newMs;
    }

}
