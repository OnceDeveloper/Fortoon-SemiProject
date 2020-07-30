<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>


<html> 
<head> <meta charset="UTF-8"> <title>idCheckForm.jsp</title> </head> <body> <div style="text-align: center">
 <h3>*사용가능 ID 조회 *</h3> 
 
<form method="post" action="join.do?m=idCheck2" onsubmit="return blankCheck(this)">
 아이디 : <input type="text" name="m_id" maxlength="10" autofocus>
 <input type="submit" value="확인"> 
 </form> 
 </div> 
 
 <script> 
 function blankCheck(signUpForm){ 
	 var m_id=signUpForm.m_id.value;
	 id=m_id.trim(); 
	 if(m_id.length<2) { 
	 alert("아이디는 2자 이상 입력해주십시오."); 
 return false; 
 } 
 return true; 
 } 
 </script> 
 </body> 
 </html>

