<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网络在线考试</title>
<script language="javascript">
function check(form){
	if (form.name.value==""){
		alert("请输入准考证号!");
		form.name.focus();
		return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");
		form.pwd.focus();
		return false;
	}
}
</script>
</head>
<body>
<table width="778" height="158"  border="0" align="center" cellpadding="0" cellspacing="0" background="${path}/image/login_top.jpg">
<tr>
    <td width="118" colspan="2">&nbsp;</td>
</tr>
</table>
<form action="student/login.do" method="post">
<table width="778" height="158"  border="0" align="center" cellpadding="0" cellspacing="0" background="${path}/image/login_mid.jpg">	    
   <tr>
	<td>&nbsp;</td>
	<td></td>
	<td></td>
</tr>
<tr>
       <td width="35%" height="30">&nbsp;</td>
       <td width="9%" height="30">准考证号：</td>
       <td width="27%">
	<input name="name">                       </td>
       <td width="29%">&nbsp;</td>
   </tr>
   <tr>
       <td height="30">&nbsp;</td>
     	<td height="30">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
     	<td><input name="pwd" type="password"></td>
     	<td>&nbsp;</td>
   </tr>
  	<tr>
       <td height="31">&nbsp;</td>
       <td height="31" colspan="2" align="left">
       	<input type="submit" value="登录"/> 	
          	&nbsp;
		<input type="reset" value="重置"/>
           &nbsp;
           <button>注册</button>  
           &nbsp;
           <button>找回密码</button>
       </td>
       <td>&nbsp;</td>
   </tr>
   <tr>
     	<td height="40">&nbsp;</td>
     	<td height="31" colspan="2" align="right" valign="bottom">
     		<a href="#">进入后台</a>
     	</td>
     	<td>&nbsp;</td>
   </tr>
</table> 
</form>

<table width="778" height="196" border="0" align="center" 
	cellpadding="0" cellspacing="0" background="${path}/image/login_top.gif">
  <tr>
    <td height="182" background="${path}/image/login_bottom.jpg">&nbsp;</td>
  </tr>
</table>

</body>
</html>