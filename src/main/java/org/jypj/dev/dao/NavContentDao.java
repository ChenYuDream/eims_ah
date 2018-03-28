package org.jypj.dev.dao;

import org.apache.ibatis.annotations.Param;
import org.jypj.dev.model.NavContent;
import org.jypj.dev.util.Page;

import java.util.List;
import java.util.Map;

/**
 * @author ChenYu
 */
public interface NavContentDao {

    /**
     * 根据ID删除
     *
     * @param id 主键ID
     * @return 删除记录数
     */
    int deleteNavContentById(String id);

    /**
     * 更新所有字段
     *
     * @param navContent
     * @return 保存后的对象包括ID
     */
    int updateNavContent(NavContent navContent);


    /**
     * 只更新内容
     * @param navContent
     * @return
     */
    int updateContent(NavContent navContent);

    /**
     * 按ID查询
     *
     * @param id 主键ID
     * @return NavContent
     */
    NavContent selectNavContentById(String id);

    /**
     * 按ID查询
     *
     * @param tag 标签
     * @return NavContent
     */
    NavContent selectNavContentByTag(@Param("tag") String tag);

    /**
     * 按条件查询全部的
     *
     * @param map 查询条件
     * @return List<NavContent>
     */
    List<NavContent> selectAllByMap(Map<String, Object> map);
}
