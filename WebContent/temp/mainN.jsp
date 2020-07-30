<%@page contentType="text/html;charset=utf-8" import="java.util.*, domain.Creation, creation.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../frame/frame.jsp"/>
<%--<%@ include file="frame/frame.jsp" %> --%>

<!DOCTYPE html>
<html lang="en"> 
<body>

<c:if test="${empty listResultN.list}">
	<tr>
		<td align='center' colspan="5">데이터가 없음</td>
	<tr/>
 </c:if>
 
<div class="container"> <br/>
<div class="row">
<c:forEach items="${listResultN.list}" var="creation">
<div class="col-3">
<div class="card">

<a href="../novel/nodeMF.jsp">
<img src="https://ww.namu.la/s/2260fe82a96289d5b670a8656b685cc1c36ed3b09ac09f1d39ca97832fc82650baf567645cebb926933c4bc9d7450c617074bfe8f74111eead73beef3070bcd6336ec5b60732c71d98214fa88ad1fccc95218a54af11e40cbd8ea06e01ad3b3654116f94b84edf8c4c88418f650a356d"
width="300px;" height="200px;" class="card-img-bottom" alt="...">
</a> 
<div class="card-body" >
<h5 class="card-title" >${creation.title}</h5>
<%--줄거리 생략
<p class="card-text" >${creation.plot}<br>
</p>
 --%>
<a href="../novel/nodeMF.jsp" class="btn btn-primary">바로가기</a> 
</div>
</div>
</div>
</c:forEach>
</div>
</div>

<br/>
<%--
<div style="height: auto; width: 100%; border-bottom:3px solid black;"></div><br>
--%>


<%--페이징기법--%>
<center>
<hr width='1000' size='2' color='gray' noshade>
<font color='gray' size='3' face='나눔고딕'>
    (총페이지수 : ${listResultN.totalPageCount})
    &nbsp;&nbsp;&nbsp;
<c:forEach begin="1" end="${listResultN.totalPageCount}" var="i">
        <a href="creation.do?listN&cp=${i}">
        <c:choose>
        	<c:when test="${i==listResultN.currentPage}">
            <strong>${i}</strong>       
    		</c:when>
       		<c:otherwise>
       			${i}
       		</c:otherwise>
       	</c:choose>       
			</a>
</c:forEach>
    ( TOTAL : ${listResultN.totalCount} )
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       페이지 싸이즈 : 
    <select id="psId" name="ps" onchange="f(this)">
	<c:choose>
		<c:when test="${listResultN.pageSize==4}">
			<option value="4"selected>4</option>
	        <option value="8">8</option>
		</c:when>
		<c:when test="${listResultN.pageSize==8}">
			<option value="4">4</option>
		    <option value="8"selected>8</option>
	    </c:when>
	    <%--
		<c:otherwise>
			<option value="4">4</option>
		    <option value="8">8</option>
	    </c:otherwise>
	     --%>
	</c:choose>
    </select>
    
    <script language="javascript">
       function f(select){
           //var el = document.getElementById("psId");
           var ps = select.value;
           //alert("ps : " + ps);
           location.href="creation.do?listN&ps="+ps;
       }
    </script>
    
</font>

</center>

<%--페이징 인클루드
<jsp:include page="paging.jsp"/>--%>

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
