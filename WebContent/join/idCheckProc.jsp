<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>* 아이디 중복 확인 결과 *</h3>
<%
    //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
    String m_id=(String)request.getAttribute("m_id");
   // int cnt= dao.duplecateID(m_id);
    boolean flag = (Boolean)request.getAttribute("flag");
	System.out.println("????"+flag);
    out.println("입력 ID : <strong>" + m_id + "</stong>");
    if(flag){
    	out.println("<p>사용 가능한 아이디입니다.</p>");	
        out.println("<a href='javascript:apply(\"" + m_id + "\")'>[적용]</a>"); 

    	//    out.println("<a href='javascript:apply(\"" + m_id + "\")'>[적용]</a>");
%>

	<script>
    	function apply(m_id){
//    		alert("dd"); 
            //2) 중복확인 id를 부모창에 적용
            //부모창 opener
//            opener.document.getElementById("m_id").value = id;

             document.getElementById("m_id").value = opener.document.getElementById("m_id").value;

          opener.document.regForm.m_id.value=m_id;
            window.close(); //창닫기
        }//apply () end
    </script>
 <%
 	}else{
    	out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
    }//if end
 %>
 <hr>
 <a href="javascript:history.back()">[다시시도]</a>
 &nbsp; &nbsp;
 <a href="javascript:window.close()">[창닫기]</a>
 
 </body>
 </html>

