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
    <td height="208" background="${path}/image/default_top.jpg">&nbsp;</td>
</tr>
<tr>
    <td><img src="${path}/image/default_mid.JPG" width="778" height="254" border="0" usemap="#Map"></td>
</tr>
<tr>
    <td height="158" background="${path}/image/default_bottom.JPG">&nbsp;</td>
</tr>
</table>
<map name="Map">
     <area shape="poly" coords="190,65,190,65,215,82,194,98,105,113,103,81" href="${path}/student/examRule.do">
     <area shape="poly" coords="313,59,402,45,435,56,406,78,311,90,313,58" href="manage/stuResult.do?action=stuResultQueryS&ID=${student}">
     <area shape="poly" coords="380,141,508,119,541,139,521,154,385,176" href="manage/student.do?action=modifyQuery&ID=${student}">
     <area shape="poly" coords="602,58,690,46,715,63,696,76,602,91" href="logout.jsp">
</map>
</body>
</html>