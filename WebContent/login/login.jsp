<%@page contentType="text/html;charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<meta charset="utf-8">
<script src="../js/trim.js"></script>
<script language="javascript"> 
    function check(){
		var idval = f.id.value;
		idval = trim(idval);
		if(idval.length == 0){
			alert("ID를 넣어주세요");
			f.id.value = "";
			f.id.focus();
			return false;
		}else{
			pass = checkByteLen(idval, 50);
			if(!pass){
				alert("ID가 너무 길어요");
				f.id.focus();
				return false;
			}
		}
		
		var pwdval = f.pwd.value;
		pwdval = trim(pwdval);
		if(pwdval.length == 0){
			alert("비번을 넣어주세요");
			f.pwd.value = "";
			f.pwd.focus();
			return false;
		}else{
			pass = checkByteLen(pwdval, 30);
			if(!pass){
				alert("비번이 너무 길어요");
				f.pwd.focus();
				return false;
			}
		}

		f.submit();
	}

    function checkByteLen(str, size){
        var byteLen = getByteLen(str);
		if(byteLen <= size){
			return true;
		}else{
			return false;
		}
	}
	function getByteLen(str){
	   return str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
    }
	
	function enterCheck(elm){
		if(event.keyCode == 13){
			if(elm == f.email){
				f.pwd.focus();
			}else{
				check();
			}
		}
	}
</script>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="../img/logo1.png"  id="icon" alt="User Icon" />

    </div>

    <!-- Login Form -->
    <form name ="f" action="login.do?m=check" method="post">
      <input type="text" id="login" class="fadeIn second" name="id" placeholder="ID" onkeydown="enterCheck(this)">
      <input type="text" id="password" class="fadeIn third" name="pwd" placeholder="Password" onkeydown="enterCheck(this)">
      <input type="submit" class="fadeIn fourth" value="Log In" onclick="check()" onkeydown="check()">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
    <a class="underlineHover" href="../join/join_form.jsp">Join up?</a><br/>
      <a class="underlineHover" href="../join/findID.jsp">Forgot ID? &nbsp;/</a>
      <a class="underlineHover" href="../join/findPWD.jsp">&nbsp;Forgot PASSWORD?</a>
    </div>

  </div>
</div>