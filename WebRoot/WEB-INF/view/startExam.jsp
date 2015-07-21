<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网络在线考试</title>
<script type="text/javascript">
var start=0;
var startId;
var remain=20*60;
var remainId;
function timeDown(){
	var min=parseInt(remain/60);
	min=checkTime(min);
	var sec=remain%60;
	sec=checkTime(sec);
	var info=min+":"+sec;
	document.getElementById('showRemainTimediv').innerHTML=info;
	remain=remain-1;
	remainId=setTimeout("timeDown()",1000);
	
	if(remain==-1)
		clearTimeout(remainId);
}
function timeUp(){
	var min=parseInt(start/60);
	min=checkTime(min);
	var sec=start%60;
	sec=checkTime(sec);
	var info=min+":"+sec;
	document.getElementById('showStartTimediv').innerHTML=info;
	start=start+1;
	startId=setTimeout("timeUp()",1000);
	if(start==20*60+1)
		clearTimeout(startId);
}

function checkTime(t){
	if (t<10)
		return "0"+t;
	else 
		return t;
}
</script>
</head>

<body onload="timeUp(),timeDown()">

<table width="770" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
    <td width="40" height="39" background="${path}/image/startExam_leftTop.jpg">&nbsp;</td>
    <td width="667" align="right" background="${path}/image/startExam_top.jpg">&nbsp;
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>	
		<td width="23%" nowrap height=23 align=right>考试时间：</td>
		<td width="14%" nowrap><font color="#FF0000">20</font>分钟</td>
		<td width="13%" nowrap>计 时：</td>
		<td width="60" nowrap>
			<div id="showStartTimediv">00:00:00</div>
		</td>
		<td width="16%" nowrap>剩余时间：</td>
		<td width="60" align=left nowrap>
			<div id="showRemainTimediv"></div>
		</td>
	</tr>
	</table>	
	</td>
    <td width="19" background="${path}/image/startExam_top.jpg">&nbsp;</td>
    <td width="44" background="${path}/image/startExam_rightTop.jpg">&nbsp;</td>
</tr>
<tr>
    <td height="435" rowspan="2" background="${path}/image/startExam_left.jpg">&nbsp;</td>
    <td height="43" colspan="2"><img src="${path}/image/startExam_ico.jpg" width="117" height="43"></td>
    <td rowspan="2" background="Images/startExam_right.jpg">&nbsp;</td>
</tr>
<tr>
    <td height="600" colspan="2" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td colspan="2" align="center" class="title"> 
        ${paper.lesson.name }
        &nbsp;
        ${paper.name } &nbsp;&nbsp;考试卷
        </td>
    </tr>
    <tr>
        <td width="55%">&nbsp;</td>
        <td width="45%">&nbsp;
        	满分<font color="red">100</font>分
        	&nbsp;
        	单选题<font color="red">40</font>分
        	&nbsp;
        	多选题<font color="red">60</font>分
        </td>
    </tr> 
    </table>
    
   	<form action="submitPaper.do" method="post">
   	<!-- 试题table 开始 -->
   	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	    <td>
	    <c:if test="${sqCount>0 }">
	    <!-- 单选题开始 -->
		<table id="single" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>
		<tr>
    		<td colspan="4" height=23 style="font-size:11pt;">
    		一、单选题（<font color=red>每题
    		<fmt:formatNumber type="number" value="${40/sqCount}" maxFractionDigits="0"/>    		
    		 分，答错不得分</font>）
    		</td>
  		</tr>
  		
  		<c:forEach items="${questionMap.sQuestions }" var="sq" varStatus="s">
  		<c:set var="sIndex" value="${s.count }"/>
  		<tr>
    		<td height=23 >
	  		[${sIndex }]&nbsp;&nbsp;
	  		${sq.subject }#${sq.answer }
			</td>
  		</tr>
  		<tr>
  			<td>	
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="radio" name="sa${sIndex }" value="A">A.${sq.optionA }<br>
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="radio" name="sa${sIndex }" value="B">B.${sq.optionB }<br>
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="radio" name="sa${sIndex }" value="C">C.${sq.optionC }<br>
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="radio" name="sa${sIndex }" value="D">D.${sq.optionD }<br>
  			</td>
  		</tr>
  		</c:forEach>	
		</table>
		</c:if>
		<!-- 单选题结束 -->
		<!-- 多选题开始 -->
		<c:if test="${mqCount>0 }">
		<table id="multiple" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>
  		<tr>
    		<td colspan="4" height=23 style="font-size:11pt;">
    		二、多选题（<font color=red>每题
    		<fmt:formatNumber type="number" value="${60/mqCount}" maxFractionDigits="0"/>    		
    		 分，答错不得分</font>）
    		</td>
  		</tr>
		<c:forEach items="${questionMap.mQuestions }" var="mq" varStatus="s">
		<c:set var="mIndex" value="${s.count }"/>
		<tr>
    		<td height=23 >
	  		[${mIndex }]&nbsp;&nbsp;
	  		${mq.subject }#${mq.answer} 
			</td>
  		</tr>
  		<tr>
  			<td>	
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="checkbox" name="ma${mIndex}" value="A">A.${mq.optionA }<br>
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="checkbox" name="ma${mIndex}" value="B">B.${mq.optionB }<br>
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="checkbox" name="ma${mIndex}" value="C">C.${mq.optionC }<br>
  			<c:forEach begin="1" end="5">&nbsp;</c:forEach>&nbsp;&nbsp;
  			<input type="checkbox" name="ma${mIndex}" value="D">D.${mq.optionD }<br>
  			</td>
  		</tr>
		</c:forEach>
		<!-- 多选题结束 -->
		</table>
		</c:if>
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="交卷">
		</td>
    </tr>
	</table>
	<!-- 试题table 结束 -->
	<input type="hidden" name="paperId" value="${paper.id }">
	<input type="hidden" name="sqCount" value="${sqCount }">
	<input type="hidden" name="mqCount" value="${mqCount }">
	</form>
    </td>
</tr>

<tr>
    <td width="40" height="40" background="${path}/image/startExam_leftBottom.jpg">&nbsp;</td>
    <td colspan="2" background="${path}/image/startExam_bottom.jpg">&nbsp;</td>
    <td background="${path}/image/startExam_rightBottom.jpg">&nbsp;</td>
</tr>
</table>
</body>
</html>