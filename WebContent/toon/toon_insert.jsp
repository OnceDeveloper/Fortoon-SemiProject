<%@page contentType="text/html;charset=utf-8" import="java.util.*, domain.Creation, creation.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../frame/frame.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
<title>웹툰 등록 페이지</title>
<h2>웹툰 등록</h2>
-->
</head>


    <!-- 새 작품 등록 -->
    <form  id="uploadForm" name="uploadForm"  method="post" action="../file/file.do?m=toon_insertThum" enctype="multipart/form-data">
        
        <fieldset>
            <%-- <legend><span class="blind">웹툰 작품 등록</span></legend>--%><br/><br/>
            <div class="container" style="margin-left: auto; margin-right: auto;">
            <table class="uploadBox">
               <!--   <caption><span class="blind">웹툰 작품 등록 폼</span></caption> -->

                  <colgroup>
                    <col style="width:116px">
                    <col style="width:578px">
                </colgroup> 
                </table>
				<table class="table table-bordered">
                <tbody>
                <tr>
                    <th scope="row" class="title">제목</th>
                    <td>
                        <div class="my_tit_area">
                            <div class="inp_box">
                                <label class="ph" id="defultText" style="display: none">제목을 입력해주세요.</label>
                                <input type="text" id="title" name="title"  value="" alt="제목" required>
                                <!-- <input type="hidden" id="file_div" name="file_div"  value="thumb"> -->
                                <span class="byte" id="titleNameCount">0 /30</span>
                            </div>
                            <!-- [D] 작품 수정일 경우만 노출 / style="display:none;"은 마크업 확인용 스타일 입니다. -->
                            
                              
                            <div class="chk_box "  style="display:none;">
                                <input type="checkbox" class="Nbtn_chk" id="finishedYn" name="finishedYn" value="Y" >
                                <label for="finishedYn" class="_finish">완결</label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">형식</th>
                    <td>
                        <!-- [D] 라디오 버튼 체크시 on 클래스 추가 -->
                        <span class="radio_box  ">
                            <input type="radio" id="webtoon" name="division" value="웹툰" required>
                            <label for="webtoon">웹툰</label>
                        </span>
                        <span class="radio_box  ">
                            <input type="radio" id="novel" name="division" value="소설" >
                            <label for="novel">소설</label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <th scope="row">장르</th>
                    <td>
                        <div class="chk_box_wrap">
                            <!-- [D] 라디오 버튼 체크시 on 클래스 추가 -->
                            <span class="chk_box ">
                                <input type="radio" id="romance" name="genre" value="로맨스" required>
                                <label for="romance" class="_genreTypeLabel">로맨스</label>
                            </span>
                            <span class="chk_box ">
                                <input type="radio" id="fantasy" name="genre" value="판타지" >
                                <label for="fantasy" class="_genreTypeLabel">판타지</label>
                            </span>
                            <span class="chk_box ">
                                <input type="radio" id="thriller" name="genre" value="스릴러" >
                                <label for="thriller" class="_genreTypeLabel">스릴러</label>
                            </span>
                            <span class="chk_box ">
                                <input type="radio" id="action" name="genre" value="액션" >
                                <label for="action" class="_genreTypeLabel">액션</label>
                            </span>
                            <span class="chk_box ">
                                <input type="radio" id="historical" name="genre" value="시대극" >
                                <label for="historical" class="_genreTypeLabel">시대극</label>
                            </span>
                            <span class="chk_box ">
                                <input type="radio" id="etc" name="genre" value="기타" >
                                <label for="etc" class="_genreTypeLabel">기타</label>
                            </span>
                        </div>
                    </td>
                </tr>
               <tr>
                    <th scope="row">줄거리</th>
                    <td>
                        <div class="story_box">
                            <textarea cols="30" rows="7" id="plotArea" name="plot" required></textarea>
                            <input type="hidden" id="plot" alt="줄거리" >
                            <span class="byte" id="plotCount">0 /400</span>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th scope="row">썸네일 이미지</th>
                    <td class="thumb">
                        <span class="radio_box "> 
						
						    <img id="thumbnail" src="../img/noImg.jpg" width="100" alt="썸네일영역">
						
						<input name="thumbF" type="file" id="getfile" accept="image/* " required>

						       <script>
						       var file = document.querySelector('#getfile');
								
						       file.onchange = function () { 
						           var fileList = file.files ;
						           
						           // 읽기
						           var reader = new FileReader();
						           reader.readAsDataURL(fileList [0]);

						           //로드 한 후
						           reader.onload = function  () {
						               //로컬 이미지를 보여주기
						               
						               //썸네일 이미지 생성
						               var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
						               tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
						               tempImage.onload = function() {
						                   //리사이즈를 위해 캔버스 객체 생성
						                   var canvas = document.createElement('canvas');
						                   var canvasContext = canvas.getContext("2d");
						                   
						                   //캔버스 크기 설정
						                   canvas.width = 100; //가로 100px
						                   canvas.height = 100; //세로 100px
						                   
						                   //이미지를 캔버스에 그리기
						                   canvasContext.drawImage(this, 0, 0, 100, 100);
						                   //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
						                   var dataURI = canvas.toDataURL("image/jpeg");
						                   
						                   //썸네일 이미지 보여주기
						                   document.querySelector('#thumbnail').src = dataURI;
						               };
						           }; 
						       };
                            </script>
                            </span>
						 </td>
                	</tr>
                </tbody>
                
                <%--insert2
                <tr>
					<th scope="row">자동회차 No</th>
					<td class="epi_num">
					<!-- <div class="inp_box">1</div> -->
						<input type="text" class="blind" id="epi" name="epi" value=""><!-- disabled -->
						<p class="guide_txt">회차 No는 순차적으로 자동 지정되기 때문에 임의로 설정이 불가능합니다.</p>
					</td>
				</tr>
				<tr>
                    <th scope="row">업로드</th>
                    <td class="thumb">
                        <input type="file" value="" name="creationF[]" accept="image/* "><!-- multiple -->
                        </td>
                        </tr>
                        <tr>
					<th scope="row">
						운영원칙 동의</br>
						<a href="/mypage/uploadOperationPrinciple.nhn" class="terms_detail_lnk" onclick="nclk_v2(event,'chal.notmo');" target="_blank">자세히보기</a>
					</th>
					<td class="agree">
						<span class="chk_box">
							<input type="checkbox" id="warnning">
							<label for="warnning">불법 게시물을 등록할 경우, 게시중단 및 삭제될 수 있으며 형사 처분 대상이 될 수 있습니다.</label>
						</span>
					</td>
				</tr>
				--%>
				
                 </table>
                 </div>     
            
            <br>
            <!--   <div style="margin: auto; width: 40%; border-bottom:1px solid grey;"></div><br>  수평선 넣기-->
            <div class="upload_btn_area" style="text-align:center;">
            	<!-- <a href="index.jsp"> -->
            	<!-- <a href="toon_insert2.jsp"> -->
                <button type="submit" class="btn btn-primary btn-rounded" id="register">등록</button>
                <!-- </a> -->
                <button type="button" class="btn btn-primary btn-rounded" id="cancel" onclick="location.href='../index.do'">취소</button>
               <!--  </a> -->
                
            </div>
            
        </fieldset>
    </form>
    <div class="ly_dimmed" id="dimLayer"></div>

    <div class="ly_wrap" style="display:none;" id="alertPopup" >
        <div class="ly_box">
            <div class="ly_cont">
                <p class="ly_txt2"></p>
                <div class="ly_btn_area">
                    <button type="button" class="btn_type1">확인</button>
                </div>
            </div>
        </div>
    </div>

    <div class="ly_wrap" style="display:none;" id="confirmPopup" >
        <div class="ly_box">
            <div class="ly_cont">
                <p class="ly_txt2"></p>
                <div class="ly_btn_area">
                
                    <button type="button" class="btn_type1">확인</button>
                    <button type="button" class="btn_type2">취소</button>
                </div>
            </div>
        </div>
    </div>
   
   <%--
 <script language="javascript">
	   function check()
	   {
		   for(var i=0; i<document.input.elements.length; i++)
		   {
		      if(document.input.elements[i].value=="")
			  {
			     alert("모든 값을 입력 하셔야 합니다. ");
				 return false;
			  }
		   }
		   document.input.submit();
       }
</script>   
     --%>
<!-- //새 작품 등록 -->
			
			<!-- side menu -->
			
				<div id="aside">

<div class="asideButton upload">
	
	
	
</div>
</html>