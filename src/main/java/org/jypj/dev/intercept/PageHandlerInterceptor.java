package org.jypj.dev.intercept;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.jypj.dev.constant.BaseConstant;
import org.jypj.dev.dao.NavContentDao;
import org.jypj.dev.dao.NewsDao;
import org.jypj.dev.dao.SettingDao;
import org.jypj.dev.model.NavContent;
import org.jypj.dev.model.News;
import org.jypj.dev.model.Setting;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 前台基础配置信息拦截器
 *
 * @author ChenYu
 */
public class PageHandlerInterceptor extends HandlerInterceptorAdapter {

    @Resource
    private NavContentDao navContentDao;
    @Resource
    private NewsDao newsDao;
    @Resource
    private SettingDao settingDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession();
        if (session.getAttribute(BaseConstant.SETTING_SESSION_NAME) == null) {
            //todo 设置官网的一些配置信息logoURl等
            Setting setting = settingDao.selectSetting();
            JSONObject jsonObject = JSON.parseObject(setting.getConfig());
            session.setAttribute(BaseConstant.SETTING_SESSION_NAME, jsonObject);
        }
        if (session.getAttribute(BaseConstant.NAV_CONTENT_SESSION_NAME) == null) {
            Map<String, Object> map = new HashMap<>(0);
            List<NavContent> navContents = navContentDao.selectAllByMap(map);
            navContents.forEach(navContent -> {
                //todo 设置分公司的二级菜单
                if (BaseConstant.Tags.BRANCH_TAG.equals(navContent.getTag())) {
                    List<News> news = newsDao.selectAllByContentType(BaseConstant.Tags.BRANCH_TAG);
                    navContent.setBranchList(news);
                }
            });
            session.setAttribute(BaseConstant.NAV_CONTENT_SESSION_NAME, navContents);
        }
        return true;
    }
}
