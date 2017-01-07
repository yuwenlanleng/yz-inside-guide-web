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

import javax.naming.NamingException;

import com.nazca.inside.guide.action.common.AbstractAction;
import com.nazca.inside.guide.enums.GuideType;
import com.nazca.inside.guide.model.GuideItem;
import com.nazca.inside.guide.service.GuideItemService;

/**
 * 鑾峰緱GuideItemList鐨刟ction
 *
 * @author 璧垫椽鍧� <zhaohongkun@yzhtech.com>
 */
public class GetGuideItemListAction extends AbstractAction {

    private List<GuideItem> guideItemsWebs;
    private List<GuideItem> guideItemsSyss;
    private List<GuideItem> guideItemsDocs;
     /**
     * 鍦╨ist鏂规硶涓幏寰楅�氱敤鏈嶅姟缃戠珯銆佸伐鍏枫�佸父鐢ㄦ枃妗ｇ殑鏌ヨList
     *
     * @return 杩斿洖action璇嗗埆鐨勫瓧绗︿覆success
     * @throws NamingException
     */
    public String list() throws NamingException {
        guideItemsWebs = guideItemService.getGuideItemListByguideType(GuideType.web.name());
        guideItemsSyss = guideItemService.getGuideItemListByguideType(GuideType.sys.name());
        guideItemsDocs = guideItemService.getGuideItemListByguideType(GuideType.doc.name());
        return SUCCESS;
    }
    public List<GuideItem> getGuideItemsSyss() {
        return guideItemsSyss;
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

    public void setGuideItemService(GuideItemService guideItemService) {
        this.guideItemService = guideItemService;
    }

    private GuideItemService guideItemService = new GuideItemService();


    @Override
    public String execute() throws Exception {
        return super.execute(); //To change body of generated methods, choose Tools | Templates.
    }

}
