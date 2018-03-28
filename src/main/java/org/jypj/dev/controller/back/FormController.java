package org.jypj.dev.controller.back;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.jypj.dev.constant.BaseConstant;
import org.jypj.dev.dao.NavContentDao;
import org.jypj.dev.dao.SettingDao;
import org.jypj.dev.model.NavContent;
import org.jypj.dev.model.Setting;
import org.jypj.dev.vo.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author yu_chen
 * @create 2017-10-19 11:06
 **/
@Controller
@RequestMapping("back/form")
public class FormController {

    @Resource
    private NavContentDao navContentDao;

    @Resource
    private SettingDao settingDao;

    /**
     * 根据不同的标签跳转到不同的tag
     *
     * @param tag
     * @return
     */
    @RequestMapping("/main/{tag}")
    public String toMainForm(@PathVariable("tag") String tag, Model model) {
        NavContent navContent = navContentDao.selectNavContentByTag(tag);
        model.addAttribute("navContent", navContent);
        return "back/form/main_form";
    }

    /**
     * 公共表单
     *
     * @param tag
     * @param model
     * @return
     */
    @RequestMapping("/common/{tag}")
    public String toCommonForm(@PathVariable("tag") String tag, Model model) {
        NavContent navContent = navContentDao.selectNavContentByTag(tag);
        model.addAttribute("navContent", navContent);
        return "back/form/common_form";
    }


    /**
     * 不同的表单页
     *
     * @param tag
     * @param model
     * @return
     */
    @RequestMapping("/nav/{tag}")
    public String toNavForm(@PathVariable("tag") String tag, Model model) {
        NavContent navContent = navContentDao.selectNavContentByTag(tag);
        model.addAttribute("navContent", navContent);
        if (BaseConstant.Tags.INDEX_TAG.equals(tag)) {
            //首页使用
            JSONObject jsonObject = JSON.parseObject(navContent.getContent());
            model.addAllAttributes(jsonObject);
        }
        return "back/form/" + tag + "_form";
    }

    /**
     * 其他设置
     *
     * @param model
     * @return
     */
    @RequestMapping("setting")
    public String toSettingForm(Model model) {
        Setting setting = settingDao.selectSetting();
        model.addAttribute("setting", setting);
        return "back/form/setting_form";
    }

    /**
     * 更新设置信息
     *
     * @param setting
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "setting/update")
    public Result updateSetting(Setting setting) {
        setting.setModifyTime(new Date());
        int i = settingDao.updateSetting(setting);
        return new Result(i > 0 ? 0 : -1);
    }
}
