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
function beginExam(){
//	window.opener=null;
//	window.close();
//	window.open('startExam.do','',
//	'width=786,height=600,scrollbars=1');
	window.location.href="startExam.do";
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
            &nbsp;<img src="${path}/image/f_ico.gif" width="8" height="8"> 
                                当前位置：→ <span class="word_darkGrey">
                                在线考试 → 准备考试 &gt;&gt;&gt;</span>
            </td>
	  		<td width="24%" align="right">
	  		<img src="${path}/image/m_ico1.gif" width="5" height="9">
	    	<a href="#" >返回首页</a>&nbsp;
	    	</td>
        </tr>
        
        <tr>
        	<td align="center" valign="top">
 			<table width="100%" height="265"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			    <td height="93" colspan="3" align="center" class="word_orange1">&nbsp;</td>
			</tr>
			<tr>
			    <td width="12%">&nbsp;</td>
			    <td width="77%" valign="top">
			    	准备好了吗？<br><br>考生单击“开始考试”按钮，
			    	系统将立即记录本次考试并登记考试成绩！</td>
			    <td width="11%">&nbsp;</td>
			</tr>
  			<tr>
    			<td>&nbsp;</td>
    			<td align="center" valign="top">
    			<button onclick="beginExam()">开始考试</button>
				<button onclick="history.back(-1)">返回</button></td>
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