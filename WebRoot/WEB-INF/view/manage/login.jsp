<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网络在线考试——后台登录</title>
<script type="text/javascript">
function check(form){
	if (form.name.value==""){
		alert("请输入管理员名称!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");form.pwd.focus();return false;
	}	
}
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td bgcolor="#EEEEEE">
	<table width="464" height="294" border="0" align="center" cellpadding="0" cellspacing="0" background="${path}/image/m_login.jpg">
	<tr>
        <td width="157" height="153">&nbsp;</td>
        <td width="307">&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td valign="top">
		<form action="login.do" method="post" onsubmit="return check(this)">
        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="35%" height="30">管理员名称：</td>
            <td width="65%">
              	<input name="name" size="19"/>
            </td>
        </tr>
        <tr>
            <td height="30">管理员密码：</td>
            <td><input name="pwd" type="password"/>
            </td>
        </tr>
        <tr>
            <td height="33" colspan="2" align="center">
            	<input type="submit" value="登录">
            	&nbsp;
            	<input type="reset" value="重置">
            	&nbsp;
            	<button onclick="window.close()">登录</button>
            </td>
        </tr>
        </table> 
		</form>		
		</td>
    </tr>
	</table>
	</td>
</tr>
</table>
</body>
</html>