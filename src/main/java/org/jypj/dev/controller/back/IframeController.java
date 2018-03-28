package org.jypj.dev.controller.back;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.jypj.dev.dao.NewsDao;
import org.jypj.dev.model.News;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author chenyu
 * @create
 */
@Controller
@RequestMapping("back/iframe")
public class IframeController {


    @Resource
    private NewsDao newsDao;

    /**
     * 预览轮播图
     *
     * @return
     */
    @RequestMapping("preview/news/{id}")
    public String toImagePreview(@PathVariable("id") String id, Model model) {
        News news = newsDao.selectNewsById(id);
        if (StringUtils.isNotEmpty(news.getShowImgs())) {
            JSONArray objects = JSON.parseArray(news.getShowImgs());
            model.addAttribute("images", objects);
        }
        return "back/iframe/img_view_iframe";
    }
}
