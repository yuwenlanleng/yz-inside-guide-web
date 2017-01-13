/*
 * GetGuideItemListAction.java
 * 
 * Copyright(c) 2007-2016 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2016-05-17 02:42:37
 */
package com.nazca.inside.guide.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.nazca.inside.guide.action.common.AbstractAction;
import com.nazca.inside.guide.model.User;
import com.nazca.inside.guide.service.UserService;

/**
 * 获得GuideItemList的action
 *
 * @author 赵洪坤 <zhaohongkun@yzhtech.com>
 */
@Component("userAction")
@Scope("prototype")
public class UserAction extends AbstractAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private int id;
	private User user;

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	/**
	 * 添加一条记录
	 * 
	 * @return
	 */
	public String addUser() {
		userService.addUser(user);
		return SUCCESS;
	}
	
	/**
	 * 添加时检查用户名是否存在
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String checkUserName() throws IOException {
		String check = userService.checkUserName(user);

        HttpServletResponse response = ServletActionContext.getResponse(); 

        response.setContentType("text/plain;charset=UTF-8"); 

        response.getWriter().write(check); 

        return null; 
	}
	
	/**
	 * 登录时检查用户名是否存在
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String checkLogin() throws IOException {
		String check = userService.checkLogin(user);
		
		HttpServletResponse response = ServletActionContext.getResponse(); 
		
		response.setContentType("text/plain;charset=UTF-8"); 
		
		response.getWriter().write(check); 
		
		return null; 
	}
	
	public UserService getUserService() {
		return userService;
	}
	
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	@Override
	public String execute() throws Exception {
		return super.execute(); // To change body of generated methods, choose
								// Tools | Templates.
	}

}
