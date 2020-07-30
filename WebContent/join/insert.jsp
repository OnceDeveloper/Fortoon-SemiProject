<%@page contentType="text/html;charset=utf-8"%>


<%
    boolean flag = (Boolean)request.getAttribute("flag");
%>


    <script language='javascript'>
        if(${flag}){ //자바스크립트의 if
            alert("회원가입 되었습니다.");
            location.href="../index.jsp";
        }else{
            alert("아이디가 중복되었습니다. 다른 ID 사용하세요");
            location.href="../index.jsp";
        }
    
    </script>