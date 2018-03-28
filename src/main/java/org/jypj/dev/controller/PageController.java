package org.jypj.dev.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.jypj.dev.constant.BaseConstant;
import org.jypj.dev.dao.NavContentDao;
import org.jypj.dev.dao.NewsDao;
import org.jypj.dev.model.NavContent;
import org.jypj.dev.model.News;
import org.jypj.dev.util.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ChenYu
 * @date 2017-05-17
 */
@Controller
public class PageController {

    @Resource
    private NavContentDao navContentDao;

    @Resource
    private NewsDao newsDao;

    /**
     * 跳转到后台登录页
     *
     * @return
     */
    @RequestMapping("back")
    public String toBackIndex() {
        return "back/index";
    }

    /**
     * 跳转到index页
     *
     * @param tag
     * @param model
     * @return
     */
    @RequestMapping(value = "page/{tag}")
    public String toIndex(@PathVariable("tag") String tag, Model model) {
        NavContent navContent = navContentDao.selectNavContentByTag(tag);
        if (BaseConstant.Tags.INDEX_TAG.equals(tag)) {
            List<News> busNews = newsDao.selectAllByContentType(BaseConstant.Tags.BUSINESS_TAG);
            model.addAttribute("busNews", busNews);
            JSONObject jsonObject = JSON.parseObject(navContent.getContent());
            String imgList = jsonObject.getString("imgList");
            if (StringUtils.isNotEmpty(imgList)) {
                JSONArray jsonArray = JSON.parseArray(imgList);
                model.addAttribute("imgList", jsonArray);
            }
            model.addAttribute("content", jsonObject);
        }
        if (BaseConstant.Tags.ADVANTAGE_TAG.equals(tag) || BaseConstant.Tags.QUALIFICATION_TAG.equals(tag)) {
            JSONArray jsonArray = JSON.parseArray(navContent.getContent());
            model.addAttribute("imgList", jsonArray);
        }
        List<News> news = newsDao.selectAllByContentType(tag);
        model.addAttribute("news", news);
        model.addAttribute("navContent", navContent);
        return "web/" + tag + "_page";
    }

    /**
     * 分公司
     *
     * @param tag    分公司标签
     * @param newsId 分公司ID
     * @param model
     * @return
     */
    @RequestMapping(value = "page/{tag}/{newsId}")
    public String toIndex(@PathVariable("tag") String tag, @PathVariable("newsId") String newsId, Model model) {
        News news = newsDao.selectNewsById(newsId);
        NavContent navContent = navContentDao.selectNavContentByTag(tag);
        model.addAttribute("news", news);
        model.addAttribute("navContent", navContent);
        return "web/" + tag + "_page";
    }

}
