<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
.table {
	border-collapse: collapse;
}
</style>
<body>

	<%
		String id = (String) session.getAttribute("id");
	%>
	<br>
	<br>
	<h2 align="center">
		<%=id%>님의 마이페이지 입니다.
	</h2>
	<br>
	<br>

	<table align="center" class="table"  border="3">

		<tr align="center" height="110">
			<td><a href="MainPage.jsp?center=GameBasketList.jsp"> <img
					src="img/basketicon.png" width="120" height="110">
			</a></td>
			<td><a href="MainPage.jsp?center=Event.jsp"> <img
					src="img/eventicon.png" width="120" height="110"></a></td>
			<td><a href="MainPage.jsp?center=MyGameList.jsp"> <img
					src="img/mygameicon.png" width="120" height="110"></a></td>
		</tr>

		<tr align="center" height="110">
			<td><a href="MainPage.jsp?center=MemberInfo.jsp"> <img
					src="img/MemberUpdateicon.png" width="120"></a></td>

			<td><a href="MainPage.jsp?center=MemberDeleteForm.jsp"> <img
					src="img/MemberRemoveicon.png" width="120"></a></td>

			<td><a href="MainPage.jsp?center=plzDonation.jsp"> <img
					src="img/donation.png" width="120" height="110"></a></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>