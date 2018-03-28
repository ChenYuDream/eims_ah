package org.jypj.dev.dao;

import org.jypj.dev.model.Setting;

/**
 * @author ChenYu
 */
public interface SettingDao {

    /**
     * 查询设置信息
     * @return
     */
    Setting selectSetting();

    /**
     * 更新设置信息
     * @param setting
     * @return
     */
    int updateSetting(Setting setting);
}
