/*
 * GuideItemConst.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 14:48:13
 */
package com.nazca.inside.guide.consts;

/**
 * ����Ŀ��
 *
 * @author �Ժ��� <zhaohongkun@yzhtech.com>
 */
    public interface GuideItemTable{ 
         String TABLE_NAME = "guideitem";
         /**
          * ������
          */
         String GUIDE_TYPE = "guide_type";
         /**
          * ����������ֶ�
          */
         String SORT_ORDER = "sort_order";
         /**
          * ȷ��Ψһ�Ե�ID
          */
         String ID ="id";
         /**
          * ��վ���ơ��������ƻ�����Ŀ����
          */
         String NAME = "name";
         /**
          * ��Ŀ����
          */
         String DES = "des";
         /**
          * �������URL
          */
         String INNER_URL = "inner_url";
         /**
          * �������URL
          */
         String OUTER_URL = "outer_url";
         /**
          * ƻ��ϵͳƽ̨����URL
          */
         String DOWNLOAD_URL_FORIOS = "download_url_forios";
         /**
          * ��׿ϵͳƽ̨����URL
          */
         String DOWNLOAD_URL_FORANDROID = "download_url_forandroid";
         /**
          * ���Զ�����URL
          */
         String DOWNLOAD_URL_FORPC = "download_url_forpc";
    }

