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
<script type="text/javascript">
function agree(){
	window.location.href="${path}/exam/selectLesson.do";
}
</script>
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
          		在线考试 → 考试规则 &gt;&gt;&gt;</span>
          	</td>
			<td width="24%" align="right">
				<img src="${path}/image/m_ico1.gif" width="5" height="9">
			    <a href="#" >返回首页</a>&nbsp;</td>
        </tr>
        <tr>
        	<td align="center" valign="top">		
	 		<table width="100%" height="253"  border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	    		<td height="81" colspan="3" align="center" class="word_orange1">考试规则</td>
			</tr>
			<tr>
			    <td width="12%">&nbsp;</td>
			    <td width="77%" valign="top" align="left">
			    	&nbsp;&nbsp;&nbsp;&nbsp;
			    	网络在线考试系统不允许对网页进行刷新、后退等操作，否则后果自负。
			    	如果在规定的考试时间内没有交卷，系统将自动提交试卷。
			    	每位考生同一个课程只能考一次；系统会及时通知考试的具体时间；
			    	请考生关注考试课程以及考试时间！<br>
					&nbsp;&nbsp;&nbsp;&nbsp;
					只有同意以上规则才可以进行考试。
					如果出现问题或者未找到相关的考试课程，请与管理员联系。	
				</td>
			    <td width="11%">&nbsp;</td>
			</tr>
			<tr>
			    <td>&nbsp;</td>
			    <td align="center" valign="top">
			    	<button onclick="agree()">同意</button>
			    </td>
			    <td>&nbsp;</td>
			</tr>
			</table> 
        	</td>
    	</tr>
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