<%@page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!doctype html>
<html ng-app="form-demo-app">
<head>
		<meta charset="UTF-8">
		<title>폼 벨리데이션 예제</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<style>
			.container{
				margin-top: 20px;
			}
			input.ng-invalid {
				border: 5px solid red;
			}
		</style>
		<script type="text/javascript" src="libs/angular/angular.js"></script>
		<script>
		angular.module('form-demo-app', [])
		.controller('mainCtrl', ['$scope', function ($scope) {
			ㅑ
		}]);

		   function idCheck(){ //새창 만들기 
			      window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
			      
			      var f=document.getElementById("id");
			      f.readOnly = false;
			   }

		
		</script>

	</head>
	
	<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">

 
  
    <div class="site-section bg-light">
      <div class="container">

        <div class="row">

            <h2 class="h2 mb-3 text-black font-heading-serif">비밀번호  찾기</h2>
         
            	
            	<br/><br/><br/>
            	   <br/>
            
            <div class="p-3 p-lg-5 ">
            <c:if test="${!empty FoundPWD}">
				<h3> 검색결과 : 당신의 비밀번호는 '${FoundPWD}' 입니다.</h3>
			</c:if>
			
			<c:if test="${empty FoundPWD}">
				<h3> 검색결과 : 일치하는 정보를 찾을 수 없습니다. </h3>
			</c:if>
			
              </div>
    
              </div>
             
            </div>
          </div>
    
        
      </div>

   
  <!-- .site-wrap -->


  <!-- loader -->

  <script src="../js/jquery-3.3.1.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/jquery-ui.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/jquery.countdown.min.js"></script>
  <script src="../js/bootstrap-datepicker.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.fancybox.min.js"></script>
  <script src="../js/jquery.sticky.js"></script>
  <script src="../js/jquery.mb.YTPlayer.min.js"></script>




  <script src="../js/main.js"></script>

</body>

</html>