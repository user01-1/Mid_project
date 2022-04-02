<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> Login </title>
<style type="text/css">
body {
	font-family: '빙그레 메로나체';
}
.myButton {
	box-shadow: 4px -2px 0px 0px #050505;
	background-color:#000000;
	border-radius:8px;
	border:2px solid #474747;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:배달의민족 도현;
	font-size:18px;
	padding:14px 14px;
	text-decoration:none;
	text-shadow:0px 0px 0px #000000;
}
.myButton:hover {
	background-color:#6b6b6b;
}
.myButton:active {
	position:relative;
	top:1px;
}

table {
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
a:link { color:#000000; text-decoration: none;}  

a:visited { color:#000000; text-decoration: none;} 

a:hover { color:#000000; text-decoration: none;}

a:active { color:#000000; text-decoration: none;}
</style>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center> <img src="img/GEM.png"> </center>
	<br>
	<br>
	<form action="LoginProc.jsp" method="post">
		<table align="center" width="400">
			<tr align="center" height="50">
				<td colspan="3"><font size="5">Login</font></td>
			</tr>
			<tr align="center" height="50">
				<td width="100" style="border-bottom: none;">아이디</td>
				<td width="200" style="border-bottom: none;"><input type="text" name="id" size="19"></td>
				<td width="100" rowspan="2"><input type="submit" value="확인"
					class="myButton"></td>
			</tr>
			<tr height="50" align="center">
				<td width="150">패스워드</td>
				<td width="200"><input type="password" name="pass" size="20"></td>
			</tr>
		</table>
	</form>
	<br><br>
	<center>
		<a href="MainPage.jsp" style="text-decoration: non" >▶ 게스트로 접속 ◀</a>
		<br><br>
		<a href="MemberJoin.jsp" style="text-decoration: non">▶ GEM이 처음이신가요? ◀</a>
	</center>
</body>
</head>
</html>