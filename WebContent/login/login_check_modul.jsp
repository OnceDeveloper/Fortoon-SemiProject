<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	if(${empty sessionScope.loginUser}){
		alert("회원 서비스입니다. 로그인을 먼저 하고 오세요");
		//location.href="../login/login.do?m=form"; //로그인 폼으로 이동
		location.href="../login/login.do?m=form"; //인덱스로 이동
	}
</script>