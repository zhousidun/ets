<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网络在线考试</title>
<script type="text/javascript">
function checkForm(form){
if(form.name.value==""){
		alert("请输入考生姓名!");
		form.name.focus();
		return false;
	}
	if(form.oldpwd.value==""){
		alert("请输入的原密码!");
		form.oldpwd.focus();
		return false;
	}
	if(form.oldpwd.value!=form.correctpwd.value){
		alert("您输入的原密码不正确，请重新输入!");
		form.oldpwd.value="";
		form.oldpwd.focus();
		return false;
	}
	if(form.pwd.value==""){
		alert("请输入的新密码!");
		form.pwd.focus();
		return false;
	}	
	if(form.repwd.value==""){
		alert("请确认新密码!");
		form.repwd.focus();
		return false;
	}	
	if(form.pwd.value!=form.repwd.value){
		alert("您两次输入的新密码不一致，请重新输入!");
		form.pwd.value="";
		form.repwd.value="";
		form.pwd.focus();
		return false;
	}
	if(form.question.value==""){
		alert("请输入提示问题!");
		form.question.focus();
		return false;
	}
	if(form.answer.value==""){
		alert("请输入问题答案!");
		form.answer.focus();
		return false;
	}
	if(form.profession.value==""){
		alert("请输入专业!");
		form.answer.focus();
		return false;
	}if(form.cardNo.value==""){
		alert("请输入身份证号!");
		form.answer.focus();
		return false;
	}
}
</script>
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
    <table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin">
      	<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td class="word_grey">
            &nbsp;
            <img src="${path}/image/f_ico.gif" width="8" height="8"> 
                               当前位置：→ <span class="word_darkGrey">
                               修改个人资料 &gt;&gt;&gt;</span>
            </td>
			<td align="right">
			<img src="${path}/image/m_ico1.gif" width="5" height="9">
			&nbsp;
			<a href="${path }/goHomepage.do" >返回首页</a>&nbsp;
			</td>
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
		
		<form action="updateProfile.do" onsubmit="return checkForm(this)" method="post">
		<input name="id" value="${student.id }" type="hidden">
		<input name="sex" value="${student.sex }" type="hidden">
		<table width="70%"  border="0" cellpadding="0" 
			cellspacing="0" bordercolor="#FFFFFF" 
			bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
		<tr>
    		<td height="30" align="left" style="padding:5px;">考生姓名：</td>
    		<td align="left">
				<input name="name" value="${student.name }" size="35px"/>*
			</td>
    	</tr>	
		<tr>
    		<td align="left" style="padding:5px;">原&nbsp;密&nbsp;码：</td>
    		<td align="left">
    			<input name="correctpwd" type="hidden" value="${student.pwd }">
    			<input name="oldpwd" type="password" size="35px"/> *
    		</td>
    	</tr>
    	<tr>
    		<td height="30" align="left" style="padding:5px;">新&nbsp;密&nbsp;码：</td>
    		<td align="left">
    			<input name="pwd" type="password" size="35px"/>*(6-20个数字或字母)</td>
    	</tr>
  		<tr align="center">
    		<td width="30%" height="30" align="left" style="padding:5px;">确认新密码：</td>
    		<td width="70%" align="left">
      			<input name="repwd" type="password" size="35px"/>*	  
      		</td>
    	<tr>
	    <tr align="center">
	    	<td width="30%" height="30" align="left" style="padding:5px;">提示问题：</td>
	    	<td width="70%" align="left">
	      	<input name="question" value="${student.question }" size="35px"/>*(如我的生日) 	 
	      	</td>
	    </tr>
		<tr align="center">
	    	<td width="30%" height="30" align="left" style="padding:5px;">问题答案：</td>
	    	<td width="70%" align="left">
	      	<input name="answer" value="${student.answer }" size="35px"/>*(如7月17日)</td>
	    </tr>
		<tr align="center">
    		<td width="30%" height="30" align="left" style="padding:5px;">
    			专&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
    		<td width="70%" align="left">
      		<input name="profession" value="${student.profession }" size="35px"/></td>
    	</tr>	
    	<tr align="center">
	    	<td width="30%" height="30" align="left" style="padding:5px;">身份证号：</td>
	    	<td width="70%" align="left">
	      	<input name="cardNo" value="${student.cardNo }" size="35px"/>*</td>
	    </tr>
    	<tr>
    		<td height="65" align="left" style="padding:5px;">&nbsp;</td>
      		<td><input type="submit" value="保存"/>
       			 &nbsp;
        		<input type="reset" value="取消"/>

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