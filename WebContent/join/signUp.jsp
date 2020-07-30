<!-- signUp.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
...
<body>
<c:if test="${ joinResult == 0}">
			<script>
			alert("아이디가 중복됩니다.");
			location.href='join_form.jsp';
			</script>
</c:if>
...
