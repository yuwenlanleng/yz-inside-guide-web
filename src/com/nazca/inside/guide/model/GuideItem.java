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
 * ����Ӣ���˴��ڲ�����ҳ�Ļ���ģ��
 *
 * @author �Ժ��� <zhaohongkun@yzhtech.com>
 */
@Entity
public class GuideItem implements Serializable {

    private static final long serialVersionUID = -6973443873720007931L;
    /**
     * ȷ��Ψһ�Ե�ID
     */
    private Integer id;
    /**
     * ������
     */
    private GuideType guideType;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
    
    /**
     * ��վ���ơ��������ƻ�����Ŀ����
     */
    private String name;
    /**
     * ��Ŀ����
     */
    private String des;
    /**
     * �������URL
     */
    private String innerUrl;
    /**
     * �������URL
     */
    private String outerUrl;
    /**
     * ƻ��ϵͳƽ̨����URL
     */
    private String downloadUrlForIos;
    /**
     * ��׿ϵͳƽ̨����URL
     */
    private String downloadUrlForAndroid;
    /**
     * ���Զ�����URL
     */
    private String downloadUrlForPc;
    /**
     * ����������ֶ�
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
