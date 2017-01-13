/*
 * GuideItemService.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 17:42:37
 */
package com.nazca.inside.guide.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.nazca.inside.guide.dao.UserDao;
import com.nazca.inside.guide.model.User;

/**
 * 用来获得GuideItemList的的service层的实现的类
 *
 * @author 赵洪坤 <zhaohongkun@yzhtech.com>
 */
@Component
public class UserService {

	UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	public void addUser(User user) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	public String checkUserName(User user) {
		// TODO Auto-generated method stub
		String result2 = userDao.getUserByUserName(user);
		return result2;
	}

	public String checkLogin(User user) {
		// TODO Auto-generated method stub
		String result1 = userDao.checkLogin(user);
		return result1;
	}

	public String checkLoginName(User user) {
		// TODO Auto-generated method stub
		String result3 = userDao.checkLoginName(user);
		return result3;
	}
}
