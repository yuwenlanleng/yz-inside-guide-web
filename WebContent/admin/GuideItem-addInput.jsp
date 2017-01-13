<%@page import="com.nazca.inside.guide.enums.GuideType"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'guideItem_input.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div id="reg" title="会员注册">
	<form action="addGuideItem" method="post">
		<table>
			<tr>
				<td align="right">类别:</td>
				<td><select name="guideItem.guideType">
						<option value="doc">服务资源</option>
						<option value="sys">管理系统</option>
						<option value="web">常用文档</option>
				</select></td>
			</tr>
			<tr>
				<td align="right">名称:</td>
				<td><input type="text" name="guideItem.name" /></td>
			</tr>
			<tr>
				<td align="right">描述:</td>
				<td><textarea name="guideItem.des"></textarea></td>
			</tr>
			<tr>
				<td align="right">内网入口:</td>
				<td><input type="text" name="guideItem.innerUrl" /></td>
			</tr>
			<tr>
				<td align="right">外网入口:</td>
				<td><input type="text" name="guideItem.outerUrl" /></td>
			</tr>
			<tr>
				<td align="right">苹果下载地址:</td>
				<td><input type="text" name="guideItem.downloadUrlForIos" /></td>
			</tr>
			<tr>
				<td align="right">安卓下载地址:</td>
				<td><input type="text" name="guideItem.downloadUrlForAndroid" />
				</td>
			</tr>
			<tr>
				<td align="right">电脑下载地址:</td>
				<td><input type="text" name="guideItem.downloadUrlForPc" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="add" /></td>
			</tr>
		</table>
	</form>


		表单区--会员注册
	</div>
	
</body>
</html>
