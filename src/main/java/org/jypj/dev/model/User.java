package org.jypj.dev.model;

import com.google.gson.Gson;
import lombok.Builder;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

/**
 * 用户表
 *
 * @author chenyu
 */
@Data
public class User implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private String id; //主键
    private String userNum; //人员编号(工号)
    private String userName; //用户姓名
    private String password; //密码
    private String passwordMd5; //MD加密密码
    private String roleType; //角色类型
    private String createDate; //创建时间

    @Override
    public String toString() {

        return new Gson().toJson(this);
    }

}