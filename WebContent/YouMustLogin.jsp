<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	String id=(String) session.getAttribute("id");
	
	if(id==null){
	%>
	<script>
		alert("로그인 후 구매가 가능합니다.");
		location.href="Login.jsp";
	</script>
	<%
	}else{
		response.sendRedirect("GameBasketProc.jsp?gameName="+request.getParameter("gameName"));
	}
	%>
</body>
</html>