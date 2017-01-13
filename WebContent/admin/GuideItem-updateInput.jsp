<%@page import="com.nazca.inside.guide.enums.GuideType"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	<form action="updateGuideItem" method="post">
		<table>
			<tr>
				<td align="right">类别:</td>
				<td><input type= "hidden" name="guideItem.id" value="<s:property value='guideItem.id'/>"/>
				<select name="guideItem.guideType">
						<!--三种链接中任意两种不为空，使用各自匹配的图标-->
						<s:if test="<s:property value='guideItem.guideType'/> == '常用文档'">
							<option value="doc" selected="selected">常用文档源</option>
						</s:if>
						<s:else>
							<option value="doc">常用文档</option>
						</s:else>
						<s:if test="<s:property value='guideItem.guideType'/> == '管理系统'">
							<option value="sys" selected="selected">管理系统</option>
						</s:if>
						<s:else>
							<option value="sys">管理系统</option>
						</s:else>
						<s:if test="<s:property value='guideItem.guideType'/> == '服务资源'">
							<option value="web" selected="selected">服务资源</option>
						</s:if>
						<s:else>
							<option value="web">服务资源</option>
						</s:else>
				</select></td>
			</tr>
			<tr>
				<td align="right">名称:</td>
				<td><input type="text" name="guideItem.name"
					value="<s:property value='guideItem.name'/> "/></td>
			</tr>
			<!-- <tr><td></td><td><s:property value="guideItem.name" /></td></tr>
			<tr><td></td><td><s:property value="guideItem.name" /></td></tr>
			<tr><td></td><td><s:property value="guideItem.name" /></td></tr> -->
			<tr>
				<td align="right">描述:</td>
				<td><textarea name="guideItem.des"
						><s:property value="guideItem.des"/></textarea></td>
			</tr>
			<tr>
				<td align="right">内网入口:</td>
				<td><input type="text" name="guideItem.innerUrl"
					value="<s:property value='guideItem.innerUrl'/>"/></td>
			</tr>
			<tr>
				<td align="right">外网入口:</td>
				<td><input type="text" name="guideItem.outerUrl"
					value="<s:property value='guideItem.outerUrl'/>" /></td>
			</tr>
			<tr>
				<td align="right">苹果下载地址:</td>
				<td><input type="text" name="guideItem.downloadUrlForIos"
					value="<s:property value='guideItem.downloadUrlForIos'/>" /></td>
			</tr>
			<tr>
				<td align="right">安卓下载地址:</td>
				<td><input type="text" name="guideItem.downloadUrlForAndroid"
					value="<s:property value='guideItem.downloadUrlForAndroid'/>" /></td>
			</tr>
			<tr>
				<td align="right">电脑下载地址:</td>
				<td><input type="text" name="guideItem.downloadUrlForPc"
					value="<s:property value='guideItem.downloadUrlForPc'/>" /></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="add" /></td>
			</tr>
		</table>
		
	</form>
	<s:debug></s:debug>
</body>
</html>
