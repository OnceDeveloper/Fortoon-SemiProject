<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회차 등록 페이지</title>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.form.min.js"></script>
<script src="js/jQuery.MultiFile.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous">
</script>

</head>
<!-- 회차 등록 -->
	<form action="/mypage/uploadMyArticle.nhn" method="post" id="myArticleForm">
		<fieldset>
			<legend><span class="blind">회차 등록</span></legend>
			<div class="container" style="margin-left: auto; margin-right: auto;">
			<table class="uploadBox epi">
				
				<colgroup>
					<col style="width:116px">
					<col style="width:578px">
				</colgroup>
				</table>
				<table class="table table-bordered">
				<tbody>
				<tr>
					<th scope="row">자동회차 No</th>
					<td class="epi_num">
					<!-- <div class="inp_box">1</div> -->
						<input type="text" class="blind" id="articleNo" name="no" value="1" disabled>
						<p class="guide_txt">회차 No는 순차적으로 자동 지정되기 때문에 임의로 설정이 불가능합니다.</p>
					</td>
				</tr>
				<tr>
                    <th scope="row">업로드</th>
                    <td class="thumb">
                        <span class="radio_box ">
                        <!--  
                            <input type="radio" name="multiThumbnail" id="rd1" value="N" >
                            <label for="rd1">이미지 등록</label>
                            -->
                            <span class="btn btn-default btn-file">

                            <div id="attachFileDiv">
                            <input type="file" name="files" value="" size="40"><input type="button" value="추가" onclick="attachFile.add()" style="margin-left:5px">
                            </div>
                            <script> 
                            attachFile = {
                                    idx:0,
                                    add:function(){ // 파일필드 추가
                                        var o = this;
                                        var idx = o.idx;
                             
                                        var div = document.createElement('div');
                                        div.style.marginTop = '3px';
                                        div.id = 'file' + o.idx;
                             
                                        var file = document.all ? document.createElement('<input name="files">') : document.createElement('input');
                                        file.type = 'file';
                                        file.name = 'files';
                                        file.size = '40';
                                        file.id = 'fileField' + o.idx;
                             
                                        var btn = document.createElement('input');
                                        btn.type = 'button';
                                        btn.value = '삭제';
                                        btn.onclick = function(){o.del(idx)}
                                        btn.style.marginLeft = '5px';
                             
                                        div.appendChild(file);
                                        div.appendChild(btn);
                                        document.getElementById('attachFileDiv').appendChild(div);
                             
                                        o.idx++;
                                    },
                                    del:function(idx){ // 파일필드 삭제
                                        if(document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
                                            return;
                                        }
                                        document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
                                    }
                                }
                            </script>
                            </span> 
                        </span>
                         <!-- input 태그에서 onchange 속성에 실행될 메소드를 정해줍니다.
						
						메소드 내에서 FileReader 객체를 생성하고 onload 됐을 시 발생할 이벤트를 작성해줍니다.
						FileReader 가 로드 됐을 때 img 엘리먼트를 생성하고 src 속성을 설정해줍니다.
						그리고 이미지가 들어갈 div에 넣어줍니다.
						
						리더에서 input 태그에서 선택한 파일을 읽어오도록 설정합니다.
						 -->
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
				</tbody>
</table>
</div>			
</fieldset>				
</form>
				<!-- //회차 등록 -->
	
	<div class="upload_btn_area" style="text-align:center;">
		<button type="button" class="btn btn-primary btn-rounded" onclick="nclk_v2(event,'chal.can'); openPopup('myArticleCancelPopup');">취소</button>
		<button type="button" class="btn btn-primary btn-rounded" onclick="nclk_v2(event,'chal.enro'); validateForm();">등록</button>
	</div>			
</html>