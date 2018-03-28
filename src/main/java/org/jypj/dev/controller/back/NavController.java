package org.jypj.dev.controller.back;

import org.jypj.dev.constant.BaseConstant;
import org.jypj.dev.dao.NavContentDao;
import org.jypj.dev.model.NavContent;
import org.jypj.dev.vo.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 导航控制器
 *
 * @author yu_chen
 * @create 2017-10-19 10:06
 **/
@Controller
@RequestMapping("back/nav")
public class NavController  {

    @Resource
    private NavContentDao navContentDao;

    /**
     * 查询所有导航数据
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "list")
    public Result selectAllNavs() {
        Map<String, Object> queryMap = new HashMap<>();
        List<NavContent> navContents = navContentDao.selectAllByMap(queryMap);
        navContents.forEach(navContent -> {
            navContent.setPid(BaseConstant.DEFAULT_PID);
            navContent.setUrl(BaseConstant.NAV_URL_PRIFIX + navContent.getTag());
            navContent.setName(navContent.getNavName());
        });
        NavContent navContent = new NavContent(BaseConstant.SettingNav.ID, BaseConstant.SettingNav.PID,
                BaseConstant.SettingNav.OTHER_SETTING_URL, BaseConstant.SettingNav.NAME);
        navContents.add(navContent);
        return new Result(navContents);
    }


    /**
     * 更新导航设置
     *
     * @param navContent
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "update")
    public Result updateNavContent(NavContent navContent) {
        navContent.setModifyTime(new Date());
        int i = navContentDao.updateNavContent(navContent);
        return new Result(i > 0 ? 0 : -1);
    }

    /**
     * 只更新内容
     *
     * @param navContent
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "update/content")
    public Result updateContent(NavContent navContent) {
        navContent.setModifyTime(new Date());
        int i = navContentDao.updateContent(navContent);
        return new Result(i > 0 ? 0 : -1);
    }
}
