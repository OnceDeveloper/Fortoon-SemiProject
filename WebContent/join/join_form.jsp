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
		<script>
		
		 window.onload = function () {
	         document.getElementById("join_btn").onclick = function (e) {
	            var pwdval = document.getElementById("pwd").value;
	            var pwdcheck = document.getElementById("pwdcheck").value;
	            
	            if(pwdcheck!=pwdval){
	               alert("비밀번호 입력이 일치하지 않습니다.");
	               e.preventDefault();
	               return false;
	            }
	         }
	      };
		
		function check(){
				var m_id= f.m_id.value; 
				m_id=m_id.trim(); 
				if(m_id.length<5 || m_id.length>10){ 
				alert("아이디가 5~10자 이내인지 확인해주세요"); 
				f.m_id.focus(); 
				return false; 
				}//if end
				
				
				var pwdval = f.pwd.value;
				pwdval = trim(pwdval);
				if(pwdval.length == 0){
					alert("비밀번호를 입력하세요.");
					f.pwd.value = "";
					f.pwd.focus();
					return false;
				}else{
					pass = checkByteLen(pwdval, 30);
					if(!pass){
						alert("비밀번호가 너무 깁니다. (영어 소문자/숫자 15자이내)");
						f.pwd.focus();
						return false;
					}
				}
				
				var pwdcheck = f.pwdcheck.value;
				pwdcheck = trim(pwdcheck);
				if(pwdcheck.length == 0){
					alert("비밀번호 확인란을 입력하세요.");
					f.pwdcheck.value = "";
					f.pwdcheck.focus();
					return false;
				}
				
				if(pwdcheck!=pwdval){
					alert("비밀번호 입력이 일치하지 않습니다.");
					return false;
				}
			
			//4) 이름 2~20자 이내인가
				var mname=f.mname.value;
			   	mname=mname.trim();
			   	if(mname.length<2 || mname.length>20){
			   		alert("이름을 2~20자 이내로 입력해주세요.");
			   		f.mname.focus();
			   		return false;
			   	}//if end
			  	//5) 이메일@ 문자가 있는가
			    	var email=f.email.value;
			    	email=email.trim();
			    	if(email.indexOf('@')==-1){ 
			    		alert("이메일을 올바르게 입력해주세요.")
			    		f.email.focus();
			    		return false;
					}//if end
		}
									
		   function idCheck(){ //새창 만들기 
			      window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
			      
			      var f=document.getElementById("id");
			      f.readOnly = false;
			   }

		
		</script>

	</head>
	<body ng-controller="mainCtrl">
		<div class="container" id="wrap">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
		
	
	
	        <form name="f" action="join.do?m=insert" method="post">
			<legend>회원가입</legend>
			
			     <div class="form-group row">
                <div class="col-md-12">
                        <input   class="form-control input-lg"  id="m_id" name="m_id" placeholder="ID" required >
                 </div>
                 
              
              </div>
             <div class="form-group">    
                <input type="button" value="사용가능 ID 조회" onclick="idCheck()">
              </div> 

	             
			<input type="text" id="pwd" name="pwd" class="form-control input-lg" placeholder="비밀번호" ng-model="user.password" ng-required="true" ng-pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/" required/>
			<br>
			<input type="text" id="pwdcheck" name="pwdcheck" class="form-control input-lg" placeholder="비밀번호 재확인" ng-model="user.repassword" ng-required="true" required/>
				
	
			
						
				
						<br>
						<div ng-show="signUpForm.password.$error.pattern" class="alert alert-warning" role="alert">최소 5글자, 최대 10글자이고 적어도 1개의 소문자, 대문자, 숫자를 포함해야합니다.</div>
						<br>
						
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<input type="text" name="name" class="form-control input-lg" ng-model="user.firstName" placeholder="이름" ng-required="true" required />
							</div>			
						</div>
						
						<br>
						<input type="text" name="brith" class="form-control input-lg" placeholder="생년월일  ex) 951231" ng-model="user.birth" required ng-required="true"  />
						<br>
						<input type="text" name="phone" class="form-control input-lg" placeholder="휴대전화  ex) 01059541454" ng-model="user.phone" required ng-required="true" />
						<br>
						<h4>
						<label>성별 : </label>
						<input type="radio" name="gender" ng-model="user.gender" value="M">남자
						<input type="radio" name="gender" ng-model="user.gender" value="F">여자		
						</h4>								
						<br>
						
				 	<!-- <input type="button" value="Join" class="btn btn-primary py-3 px-5" onkeydown="check()" onclick="check()">    --> 
				 	
					  <button id="join_btn" class="btn btn-lg btn-primary btn-block signup-btn" type="submit">회원가입</button>	 
						

					
						</form>
					

					
					
					<div>

					</div>
					
					
				</div>
			</div>
		</div>
	</body>

	
</html>