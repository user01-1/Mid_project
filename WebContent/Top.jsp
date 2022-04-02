<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
	String id = (String) session.getAttribute("id");
	if(id==null)
		id="Guest";
	%>
	<table width="1000"> 
		<tr height="100">
			<td><a href="MainPage.jsp"> 
								<img src="img/GEM.png" width="200" height="100"> </a> </td>
			<td colspan="3" align="center"> <font size=10> 완전 멋진 게임사이트</font> </td>
					<td width="150" align="center">
				<%=id %> 님 반갑습니다.
				<br><br>
			<% 
				if(id.equals("Guest")){
			%>
					<button onclick="location.href='Login.jsp'">로그인</button>
			<% 
				}else{
			%>	
					<button onclick="location.href='LogoutProc.jsp'">
						로그아웃
					</button>
			<% 						
				}			
			%></td>
		</tr>
		<tr height="50" bgcolor="#000000">
			<td width="200" align="center">
				<a href="MainPage.jsp?center=Store.jsp" style="text-decoration:none">
					<font color="#FFFFFF">STORE</font></a></td>
			<td width="200" align="center">
				<a href="MainPage.jsp?center=Sale.jsp" style="text-decoration:none">
					<font color="#FFFFFF">SALE</font></a></td>
			<td width="200" align="center">
				<a href="MainPage.jsp?center=Event.jsp" style="text-decoration:none">
					<font color="#FFFFFF">EVENT</font></a></td>
			<td width="200" align="center">
				<a href="MainPage.jsp?center=Help.jsp" style="text-decoration:none">
					<font color="#FFFFFF">HELP</font></a></td>
			<td width="200" align="center">
				<a href="MainPage.jsp?center=MyPageProc.jsp" style="text-decoration:none">
					<font color="#FFFFFF">MYPAGE</font></a></td>
		</tr>
	</table>
</body>
</html>