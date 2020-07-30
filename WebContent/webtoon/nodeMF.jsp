<%@page contentType="text/html;charset=utf-8" import="java.util.*, domain.Creation, creation.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../frame/frame.jsp"/>
<jsp:include page="../login/login_check_modul.jsp"/>

  <div class="col-8" style="margin-left: auto; margin-right: auto;">
          <div class="card">
            <div class="row no-gutters">
              <div class="col-4">
                <img src="images/Ghost story/eed.png" width="200px;" height="200px;" alt="" class="card-img" />
              </div>
              <div class="col-8">
                <div class="card-body">
                <h5 class="card-title" >괴담 동아리</h5> 
                  <p class="card-text">[낙성고 300인(人) 집단 머리 폭발 사건!]<br>
			                     평범한 고등학생 이준.<br>
						입학식 도중, 괴현상에 휘말려 죽음을 맞게 되는데.<br>
						[당신은 죽었습니다.]<br>
						[체크 포인트에서 다시 시작합니다.]<br>
						[로딩중...]<br>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <table cellpadding="0" cellspacing="0" class="viewList"  style="margin-left: auto; margin-right: auto;">
		<!--  	<caption><span class="blind">회차별 목록</span></caption> -->
			<col width="99"><col width="*"><col width="141"><col width="76">
			<thead>
			<tr>
				<th scope="col">이미지</th>
				<th scope="col">제목</th>
				<%--<th scope="col">별점</th> --%>
				<th scope="col">등록일</th>
			</tr>			
			</thead>
			<tr>
				<td>
					<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.img','20853','1233')">
						<img src="images/Ghost story/eed.png" title="1229. 마지막화" alt="1229. 마지막화" width="71" height="41" onERROR="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">
				<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.title','20853','1233')">05. 괴담 동아리</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<%--
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:99.71%">평점</em></span>
						<strong>9.97</strong>
					</div>
				</td>
				 --%>
				<td class="num">2020.06.29</td>
			</tr>
			<tr>
				<td>
				<div class="dropdown-divider"></div>
					<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.img','20853','1233')">
						<img src="images/Ghost story/eed.png" title="1229. 마지막화" alt="1229. 마지막화" width="71" height="41" onERROR="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">
				<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.title','20853','1233')">04. 괴담 동아리</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:99.71%">평점</em></span>
						<strong>9.96</strong>
					</div>
				</td>
				<td class="num">2020.06.29</td>
			</tr>
			<tr>
				<td>
				<div class="dropdown-divider"></div>
					<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.img','20853','1233')">
						<img src="images/Ghost story/eed.png" title="1229. 마지막화" alt="1229. 마지막화" width="71" height="41" onERROR="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">
				<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.title','20853','1233')">03. 괴담 동아리</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:99.71%">평점</em></span>
						<strong>9.97</strong>
					</div>
				</td>
				<td class="num">2020.06.29</td>
			</tr>
			<tr>
				<td>
				<div class="dropdown-divider"></div>
					<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.img','20853','1233')">
						<img src="images/Ghost story/eed.png" title="1229. 마지막화" alt="1229. 마지막화" width="71" height="41" onERROR="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">
				<a href="/webtoon/detail.nhn?titleId=20853&no=1233&weekday=tue" onclick="nclk_v2(event,'lst.title','20853','1233')">02. 괴담 동아리</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:99.71%">평점</em></span>
						<strong>9.98</strong>
					</div>
				</td>
				<td class="num">2020.06.29</td>
			</tr>
			<tr>
				<td>
				<div class="dropdown-divider"></div>
					<a href="Sl_nodeMF.jsp" onclick="nclk_v2(event,'lst.img','20853','1233')">
						<img src="images/Ghost story/eed.png" title="1229. 마지막화" alt="1229. 마지막화" width="71" height="41" onERROR="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">
				<a href="Sl_nodeMF.jsp" onclick="nclk_v2(event,'lst.title','20853','1233')">01. 괴담 동아리</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:99.71%">평점</em></span>
						<strong>9.99</strong>
					</div>
				</td>
				<td class="num">2020.06.29</td>
			</tr>
			
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
