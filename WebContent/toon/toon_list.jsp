<%@page contentType="text/html;charset=utf-8" import="java.util.*, domain.Creation, creation.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../frame/frame.jsp"/>
<jsp:include page="../login/login_check_modul.jsp"/>

 <input type="hidden" id=division type="text" value="${param.division}"/> 
  <input type="hidden" id=cr_num type="text" value="${param.cr_num}"/> 
<c:if test="${empty listResult.list}">
	<center>
	<tr>
		<td align='center' colspan="5">데이터가 존재하지 않습니다.</td>
	<tr/>
	</center>
 </c:if>

  <div class="col-8" style="margin-left: auto; margin-right: auto;">
          <div class="card">
            <div class="row no-gutters">
               <div class="col-4">
                <img src="../Files/imgs/thumb/${list.fname}" width="200px;" height="200px;" alt="" class="card-img" />
              </div>
              <div class="col-8">
                <div class="card-body" >
                <table width="500px">
					<tr>
					<td style="text-align:letf;font-size:30px"> <p  class="card-title" >${list.title}</p> </td>
					<td style="text-align:right"><p class="card-text">작가 : ${list.m_id}</p></td>
					</tr>
					<tr>
					<td colspan=2> <p class="card-text">${list.plot}</p></td>
					</tr>
					</table>
                </div>
              </div>
            </div>
          </div>
 </div>
        <br/>
        
        <table cellpadding="0" cellspacing="0" class="viewList"  style="margin-left: auto; margin-right: auto;">
		<!--  	<caption><span class="blind">회차별 목록</span></caption> -->
			<col width="150"><col width="100"><col width="300"><col width="100">
			<thead>
			<tr>
				<th scope="col">이미지</th>
				<th scope="col">회차</th>
				<th scope="col">제목</th>
				<%--<th scope="col">별점</th> --%>
				<th scope="col">날짜</th>
			</tr>			
			</thead>
			<c:forEach items="${listResult.list}" var="creation"> 
			<tr>
				<td>
					<a href="creation.do?m=view&cr_num=${creation.cr_num}&">
						<img src="../Files/imgs/thumb/${creation.fname}" width="71" height="41" onERROR="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">${creation.epi}</td>
				<td class="title">
				<a href="creation.do?m=view&cr_num=${creation.cr_num}" onclick="">${creation.title}</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<%--
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:99.71%">평점</em></span>
						<strong>9.97</strong>
					</div>
				</td>
				 --%>
				<td class="num">${creation.rdate}</td>
			</tr>
           </c:forEach>
		</table>

<%--페이징 기법--%>
<center>
<hr width='1000' size='2' color='gray' noshade>
<font color='gray' size='3' face='나눔고딕'>
    (총페이지수 : ${listResult.totalPageCount})
    &nbsp;&nbsp;&nbsp;
<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
        <a href="creation.do?m=toon_list&cp=${i}&division=${param.division}&cr_num=${param.cr_num}">
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
    	   //alert("dd");
           //var el = document.getElementById("psId");
           var ps = select.value;
           var division = document.getElementById("division").value;
           var cr_num = document.getElementById("cr_num").value;
           //alert("division : " + division);
           //alert("cr_num : " + cr_num);
           //alert("ps : " + ps);
           location.href="creation.do?toon_list&ps="+ps+"&division="+division+"&cr_num="+cr_num;
           //location.href="creation.do?list&ps="+ps+"&division="+division;
       }
    </script>

			
<!-- 페이지 이동					
			 </table>
			 		<div class="paginate">
				<div class="page_wrap" >
					<strong class="blind"></strong>
					<strong class="page"><em class="num_page">1</em><span class="blind"></span></strong>
			<a href="/webtoon/list.nhn?titleId=20853&amp;weekday=tue&amp;page=2" class="page"><em class="num_page">2</em></a>
			<a href="/webtoon/list.nhn?titleId=20853&amp;weekday=tue&amp;page=3" class="page"><em class="num_page">3</em></a>
			<a href="/webtoon/list.nhn?titleId=20853&amp;weekday=tue&amp;page=2" class="next" title="다음 페이지 목록으로 이동" ><span class="cnt_page">다음</span><span class="blind"> </span><span class="ico_page"></span></a>
			</div>
			</div>
	<script type="text/javascript">
	-->

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
