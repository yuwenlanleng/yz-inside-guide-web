/*
 * GuideItemDao.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 15:42:37
 */
package com.nazca.inside.guide.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.nazca.inside.guide.consts.GuideItemTable;
import com.nazca.inside.guide.enums.GuideType;
import com.nazca.inside.guide.model.GuideItem;

/**
 * 实现获得list的具体方法的类
 *
 * @author 赵洪坤 <zhaohongkun@yzhtech.com>
 */
@Component
public class GuideItemDao implements GuideItemTable {

	private HibernateTemplate hibernateTemplate;

	/**
	 * 从数据库获得页面显示的数据的list
	 *
	 * @param guideType
	 * @return 返回guideItemsList
	 */
	public List<GuideItem> queryList(String guideType) throws Exception {
		List<GuideItem> guideItemList = hibernateTemplate.find("from GuideItem c where c.guideType = ?",
				new Object[] { GuideType.valueOf(guideType) });
		return guideItemList;
	}

	public void deleteGuidItemById(int id) {
		hibernateTemplate.load(GuideItem.class, id);
		GuideItem guideItem = (GuideItem) hibernateTemplate.load(GuideItem.class, id);
		hibernateTemplate.delete(guideItem);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void addGuidItem(GuideItem guideItem) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(guideItem);
	}

	public GuideItem loadGuidItem(int id) {
		// TODO Auto-generated method stub
		return (GuideItem) hibernateTemplate.load(GuideItem.class, id);
	}

	public void updateGuidItem(GuideItem guideItem) {
		// TODO Auto-generated method stub
		System.out.println("Dao的名字："+guideItem.getDes());
		hibernateTemplate.update(guideItem);
	}

}
