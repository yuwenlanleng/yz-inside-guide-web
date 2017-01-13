/*
 * GetGuideItemListAction.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 02:42:37
 */
package com.nazca.inside.guide.action;

import java.util.List;

import javax.annotation.Resource;
import javax.naming.NamingException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nazca.inside.guide.action.common.AbstractAction;
import com.nazca.inside.guide.enums.GuideType;
import com.nazca.inside.guide.model.GuideItem;
import com.nazca.inside.guide.service.GuideItemService;

/**
 * 获得GuideItemList的action
 *
 * @author 赵洪坤 <zhaohongkun@yzhtech.com>
 */
@Component("guideItemAction")
@Scope("prototype")
public class GuideItemAction extends AbstractAction {

	private List<GuideItem> guideItemsWebs;
	private List<GuideItem> guideItemsSyss;
	private List<GuideItem> guideItemsDocs;
	private GuideItemService guideItemService;
	private int id;
	private GuideItem guideItem;

	public GuideItem getGuideItem() {
		return guideItem;
	}

	public void setGuideItem(GuideItem guideItem) {
		this.guideItem = guideItem;
		System.out.println("名字是："+this.guideItem.getName());
	}
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 在list方法中获得通用服务网站、工具、常用文档的查询List
	 *
	 * @return 返回action识别的字符串success
	 * @throws NamingException
	 */
	public String list() throws NamingException {
		guideItemsWebs = guideItemService.getGuideItemListByguideType(GuideType.web.name());
		guideItemsSyss = guideItemService.getGuideItemListByguideType(GuideType.sys.name());
		guideItemsDocs = guideItemService.getGuideItemListByguideType(GuideType.doc.name());
		return SUCCESS;
	}

	/**
	 * 刪除某一条记录
	 * 
	 * @return
	 */
	public String deleteGuideItem() {
		guideItemService.deleteGuideItemById(id);
		return SUCCESS;
	}

	/**
	 * 添加一条记录
	 * 
	 * @return
	 */
	public String addGuideItem() {
		guideItemService.addGuideItem(guideItem);
		return SUCCESS;
	}
	/**
	 * 更改一条记录
	 * 
	 * @return
	 */
	public String updateGuideItem() {
		guideItemService.updateGuideItem(guideItem);
		return SUCCESS;
	}

	public List<GuideItem> getGuideItemsSyss() {
		return guideItemsSyss;
	}

	/**
	 * 添加跳转
	 * 
	 * @return
	 */
	public String addInput() {

		return INPUT;
	}

	/**
	 * 更新一条记录
	 * 
	 * @return
	 */
	public String updateInput() {
		this.guideItem = this.guideItemService.loadById(id);
		return INPUT;
	}

	public void setGuideItemsSyss(List<GuideItem> guideItemsSyss) {
		this.guideItemsSyss = guideItemsSyss;
	}

	public List<GuideItem> getGuideItemsDocs() {
		return guideItemsDocs;
	}

	public void setGuideItemsDocs(List<GuideItem> guideItemsDocs) {
		this.guideItemsDocs = guideItemsDocs;
	}

	public List<GuideItem> getGuideItemsWebs() {
		return guideItemsWebs;
	}

	public void setguideItemsWebs(List<GuideItem> guideItemsWebs) {
		this.guideItemsWebs = guideItemsWebs;
	}

	public List<GuideItem> getguideItemsSyss() {
		return guideItemsSyss;
	}

	public void setguideItemsSyss(List<GuideItem> guideItemsSyss) {
		this.guideItemsSyss = guideItemsSyss;
	}

	public List<GuideItem> getguideItemsDocs() {
		return guideItemsDocs;
	}

	public void setguideItemsDocs(List<GuideItem> guideItemsDocs) {
		this.guideItemsDocs = guideItemsDocs;
	}

	public GuideItemService getGuideItemService() {
		return guideItemService;
	}

	@Resource
	public void setGuideItemService(GuideItemService guideItemService) {
		this.guideItemService = guideItemService;
	}

	@Override
	public String execute() throws Exception {
		return super.execute(); // To change body of generated methods, choose
								// Tools | Templates.
	}

}
