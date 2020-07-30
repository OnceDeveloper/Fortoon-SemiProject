<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en"> 

<head> 
<!-- Required meta tags --> 
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 타이틀에 로고추가 -->
<link rel="shortcut icon" type="image/x-icon" href="../img/logo.ico">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
<title>Fortoon</title>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
<a class="navbar-brand" href="../index.do"> 
<img src="../img/logoT.png" width="70" height="70" id="icon" alt="User Icon" />
</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> 
<span class="navbar-toggler-icon"></span> 
</button> 
<div class="collapse navbar-collapse" id="navbarSupportedContent"> 
<ul class="navbar-nav mr-auto">
<%--
<li class="nav-item active"> 
<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> 
</li>
 --%>
<style>
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
</style>
<li class="nav-item dropdown"> 
<a class="nav-link dropdown-toggle" href="../creation/creation.do?m=list&cp=1&ps=4&division=웹툰" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
웹툰 
</a> 
<div class="dropdown-menu" aria-labelledby="navbarDropdown">
<a class="dropdown-item" href="../creation/creation.do?m=list&cp=1&ps=4&division=웹툰">전체</a> 
<a class="dropdown-item" onclick = "javascript:g('웹툰','로맨스')" value="로맨스">로맨스</a> 
<a class="dropdown-item" onclick = "javascript:g('웹툰','판타지')" value="판타지">판타지</a> 
<a class="dropdown-item" onclick = "javascript:g('웹툰','스릴러')" value="스릴러">스릴러</a> 
<a class="dropdown-item" onclick = "javascript:g('웹툰','액션')" value="액션">액션</a> 
<a class="dropdown-item" onclick = "javascript:g('웹툰','시대극')" value="시대극">시대극</a> 
<a class="dropdown-item" onclick = "javascript:g('웹툰','기타')" value="기타">기타</a> 
</div>
</li> 

<li class="nav-item dropdown"> 
<a class="nav-link dropdown-toggle" href="../creation/creation.do?m=list&cp=1&ps=4&division=소설" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
소설
</a> 
<div class="dropdown-menu" aria-labelledby="navbarDropdown">
<a class="dropdown-item" href="../creation/creation.do?m=list&cp=1&ps=4&division=소설">전체</a> 
<a class="dropdown-item" onclick = "javascript:g('소설','로맨스')" value="로맨스">로맨스</a> 
<a class="dropdown-item" onclick = "javascript:g('소설','판타지')" value="판타지">판타지</a> 
<a class="dropdown-item" onclick = "javascript:g('소설','스릴러')" value="스릴러">스릴러</a> 
<a class="dropdown-item" onclick = "javascript:g('소설','액션')" value="액션">액션</a> 
<a class="dropdown-item" onclick = "javascript:g('소설','시대극')" value="시대극">시대극</a> 
<a class="dropdown-item" onclick = "javascript:g('소설','기타')" value="기타">기타</a> 
</div>
</li> 


<li class="nav-item"> 
<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="false">게시판</a> 
</li>
<li class="nav-item dropdown"> 
<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
마이페이지
</a> 
<div class="dropdown-menu" aria-labelledby="navbarDropdown">
<a class="dropdown-item" onclick="location.href='../join/join_formr.jsp';javascript:check();" >회원 정보 수정</a> 
<a class="dropdown-item" href="#">최근 조회 작품</a> 
<a class="dropdown-item" href="#">내작품</a> 
</div>
</li> 
</ul>
<form class="form-inline my-2 my-lg-0">

<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
<button class="btn btn-outline-success my-2 my-sm-0" type="submit" >Search</button>&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='../file/file.do?m=toon_insertF';javascript:check();" value="작품 올리기">&nbsp;&nbsp;&nbsp;
	
	<c:if test="${empty loginUser}">
	 <a class="nav-link" href="../login/login.do?m=form">로그인</a>
	 <!--<img src="/img/logo1.png"/> -->
	</c:if>
	 <c:if test="${!empty loginUser}">
	 <a class="nav-link" href="../login/login.do?m=out">로그아웃</a>
	</c:if>

<style>

.dropdown-item{cursor: pointer;}

</style>

<script language="javascript">
		function g(division, genre){
			//var division = division;
			//var genre = genre;
			//alert(division);
			//alert(genre);
			location.href="../creation/creation.do?m=list&cp=1&ps=4&division="+division+"&genre="+genre;
		}
</script>

<script>
	function check(){
		if(${empty sessionScope.loginUser}){
			alert("회원 서비스입니다. 로그인을 먼저 하고 오세요");
			//location.href="../login/login.do?m=form"; //로그인 폼으로 이동
			location.href="../login/login.do?m=form"; //인덱스로 이동
		}
	}
</script>	
</form> 
</div> 
</nav>  
</head> 


