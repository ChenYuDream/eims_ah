package org.jypj.dev.dao;

import org.apache.ibatis.annotations.Param;
import org.jypj.dev.model.News;
import org.jypj.dev.util.Page;

import java.util.List;
import java.util.Map;

public interface NewsDao {

    /**
     * 保存
     * 所有字段全都保存
     *
     * @param news
     * @return 保存的数量
     */
    int saveNews(News news);

    /**
     * 根据ID删除
     *
     * @param id 主键ID
     * @return 删除记录数
     */
    int deleteNewsById(String id);

    /**
     * 更新所有字段
     *
     * @param news
     * @return 保存后的对象包括ID
     */
    int updateNews(News news);

    /**
     * 按ID查询
     *
     * @param id 主键ID
     * @return News
     */
    News selectNewsById(String id);

    /**
     * 按条件查询全部的
     *
     * @param contentType 内容分类tag
     * @return List<News>
     */
    List<News> selectAllByContentType(@Param("contentType") String contentType);


    /**
     * 限制查询条数以及数量
     * @param contentType
     * @return
     */
    List<News> selectLimitByContentType(@Param("contentType") String contentType);
    /**
     * 分页查询
     * @param contentType
     * @param page
     * @return
     */
    List<News> selectOnePageByContentType(@Param("contentType") String contentType, Page page);

}
