/*
 * GuideItem.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 10:55:31
 */
package com.nazca.inside.guide.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.nazca.inside.guide.enums.GuideType;

/**
 * 创建英智兴达内部共享页的基础模型
 *
 * @author 赵洪坤 <zhaohongkun@yzhtech.com>
 */
@Entity
public class GuideItem implements Serializable {

    private static final long serialVersionUID = -6973443873720007931L;
    /**
     * 确定唯一性的ID
     */
    private Integer id;
    /**
     * 向导类型
     */
    private GuideType guideType;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
    
    /**
     * 网站名称、工具名称或者项目名称
     */
    private String name;
    /**
     * 项目描述
     */
    private String des;
    /**
     * 内网入口URL
     */
    private String innerUrl;
    /**
     * 外网入口URL
     */
    private String outerUrl;
    /**
     * 苹果系统平台下载URL
     */
    private String downloadUrlForIos;
    /**
     * 安卓系统平台下载URL
     */
    private String downloadUrlForAndroid;
    /**
     * 电脑端下载URL
     */
    private String downloadUrlForPc;
    /**
     * 用于排序的字段
     */
    private int sortOrder;
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    
    @Enumerated(EnumType.STRING)
    @Column(name="guide_type")
    public GuideType getGuideType() {
        return guideType;
    }
    
    public void setGuideType(GuideType guideType) {
        this.guideType = guideType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }
    
    @Column(name="inner_url")
    public String getInnerUrl() {
        return innerUrl;
    }

    public void setInnerUrl(String innerUrl) {
        this.innerUrl = innerUrl;
    }

    @Column(name="outer_url")
    public String getOuterUrl() {
        return outerUrl;
    }

    public void setOuterUrl(String outerUrl) {
        this.outerUrl = outerUrl;
    }
    
    @Column(name="download_url_forios")
    public String getDownloadUrlForIos() {
        return downloadUrlForIos;
    }

    public void setDownloadUrlForIos(String downloadUrlForIos) {
        this.downloadUrlForIos = downloadUrlForIos;
    }
    
    @Column(name="download_url_forandroid")
    public String getDownloadUrlForAndroid() {
        return downloadUrlForAndroid;
    }

    public void setDownloadUrlForAndroid(String downloadUrlForAndroid) {
        this.downloadUrlForAndroid = downloadUrlForAndroid;
    }
    
    @Column(name="download_url_forpc")
    public String getDownloadUrlForPc() {
        return downloadUrlForPc;
    }

    public void setDownloadUrlForPc(String downloadUrlForPc) {
        this.downloadUrlForPc = downloadUrlForPc;
    }
    
    @Column(name="sort_order")
    public int getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 89 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final GuideItem other = (GuideItem) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "GuideItem{" + "id=" + id + ", guideType=" + guideType + ", name=" + name + '}';
    }

}
