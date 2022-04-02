<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="db.MemberDAO"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	MemberDAO mdao = new MemberDAO();

	int result = mdao.getMember(id, pass);
	if (result == 0) {
	%>
	<script>
		alert("회원 아이디 또는 패스워드가 틀립니다.");
		location.href = "Login.jsp";
	</script>
	<%
		} else {
	//로그인 처리가 되었다면,
	session.setAttribute("id", id);
	response.sendRedirect("MainPage.jsp");
	}
	%>
</body>
</html>