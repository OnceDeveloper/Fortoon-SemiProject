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
                  <legend>회원정보수정</legend>
                                       
           <div class="form-group row">
             <div class="col-md-12">
                   <input type="text" name="m_id" id="m_id" class="form-control input-lg" placeholder="ID" ng-model="user.email" ng-required="true" value="${sessionScope.loginUser.m_id}">  
             </div>
             </div>
                  
       
               <input type="text" id="pwd" name="pwd" class="form-control input-lg" placeholder="비밀번호" ng-model="user.password" ng-required="true" ng-pattern="/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/" required/>
         <br>
               <input type="text" id="pwdcheck" name="pwdcheck" class="form-control input-lg" placeholder="비밀번호 재확인" ng-model="user.repassword" ng-required="true" required/>
            
   

         
   
         <br>
         <div ng-show="signUpForm.password.$error.pattern" class="alert alert-warning" role="alert">최소 5글자, 최대 10글자이고 적어도 1개의 소문자, 대문자, 숫자를 포함해야합니다.</div>
   
         
  
                     
                     <br>
                  
                  <div class="row">
                     <div class="col-xs-12 col-md-12">
                        <input type="text" name="name" class="form-control input-lg" ng-model="user.firstName" placeholder="이름" ng-required="true" value="${sessionScope.loginUser.name}"/>
                     </div>         
                  </div>
                  
                  <br>
                  <input type="text" name="brith" class="form-control input-lg" placeholder="생년월일" ng-model="user.birth" ng-required="true" value="${sessionScope.loginUser.brith}"/>
                  <br>
                  <input type="text" name="phone" class="form-control input-lg" placeholder="휴대전화" ng-model="user.phone" ng-required="true" value="${sessionScope.loginUser.phone}"/>
                  <br>
                  <h4>
                  <label>성별 : </label>
                  <input type="radio" name="gender" ng-model="user.gender" value="M">남자
                  <input type="radio" name="gender" ng-model="user.gender" value="F">여자      
                  </h4>                        
                  <br>
                  <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">정보수정</button>      
      

               </form>
               

               
               
               <div>

               </div>
               
               
            </div>
         </div>
      </div>
   </body>
   
   
   
   
   
   
</html>