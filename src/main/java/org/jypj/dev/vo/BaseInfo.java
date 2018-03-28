package org.jypj.dev.vo;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * 基本信息
 * @author yu_chen
 * @create 2017-10-19 15:02
 **/
@Data
public class BaseInfo {
    /**
     * 文件服务器地址
     */
    private String fileServerPath;

}
