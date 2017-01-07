/*
 * GuideType.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 11:11:08
 */
package com.nazca.inside.guide.enums;

/**
 * 鍒涘缓GuideType涓夌绫诲瀷鐨勬灇涓鹃泦鍚�
 *
 * @author 璧垫椽鍧� <zhaohongkun@yzhtech.com>
 */
public enum GuideType {
    web {
        @Override
        public String toString() {
            return "服务资源显示区";
        }
    },
    sys {
        @Override
        public String toString() {
            return "工具显示区";
        }
    },
    doc {
        @Override
        public String toString() {
            return "常用文档显示";
        }
    }
}
