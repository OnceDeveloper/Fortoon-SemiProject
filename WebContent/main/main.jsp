<%@page contentType="text/html;charset=utf-8" import="java.util.*, domain.Creation, creation.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../frame/frame.jsp"/>
<%--<%@ include file="frame/frame.jsp" %> --%>

<!DOCTYPE html>
<html lang="en"> 
<body>
<div>
 &nbsp;
 <input type="hidden" id=division type="text" value="${param.division}"/> 
</div>

<c:if test="${empty listResult.list}">
	<center>
	<tr>
		<td align='center' colspan="5">데이터가 존재하지 않습니다.</td>
	<tr/>
	</center>
 </c:if>
 
<div class="container"> <br/>
<div class="row">
<c:forEach items="${listResult.list}" var="creation">
<div class="col-3">
<div class="card">

<a href="../creation/creation.do?m=toon_list&cp=1&ps=4&division=${creation.division}&cr_num=${creation.cr_num}">
<img src="../Files/imgs/thumb/${creation.fname}"
width="300px;" height="200px;" class="card-img-bottom" alt="...">
</a> 
<div class="card-body" >
<h5 class="card-title" >${creation.title}</h5>
<h6 class="card-text">${creation.genre}</h6>

<%-- <input type="text" class="card-title" value="${creation.cr_num}"/>   --%>
<%--줄거리 생략
<p class="card-text" >${creation.plot}<br>
</p>
 --%>
<a href="../creation/creation.do?m=toon_list&cp=1&ps=4&division=${creation.division}&cr_num=${creation.cr_num}" class="btn btn-primary">바로가기</a>
</div>
</div>
<br/>
</div>
</c:forEach>
</div>
</div>

<br/>
<%-- 밑에 굵은 선
<div style="height: auto; width: 100%; border-bottom:3px solid black;"></div><br>
--%>


<%--페이징 인클루드--%>
<jsp:include page="paging.jsp"/>

<!-- Optional JavaScript --> 
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"> 
	</script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"> 
	</script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
	</script>
	
</body>

</html>
