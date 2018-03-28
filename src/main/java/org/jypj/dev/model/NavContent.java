package org.jypj.dev.model;

import com.google.gson.Gson;
import lombok.Data;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

/**
 * 导航内容表
 *
 * @author chenyu
 */
@Data
public class NavContent implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private int id; //主键ID
    private String tag; //标签 用于路由
    private String navName; //导航名称
    private String bannerUrls; //banner图片地址
    private String bannerTitle; //banner标题
    private String cnDesc; //中文描述
    private String enDesc; //英文描述
    private String content; //页面内容
    private String isEnable; //0不启用，1启用
    private Date createTime; //具体时间
    private Date modifyTime; //修改时间
    private Integer sortOrder; //排序
    /**
     * ==用于导航显示用
     */
    private String pid;
    private String url;
    private String name;

    /**
     * 分公司
     */
    private List<News> branchList;

    public NavContent() {
    }

    public NavContent(int id, String pid, String url, String name) {
        this.id = id;
        this.pid = pid;
        this.url = url;
        this.name = name;
    }


    @Override
    public String toString() {

        return new Gson().toJson(this);
    }

}