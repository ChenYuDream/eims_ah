package org.jypj.dev.listener;

import org.jypj.dev.constant.BaseConstant;
import org.jypj.dev.util.PropertyUtil;
import org.jypj.dev.vo.BaseInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

/**
 * 初始化
 *
 * @author ChenYu
 */
@Component
public class SpringListener implements ApplicationContextAware, ServletContextAware, InitializingBean, ApplicationListener<ContextRefreshedEvent> {

    private final Logger logger = LoggerFactory.getLogger(SpringListener.class);

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        BaseInfo baseInfo = new BaseInfo();
        baseInfo.setFileServerPath(PropertyUtil.getFileServerPath());
        logger.debug(baseInfo.toString());
        servletContext.setAttribute(BaseConstant.BASE_INFO_NAME, baseInfo);
    }

    @Override
    public void setApplicationContext(ApplicationContext context) {
    }
}
