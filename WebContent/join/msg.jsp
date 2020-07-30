<%@page contentType="text/html;charset=utf-8"%>
<%
    String kind = (String)request.getAttribute("kind");
    boolean result = (Boolean)request.getAttribute("result");
    System.out.println("kind: " + kind + ", result: " + result);
%>
 
<script language="javascript"> 
	if("<%=kind%>" == "update"){
		   if(<%=result%>){
			   alert("정보수정 성공!");
		   }else {
			   alert("정보수정 실패!");
		   }
	}else{
		   if(<%=result%>){
			   alert("비밀번호 수정 성공!");
		   }else {
			   alert("비밀번호 수정 실패!");
		   }
	}
	
	location.href="../index.jsp";
</script>

