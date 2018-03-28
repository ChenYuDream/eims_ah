package org.jypj.dev.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.Gson;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author chenyu
 */
@Data
public class News implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private String id; //主键ID
    private String title; //标题
    private String subContent; //摘要
    private String contentText; //html内容
    private String showImgs; //展示图片
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime; //创建时间
    @JsonIgnore
    private Date updateTime; //修改时间
    private String contentType; //内容分类（案例，动态，业务，企业简介）
    private Integer sortOrder; //排序字段

}