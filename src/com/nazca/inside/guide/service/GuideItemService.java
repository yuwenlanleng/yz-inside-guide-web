/*
 * GuideItemService.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 17:42:37
 */
package com.nazca.inside.guide.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nazca.inside.guide.dao.GuideItemDao;
import com.nazca.inside.guide.model.GuideItem;

/**
 * �������GuideItemList�ĵ�service���ʵ�ֵ���
 *
 * @author �Ժ��� <zhaohongkun@yzhtech.com>
 */
@Component
public class GuideItemService {

	GuideItemDao guideItemDao;

	public GuideItemDao getGuideItemDao() {
		return guideItemDao;
	}

	@Resource
	public void setGuideItemDao(GuideItemDao guideItemDao) {
		this.guideItemDao = guideItemDao;
	}

	/**
	 * �������GuideItemList�ĵ�service���ʵ�ֵķ���
	 *
	 * @param guideType
	 *            �����������ֲ�ѯweb��doc��sys
	 * @return GuideItem��list
	 */
	public List<GuideItem> getGuideItemListByguideType(String guideType) {
		List<GuideItem> guideItemList = null;
		try {
			guideItemList = guideItemDao.queryList(guideType);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return guideItemList;
	}

	/**
	 * ɾ��ĳһ����¼
	 * 
	 * @param guideItemId
	 */
	public void deleteGuideItemById(int guideItemId) {
		guideItemDao.deleteGuidItemById(guideItemId);
	}

	/**
	 * ���һ����¼
	 * @param guideItem
	 */
	public void addGuideItem(GuideItem guideItem) {
		// TODO Auto-generated method stub
		guideItemDao.addGuidItem(guideItem);
	}

	public GuideItem loadById(int id) {
		// TODO Auto-generated method stub
		GuideItem guideItem	= guideItemDao.loadGuidItem(id);
		return guideItem;
	}

	public void updateGuideItem(GuideItem guideItem) {
		// TODO Auto-generated method stub
		guideItemDao.updateGuidItem(guideItem);
	}
}
