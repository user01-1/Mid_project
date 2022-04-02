
<%@page import="db.MemberBean"%>
<%@page import="db.MemberDAO"%>
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
	<%
		String id = (String) session.getAttribute("id");
	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = mdao.oneSelectMember(id); //해당하는 id의 회원 정보를 리턴 받아야 함
	%>
	<br><br><br><br><br>
	<center>
		<h2><%=id %>님의 회원 정보</h2>
	</center>
	<table width="400" border="1" align="center">
		<tr height="50" align="center">
			<td align="center" width="150">아이디</td>
			<td width="250"><%=mbean.getId()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" width="150">이메일</td>
			<td width="250"><%=mbean.getEmail()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" width="150">전화</td>
			<td width="250"><%=mbean.getTel()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" width="150">주소</td>
			<td width="250"><%=mbean.getAddress()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" colspan="2">
				<button onclick="location.href='MainPage.jsp?center=MemberUpdateForm.jsp?'">
					회원수정</button>
				<button onclick="location.href='MainPage.jsp?center=MyPageProc.jsp'">
					목록보기</button>
			</td>
		</tr>
	</table>
	<br><br><br><br><br><br>
</body>
</html>