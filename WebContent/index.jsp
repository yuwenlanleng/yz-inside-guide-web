<%-- 
    Document   : index
    Created on : May 18, 2016, 5:06:47 PM
    Author     : 赵洪坤 <zhaohongkun@yzhtech.com>
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>英智兴达内部共享页</title>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.js"></script>
<!-- jquery基本js -->
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<!-- jqueryui js -->
<script type="text/javascript" src="js/index.js"></script>
<!-- 自定义js -->
<link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.css"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet" href="css/layout.css" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="css/colour.css" type="text/css"
	media="screen" charset="utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="img/yz_web_logo.ico"
	media="screen" />
</head>
<body id="body">

	<!-- 头部的内容 -->
	<div id="header">
		<div class="header_main">
			<h1>共享页</h1>
			<div class="header_search">
				<input type="text" name="search" class="search" />
			</div>
			<div class="header_button">
				<input type="button" value="查询" id="search_button" />
			</div>
			<div class="header_member">

				<a href="javascript:void(0)" id="reg_user">注册 |</a> <a
					href="javascript:void(0)" id="member">用户 |</a> <a
					href="javascript:void(0)" id="reg_a">添加 |</a> <a
					href="javascript:void(0)" id="login_a">登录 |</a> <a
					href="javascript:void(0)" id="logout">退出</a>
			</div>
		</div>
	</div>


	<div id="conten_div">
		<div id="head" class="head">英智兴达内部共享页</div>

		<!--服务资源显示区-->
		<div id="head2" class="head2">
			<s:property value="guideItemsWebs.{guideType}[0]" />
		</div>
		<div id="content" class="container_16 clearfix content">
			<div class="grid_16">
				<table id="tab">
					<thead>
						<tr>
							<th id="th1id" class="th1">名称</th>
							<th id="th2id" class="th2">描述</th>
							<th id="th3id" class="th3">内网入口</th>
							<th class="th4">外网入口</th>
							<th id="th5id" class="th5">下载</th>
							<th id="th5id" class="th6" colspan="2">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="guideItemsWebs" var="gw">
							<tr>
								<td id="td1" class="td1"><s:property value="#gw.name" /></td>
								<td id="desid"><s:property value="#gw.des" /></td>
								<td id="innerid" align="center"><s:if
										test="#gw.innerUrl != null and #gw.innerUrl != ''">
										<a href="<s:property value="#gw.innerUrl"/>" target="_blank">
											<img src="img/mouseouticon.png"
											onmouseover="this.src='img/mouseonicon.png'"
											onmouseout="this.src='img/mouseouticon.png'">
										</a>
									</s:if></td>
								<td id="outerid" align="center"><s:if
										test="#gw.outerUrl != null and #gw.outerUrl != ''">
										<a href="<s:property value="#gw.outerUrl"/>" target="_blank">
											<img src="img/mouseouticon.png"
											onmouseover="this.src='img/mouseonicon.png'"
											onmouseout="this.src='img/mouseouticon.png'">
										</a>
									</s:if></td>
								<td id="iosid" align="center">
									<!--当三种链接中任意两种为空的情况一下，默认用同一种图标--> <s:if
										test="(#gw.downloadUrlForIos == null or #gw.downloadUrlForIos == '') and (#gw.downloadUrlForAndroid == null or #gw.downloadUrlForAndroid == '') and (#gw.downloadUrlForPc != null and #gw.downloadUrlForPc != '')">
										<a href="<s:property value="#gw.downloadUrlForPc"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <s:if
										test="(#gw.downloadUrlForIos == null or #gw.downloadUrlForIos == '') and (#gw.downloadUrlForAndroid != null and #gw.downloadUrlForAndroid != '') and (#gw.downloadUrlForPc == null or #gw.downloadUrlForPc == '')">
										<a href="<s:property value="#gw.downloadUrlForAndroid"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <s:if
										test="(#gw.downloadUrlForIos != null and #gw.downloadUrlForIos != '') and (#gw.downloadUrlForAndroid == null or #gw.downloadUrlForAndroid == '') and (#gw.downloadUrlForPc == null or #gw.downloadUrlForPc == '')">
										<a href="<s:property value="#gw.downloadUrlForIos"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <!--三种链接中任意两种不为空，使用各自匹配的图标--> <s:if
										test="#gw.downloadUrlForIos != null and #gw.downloadUrlForIos != '' and ((#gw.downloadUrlForAndroid != null and #gw.downloadUrlForAndroid != '') or (#gw.downloadUrlForPc != null and #gw.downloadUrlForPc != ''))">
										<a href="<s:property value="#gw.downloadUrlForIos"/>"
											target="_blank"> <img id="hrefimg"
											src="img/iosmouseouticon.png"
											onmouseover="this.src='img/iosmouseonicon.png'"
											onmouseout="this.src='img/iosmouseouticon.png'">
										</a>
									</s:if> <s:if
										test="#gw.downloadUrlForAndroid != null and #gw.downloadUrlForAndroid != '' and((#gw.downloadUrlForIos != null and #gw.downloadUrlForIos != '') or(#gw.downloadUrlForPc != null and #gw.downloadUrlForPc != ''))">
										<a href="<s:property value="#gw.downloadUrlForAndroid"/>"
											target="_blank"> <img id="hrefimg"
											src="img/androidmouseouticon.png"
											onmouseover="this.src='img/androidmouseonicon.png'"
											onmouseout="this.src='img/androidmouseouticon.png'">
										</a>
									</s:if> <s:if
										test="#gw.downloadUrlForPc != null and #gw.downloadUrlForPc != '' and ((#gw.downloadUrlForIos != null and #gw.downloadUrlForIos != '') or (#gw.downloadUrlForAndroid != null and #gw.downloadUrlForAndroid != ''))">
										<a href="<s:property value="#gw.downloadUrlForPc"/>"
											target="_blank"> <img id="hrefimg"
											src="img/pcmouseouticon.png"
											onmouseover="this.src='img/pcmouseonicon.png'"
											onmouseout="this.src='img/pcmouseouticon.png'">
										</a>
									</s:if>
								</td>

								<td><a href="update?id=<s:property value="#gw.id"/>"> <img
										src="img/update.png"
										onmouseover="this.src='img/update_on.png'"
										onmouseout="this.src='img/update.png'">
								</a></td>
								<td><a href="delete?id=<s:property value="#gw.id"/>"> <img
										src="img/delete.png"
										onmouseover="this.src='img/delete_on.png'"
										onmouseout="this.src='img/delete.png'">
								</a></td>
							</tr>
						</s:iterator>

					</tbody>
				</table>
			</div>
		</div>

		<!--工具显示区-->
		<div id="head3" class="head3">
			<s:property value="guideItemsSyss.{guideType}[0]" />
		</div>
		<div id="content" class="container_16 clearfix content">
			<div class="grid_16">
				<table id="tab">
					<thead>
						<tr>
							<th id="th1id" class="th1">名称</th>
							<th id="th2id" class="th2">描述</th>
							<th id="th3id" class="th3">内网入口</th>
							<th class="th4">外网入口</th>
							<th id="th5id" class="th5">下载</th>
							<th id="th5id" class="th6" colspan="3">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="guideItemsSyss" var="gs">
							<tr>
								<td id="td1" class="td1"><s:property value="#gs.name" /></td>
								<td id="desid"><s:property value="#gs.des" /></td>
								<td id="innerid" align="center"><s:if
										test="#gs.innerUrl != null and #gs.innerUrl != ''">
										<a href="<s:property value="#gs.innerUrl"/>" target="_blank">
											<img src="img/mouseouticon.png"
											onmouseover="this.src='img/mouseonicon.png'"
											onmouseout="this.src='img/mouseouticon.png'">
										</a>
									</s:if></td>
								<td id="outerid" align="center"><s:if
										test="#gs.outerUrl != null and #gs.outerUrl != ''">
										<a href="<s:property value="#gs.outerUrl"/>" target="_blank">
											<img src="img/mouseouticon.png"
											onmouseover="this.src='img/mouseonicon.png'"
											onmouseout="this.src='img/mouseouticon.png'">
										</a>
									</s:if></td>
								<td id="iosid" align="center">
									<!--当三种链接中任意两种为空的情况一下，默认用同一种图标--> <s:if
										test="(#gs.downloadUrlForIos == null or #gs.downloadUrlForIos == '') and (#gs.downloadUrlForAndroid == null or #gs.downloadUrlForAndroid == '') and (#gs.downloadUrlForPc != null and #gs.downloadUrlForPc != '')">
										<a href="<s:property value="#gs.downloadUrlForPc"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <s:if
										test="(#gs.downloadUrlForIos == null or #gs.downloadUrlForIos == '') and (#gs.downloadUrlForAndroid != null and #gs.downloadUrlForAndroid != '') and (#gs.downloadUrlForPc == null or #gs.downloadUrlForPc == '')">
										<a href="<s:property value="#gs.downloadUrlForAndroid"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <s:if
										test="(#gs.downloadUrlForIos != null and #gs.downloadUrlForIos != '') and (#gs.downloadUrlForAndroid == null or #gs.downloadUrlForAndroid == '') and (#gs.downloadUrlForPc == null or #gs.downloadUrlForPc == '')">
										<a href="<s:property value="#gs.downloadUrlForIos"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <!--三种链接中任意两种不为空，使用各自匹配的图标--> <s:if
										test="#gs.downloadUrlForIos != null and #gs.downloadUrlForIos != '' and ((#gs.downloadUrlForAndroid != null and #gs.downloadUrlForAndroid != '') or (#gs.downloadUrlForPc != null and #gs.downloadUrlForPc != ''))">
										<a href="<s:property value="#gs.downloadUrlForIos"/>"
											target="_blank"> <img id="hrefimg"
											src="img/iosmouseouticon.png"
											onmouseover="this.src='img/iosmouseonicon.png'"
											onmouseout="this.src='img/iosmouseouticon.png'">
										</a>
									</s:if> <s:if
										test="#gs.downloadUrlForAndroid != null and #gs.downloadUrlForAndroid != '' and((#gs.downloadUrlForIos != null and #gs.downloadUrlForIos != '') or(#gs.downloadUrlForPc != null and #gs.downloadUrlForPc != ''))">
										<a href="<s:property value="#gs.downloadUrlForAndroid"/>"
											target="_blank"> <img id="hrefimg"
											src="img/androidmouseouticon.png"
											onmouseover="this.src='img/androidmouseonicon.png'"
											onmouseout="this.src='img/androidmouseouticon.png'">
										</a>
									</s:if> <s:if
										test="#gs.downloadUrlForPc != null and #gs.downloadUrlForPc != '' and ((#gs.downloadUrlForIos != null and #gs.downloadUrlForIos != '') or (#gs.downloadUrlForAndroid != null and #gs.downloadUrlForAndroid != ''))">
										<a href="<s:property value="#gs.downloadUrlForPc"/>"
											target="_blank"> <img id="hrefimg"
											src="img/pcmouseouticon.png"
											onmouseover="this.src='img/pcmouseonicon.png'"
											onmouseout="this.src='img/pcmouseouticon.png'">
										</a>
									</s:if>
								</td>

								<td><a href="update?id=<s:property value="#gs.id"/>"> <img
										src="img/update.png"
										onmouseover="this.src='img/update_on.png'"
										onmouseout="this.src='img/update.png'">
								</a></td>
								<td><a href="delete?id=<s:property value="#gs.id"/>"> <img
										src="img/delete.png"
										onmouseover="this.src='img/delete_on.png'"
										onmouseout="this.src='img/delete.png'">
								</a></td>
							</tr>
						</s:iterator>

					</tbody>
				</table>
			</div>
		</div>

		<!--常用文档显示区-->
		<div id="head4" class="head4">
			<s:property value="guideItemsDocs.{guideType}[0]" />
		</div>
		<div id="content" class="container_16 clearfix content">
			<div class="grid_16">
				<table id="tab">
					<thead>
						<tr>
							<th id="th1id" class="th1">名称</th>
							<th id="th2id" class="th2">描述</th>
							<th id="th3id" class="th3">内网入口</th>
							<th class="th4">外网入口</th>
							<th id="th5id" class="th5">下载</th>
							<th id="th5id" class="th6" colspan="3">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="guideItemsDocs" var="gd">
							<tr>
								<td id="td1" class="td1"><s:property value="#gd.name" /></td>
								<td id="desid"><s:property value="#gd.des" /></td>
								<td id="innerid" align="center"><s:if
										test="#gd.innerUrl != null and #gd.innerUrl != ''">
										<a href="<s:property value="#gd.innerUrl"/>" target="_blank">
											<img src="img/mouseouticon.png"
											onmouseover="this.src='img/mouseonicon.png'"
											onmouseout="this.src='img/mouseouticon.png'">
										</a>
									</s:if></td>
								<td id="outerid" align="center"><s:if
										test="#gd.outerUrl != null and #gd.outerUrl != ''">
										<a href="<s:property value="#gd.outerUrl"/>" target="_blank">
											<img src="img/mouseouticon.png"
											onmouseover="this.src='img/mouseonicon.png'"
											onmouseout="this.src='img/mouseouticon.png'">
										</a>
									</s:if></td>
								<td id="iosid" align="center">
									<!--当三种链接中任意两种为空的情况一下，默认用同一种图标--> <s:if
										test="(#gd.downloadUrlForIos == null or #gd.downloadUrlForIos == '') and (#gd.downloadUrlForAndroid == null or #gd.downloadUrlForAndroid == '') and (#gd.downloadUrlForPc != null and #gd.downloadUrlForPc != '')">
										<a href="<s:property value="#gd.downloadUrlForPc"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <s:if
										test="(#gd.downloadUrlForIos == null or #gd.downloadUrlForIos == '') and (#gd.downloadUrlForAndroid != null and #gd.downloadUrlForAndroid != '') and (#gd.downloadUrlForPc == null or #gd.downloadUrlForPc == '')">
										<a href="<s:property value="#gd.downloadUrlForAndroid"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <s:if
										test="(#gd.downloadUrlForIos != null and #gd.downloadUrlForIos != '') and (#gd.downloadUrlForAndroid == null or #gd.downloadUrlForAndroid == '') and (#gd.downloadUrlForPc == null or #gd.downloadUrlForPc == '')">
										<a href="<s:property value="#gd.downloadUrlForIos"/>"
											target="_blank"> <img src="img/mobileouticon.png"
											onmouseover="this.src='img/mobileonicon.png'"
											onmouseout="this.src='img/mobileouticon.png'">
										</a>
									</s:if> <!--三种链接中任意两种不为空，使用各自匹配的图标--> <s:if
										test="#gd.downloadUrlForIos != null and #gd.downloadUrlForIos != '' and ((#gd.downloadUrlForAndroid != null and #gd.downloadUrlForAndroid != '') or (#gd.downloadUrlForPc != null and #gd.downloadUrlForPc != ''))">
										<a href="<s:property value="#gd.downloadUrlForIos"/>"
											target="_blank"> <img id="hrefimg"
											src="img/iosmouseouticon.png"
											onmouseover="this.src='img/iosmouseonicon.png'"
											onmouseout="this.src='img/iosmouseouticon.png'">
										</a>
									</s:if> <s:if
										test="#gd.downloadUrlForAndroid != null and #gd.downloadUrlForAndroid != '' and((#gd.downloadUrlForIos != null and #gd.downloadUrlForIos != '') or(#gd.downloadUrlForPc != null and #gd.downloadUrlForPc != ''))">
										<a href="<s:property value="#gd.downloadUrlForAndroid"/>"
											target="_blank"> <img id="hrefimg"
											src="img/androidmouseouticon.png"
											onmouseover="this.src='img/androidmouseonicon.png'"
											onmouseout="this.src='img/androidmouseouticon.png'">
										</a>
									</s:if> <s:if
										test="#gd.downloadUrlForPc != null and #gd.downloadUrlForPc != '' and ((#gd.downloadUrlForIos != null and #gd.downloadUrlForIos != '') or (#gd.downloadUrlForAndroid != null and #gd.downloadUrlForAndroid != ''))">
										<a href="<s:property value="#gd.downloadUrlForPc"/>"
											target="_blank"> <img id="hrefimg"
											src="img/pcmouseouticon.png"
											onmouseover="this.src='img/pcmouseonicon.png'"
											onmouseout="this.src='img/pcmouseouticon.png'">
										</a>
									</s:if>
								</td>
								<td><a href="<s:property value="#gd.downloadUrlForPc"/>"
									target="_blank"> <img id="hrefimg"
										src="img/pcmouseouticon.png"
										onmouseover="this.src='img/pcmouseonicon.png'"
										onmouseout="this.src='img/pcmouseouticon.png'">
								</a></td>

								<td><a href="update?id=<s:property value="#gd.id"/>"> <img
										src="img/update.png"
										onmouseover="this.src='img/update_on.png'"
										onmouseout="this.src='img/update.png'">
								</a></td>
								<td><a href="delete?id=<s:property value="#gd.id"/>"> <img
										src="img/delete.png"
										onmouseover="this.src='img/delete_on.png'"
										onmouseout="this.src='img/delete.png'">
								</a></td>
							</tr>
						</s:iterator>

					</tbody>
				</table>
			</div>
		</div>



		<!--显示底部背景图片-->
		<br id="brid"> <br id="brid">
	</div>
	<br id="brid">
	<br id="brid">

	<!-- //添加资源form -->
	<form id="reg">
		<ol class="resouce_error"></ol>
		<table>
			<tr>
				<td align="right"><label for="user"> 名称：</label></td>
				<td><input type="text" name="guideItem.name" class="text"
					id="name" /> <span class="star">*</span></td>
			</tr>
			<tr>
				<td align="right"><label for="user"> 类型：</label></td>
				<td><input type="text" name="guideItem.guideType" class="text"
					id="guideType" /> <span class="star">*</span></td>
			</tr>
			<tr>
				<td align="right"><label for="des"> 描述：</label></td>
				<td><input type="text" name="guideItem.des" class="text"
					id="des" /> <span class="star">*</span></td>
			</tr>
			<tr>
				<td align="right"><label for="innerUrl"> 内网入口：</label></td>
				<td><input type="text" name="guideItem.innerUrl" class="text"
					id="innerUrl" /> <span class="star">*</span></td>
			</tr>

			<tr>
				<td align="right"><label for="outerUrl"> 外网入口：</label></td>
				<td><input type="text" name="guideItem.outerUrl" class="text"
					id="outerUrl" /> <span class="star">*</span></td>
			</tr>
			<tr>
				<td align="right"><label for="email">电脑端下载：</label></td>
				<td><input type="text" name="guideItem.downloadUrlForPc"
					class="text" id="downloadUrlForPc" /> <span class="star">*</span>
				</td>
			</tr>
			<tr>
				<td align="right"><label for="email">苹果端下载：</label></td>
				<td><input type="text" name="guideItem.downloadUrlForIos"
					class="text" id="downloadUrlForIos" /> <span class="star">*</span>
				</td>
			</tr>
			<tr>
				<td align="right"><label for="email">手机端下载：</label></td>
				<td><input type="text" name="guideItem.downloadUrlForAndroid"
					class="text" id="downloadUrlForAndroid" /> <span class="star">*</span>
				</td>
			</tr>
		</table>
	</form>

	<!-- 添加用户form -->

	<form id="regUser">
		<ol class="reg_error"></ol>
		<p>
			<label for="user">帐号：</label> <input type="text" name="user.userName"
				class="text" id="user" /> <span class="star">*</span>
		</p>
		<p>
			<label for="pass">密码：</label> <input type="password"
				name="user.passWord" class="text" id="pass" /> <span class="star">*</span>
		</p>
		<p>
			<label for="email">邮箱：</label> <input type="text" name="user.email"
				class="text" id="email" /> <span class="star">*</span>
		</p>
		<p>
			<label>性别：</label> <input type="radio" name="user.sex" value="male"
				id="male" checked="checked"><label for="male">男</label></input><input
				type="radio" name="sex" value="female" id="female"><label
				for="female">女</label></input>
		</p>
		<p>
			<label for="date">生日：</label> <input type="text" name="user.date"
				readonly="readonly" class="text" id="date" />
		</p>
	</form>

	<!-- 登录表单 -->
	<form id="login" title="会员登录">
		<ol class="login_error"></ol>
		<p>
			<label for="user">帐号：</label> <input type="text" name="user.userName"
				class="text" id="login_user" /> <span class="star">*</span>
		</p>
		<p>
			<label for="pass">密码：</label> <input type="password"
				name="user.passWord" class="text" id="login_pass" /> <span
				class="star">*</span>
		</p>
		<p>
			<input type="checkbox" name="expires" id="expires" checked="checked" /><label
				for="expires">登录后有效期一周</label>
		</p>
	</form>

	<div id="loading">数据交互中...</div>
</body>
</html>
