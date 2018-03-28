package org.jypj.dev.constant;

/**
 * @author
 * @create 2017-09-29 17:48
 **/
public interface BaseConstant {


    /**
     * 后台session名
     */
    String BACK_SESSION_USER = "user";
    /**
     * 导航菜单的sessionKey
     */
    String NAV_CONTENT_SESSION_NAME = "navContents";
    /**
     * 配置对象的key
     */
    String SETTING_SESSION_NAME = "config";
    /**
     * baseInfo的key
     */
    String BASE_INFO_NAME = "baseInfo";
    /**
     * 导航默认的父ID的值
     */
    String DEFAULT_PID = "0";
    /**
     * 导航地址的前缀
     */
    String NAV_URL_PRIFIX = "/back/form/main/";

    /**
     * 设置导航的常量
     */
    interface SettingNav {
        int ID = 9999;
        String PID = "0";
        String OTHER_SETTING_URL = "/back/form/setting";
        String NAME = "其他设置";
    }

    interface Tags {
        /**
         * index页面的标签
         */
        String INDEX_TAG = "index";
        /**
         * 分公司页面的TAG
         */
        String BRANCH_TAG = "branch";
        /**
         * 业务标签
         */
        String BUSINESS_TAG = "business";
        /**
         * 安华案例的标签
         */
        String CASE_TAG = "case";

        /**
         * 安华优势标签
         */
        String ADVANTAGE_TAG = "advantage";

        /**
         * 安华资质
         */
        String QUALIFICATION_TAG = "qualification";
    }
}
