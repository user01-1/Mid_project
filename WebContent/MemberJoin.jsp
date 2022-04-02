<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <style type="text/css">
body {
	font-family: '빙그레 메로나체';
}

.myButton2 {
	box-shadow: 4px -2px 0px 0px #050505;
	background-color: #000000;
	border-radius: 8px;
	border: 2px solid #474747;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: 빙그레 메로나체;
	font-size: 12px;
	padding: 10px 60px;
	text-decoration: none;
	text-shadow: 0px 0px 0px #000000;
}

.myButton2:hover {
	background-color: #6b6b6b;
}

.myButton2:active {
	position: relative;
	top: 1px;
}

table {
	border-collapse: collapse;
}

.table{
	border-left: hidden;
	border-right: hidden;
	border-bottom: hidden;
}
</style>
</head>
<body>
	<center><h2>회원 가입</h2></center>

	<form action="MemberJoinProc.jsp" method="post">
		<table border="1" align="center">
			<tr height="50">
				<td width="150" align="center">아이디</td>
				<td width="350" align="center"><input type="text" name="id"
					size="40" placeholder="ID를 입력해주세요."></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">패스워드</td>
				<td width="350" align="center"><input type="password"
					name="pass1" size="40" placeholder="영문과 숫자만 입력해주세요."></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">패스워드 확인</td>
				<td width="350" align="center"><input type="password"
					name="pass2" size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">이메일</td>
				<td width="350" align="center"><input type="email" name="email"
					size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">전화번호</td>
				<td width="350" align="center"><input type="tel" name="tel"
					size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">주소</td>
				<td width="350" align="center"><input type="text"
					name="address" size="40"></td>
			</tr>
			<tr height="50" >
				<td align="center" colspan="2"  class="table">
				<br>
					<input type="submit" value="회원 가입" class="myButton2" ></td>
			</tr>
		</table>
	</form>
</body>
</html>