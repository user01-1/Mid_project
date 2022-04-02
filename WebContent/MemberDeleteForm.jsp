<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	border-collapse: collapse;
}
</style>
</head>
<body>
<br><br><br><br><br>
	<center>
		<h2>회원 탈퇴</h2>
	</center>
	<%
		request.setCharacterEncoding("euc-kr");
	String id = (String) session.getAttribute("id");
	%>
	<table width="400" border="1" align="center">
		<form action="MemberDeleteProc.jsp" method="post">

			<tr height="50" align="center">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=id%></td>
			</tr>

			<tr height="50" align="center">
				<td align="center" width="150">패스워드</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>

			<tr height="50" align="center">
				<td align="center" width="150" colspan="2"><input type="hidden"
					name="id" value="<%=id%>"> <input type="submit"
					value="회원 삭제하기"></td>
			</tr>
		</form>
	</table>
	<br><br><br><br><br><br>
</body>
</html>