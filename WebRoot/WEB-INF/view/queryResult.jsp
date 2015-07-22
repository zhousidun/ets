<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网络在线考试</title>
</head>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td height="131" background="${path}/image/top_bg.jpg">&nbsp;</td>
</tr>
</table>

<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
<tr>
    <td valign="top" bgcolor="#FFFFFF">
	<table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
    <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
           	<td width="76%" class="word_grey">
           	&nbsp;
           	<img src="${path}/image/f_ico.gif" width="8" height="8">
           	 当前位置：→ <span class="word_darkGrey">
           	 考生成绩查询 &gt;&gt;&gt;</span>
           	</td>
			<td width="24%" align="right">
			<img src="${path}/image/m_ico1.gif" width="5" height="9">
			<a href="${path }/goHomepage.do" >返回首页</a>&nbsp;</td>
        </tr>
        </table>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top">
 		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  		<tr>
    		<td width="84%">&nbsp;</td>
		</tr>
		</table> 
		<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
  		<tr align="center">
		    <td width="21%" height="27" bgcolor="#B2D6F1">准考证号</td>
			<td width="26%" bgcolor="#B2D6F1">所属课程</td>
			<td width="22%" bgcolor="#B2D6F1">考试时间</td>
			<td width="11%" bgcolor="#B2D6F1">单选题分数</td>
			<td width="11%" bgcolor="#B2D6F1">多选题分数</td>
		    <td width="9%" bgcolor="#B2D6F1">合计分数</td>
  		</tr>
		<c:forEach items="${stuResults }" var="sr">
  		<tr>
		    <td style="padding:5px;">${sr.student.id }</td>
			<td style="padding:5px;">${sr.paper.lesson.name }</td>
			<td align="center">${sr.joinTime }</td>
			<td align="center">${sr.resSingle }</td>
		    <td align="center">${sr.resMore }</td>
		    <td align="center">${sr.resTotal }</td>
  		</tr>
  		</c:forEach> 
		</table>
		</td>
    </tr>
    </table>
    </td>
</tr>
</table>
<%@ include file="copyright.jsp"%>        
</body>
</html>