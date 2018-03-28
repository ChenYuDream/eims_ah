package org.jypj.dev.controller;

import org.apache.commons.lang3.StringUtils;
import org.jypj.dev.dao.NewsDao;
import org.jypj.dev.model.News;
import org.jypj.dev.util.Page;
import org.jypj.dev.vo.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 内容分类（案例，动态，业务，企业简介）
 *
 * @author yu_chen
 * @create 2017-10-20 11:27
 **/
@Controller
@RequestMapping("news")
public class NewsController {

    @Resource
    private NewsDao newsDao;

    /**
     * 按标签查询所有内容
     *
     * @param contentType
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "list/{contentType}")
    public Result selectAllNews(@PathVariable("contentType") String contentType) {
        List<News> news = newsDao.selectAllByContentType(contentType);
        return new Result(news);
    }

    @ResponseBody
    @RequestMapping(value = "list/limit/{contentType}")
    public Result selectAllLimitNews(@PathVariable("contentType") String contentType) {
        List<News> news = newsDao.selectLimitByContentType(contentType);
        return new Result(news);
    }

    /**
     * 分页查询数据
     *
     * @param contentType
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "list/page/{contentType}")
    public Result selectOnePageNews(@PathVariable("contentType") String contentType, Page page) {
        Map<String, Object> map = new HashMap<>();
        List<News> news = newsDao.selectOnePageByContentType(contentType, page);
        page.setResult(news);
        return new Result(page);
    }

    /**
     * 保存
     *
     * @param news
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "save")
    public Result saveNews(News news) {
        int i = 0;
        Date date = new Date();
        news.setUpdateTime(date);
        if (StringUtils.isNoneEmpty(news.getId())) {
            i = newsDao.updateNews(news);
        } else {
            news.setCreateTime(date);
            i = newsDao.saveNews(news);
        }

        return new Result(i > 0 ? 0 : -1);
    }


    /**
     * ID删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "delete/{id}")
    public Result deleteById(@PathVariable("id") String id) {
        int i = newsDao.deleteNewsById(id);
        return new Result(i > 0 ? 0 : -1);
    }
}
