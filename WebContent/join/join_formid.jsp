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
			
		}]);

		function idcheck(){ //새창 만들기 
		    window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
		    
		    var f=document.getElementById("m_id");
		    f.readOnly = false;
			 }
		
		</script>
				
		
		
	</head>
	<body ng-controller="mainCtrl">
		<div class="container" id="wrap">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
		
	
	
				   <form name="signUpForm" action="join.do?m=update" method="post">
						<legend>아이디 찾기</legend>
													
             
     
                        	<br>
						
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<input type="text" name="name" class="form-control input-lg" ng-model="user.firstName" placeholder="이름" ng-required="true"/>
							</div>			
						</div>
						
						<br>
						<input type="text" name="brith" class="form-control input-lg" placeholder="생년월일" ng-model="user.birth" ng-required="true" />
						<br>
						<input type="text" name="phone" class="form-control input-lg" placeholder="휴대전화" ng-model="user.phone" ng-required="true" />
						<br>
						<h4>
						<label>성별 : </label>
						<input type="radio" name="gender" ng-model="user.gender" value="M">남자
						<input type="radio" name="gender" ng-model="user.gender" value="F">여자		
						</h4>								
						<br>
						<button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">ID 찾기</button>		
		

					</form>
					

					
					
					<div>

					</div>
					
					
				</div>
			</div>
		</div>
	</body>
	
	
	
   
	
	
</html>