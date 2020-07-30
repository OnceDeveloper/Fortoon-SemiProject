<%@page contentType="text/html;charset=utf-8" import="login.model.LoginSet"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script language='javascript'>
        if(${rCode}==<%=LoginSet.NO_ID%>){ //자바스크립트의 if
            alert("로그인 실패 (존재하지 않는 ID입니다.)");
            history.back();
        }else if(${rCode}==<%=LoginSet.NO_PWD%>){
            alert("로그인 실패(PWD가 틀렸습니다.)");
            history.back();
        }else{//LoginSet.PASS
        	alert("로그인 성공!!");
        	location.href="../index.do";
        }
       	

</script>