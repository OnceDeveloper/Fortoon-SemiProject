<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<center>
<hr width='1000' size='2' color='gray' noshade>
<font color='gray' size='3' face='나눔고딕'>
    (총페이지수 : ${listResult.totalPageCount})
    &nbsp;&nbsp;&nbsp;
<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
        <a href="creation.do?m=list&cp=${i}&division=${param.division}">
        <c:choose>
        	<c:when test="${i==listResult.currentPage}">
            <strong>${i}</strong>       
    		</c:when>
       		<c:otherwise>
       			${i}
       		</c:otherwise>
       	</c:choose>       
			</a>
</c:forEach>
    ( TOTAL : ${listResult.totalCount} )
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       페이지 싸이즈 : 
    <select id="psId" name="ps" onchange="f(this)">
	<c:choose>
		<c:when test="${listResult.pageSize==4}">
			<option value="4"selected>4</option>
	        <option value="8">8</option>
		</c:when>
		<c:when test="${listResult.pageSize==8}">
			<option value="4">4</option>
		    <option value="8"selected>8</option>
	    </c:when>
	   
		<c:otherwise>
			<option value="4">4</option>
		    <option value="8">8</option>
	    </c:otherwise>

	</c:choose>
    </select>
    
    
    
</font>

</center>

    <script language="javascript">
       function f(select){
           //var el = document.getElementById("psId");
           var ps = select.value;
           var division = document.getElementById("division").value;
           //alert("ps : " + ps);
           //console.log(ps);
           location.href="creation.do?list&ps="+ps+"&division="+division;
       }
    </script>
</html>