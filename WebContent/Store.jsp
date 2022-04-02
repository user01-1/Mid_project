<%@page import="db.GameListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
.myButton1 {
	box-shadow: 4px -2px 0px 0px #050505;
	background-color: #000000;
	border-radius: 8px;
	border: 2px solid #474747;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: 빙그레 메로나체;
	font-size: 12px;
	padding: 10px 10px;
	text-decoration: none;
	text-shadow: 0px 0px 0px #000000;
}

.myButton1:hover {
	background-color: #6b6b6b;
}

.myButton1:active {
	position: relative;
	top: 1px;
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

select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('img/arrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
<body>
	<!--  데이터 베이스에 연결하여 최신순 게임 뿌려주는 데이터 가져옴. -->
	<%
		GEMDAO gdao = new GEMDAO();
	//벡터를 이용하여 게임을 저장
	Vector<GameListBean> v = gdao.SelectGame();
	%>

	<h1>신규 인기 게임 Top3</h1>
	<table width="1000" align="center">
		<tr height="240">
			<%
				for (int i = 0; i < v.size(); i++) {
				GameListBean bean = v.get(i);
			%>
			<td with="330" align="center"><a
				href="MainPage.jsp?center=GameInfo.jsp?gameName=<%=bean.getGameName()%>">
					<img alt="" src="img/<%=bean.getImg()%>" width="300" height="220">
			</a>
				<p>
					<font> 게임명: <%=bean.getGameName()%>
					</font></td>

			<%
				}
			%>
		</tr>
	</table>

	<p>
	<center>
		<font size="4" color="#FFFFFF"> 게임 검색 하기</font>
		<form action="MainPage.jsp?center=GameTypeList.jsp" method="post">
			<font size="3"><b>게임 검색 하기</b></font> &nbsp;&nbsp; <select
				name="gameType">
				<option value="">카테고리를 선택하세요</option>
				<option value="캐주얼">캐주얼</option>
				<option value="전략">전략</option>
				<option value="인디">인디</option>
				<option value="어드벤처">어드벤처</option>
				<option value="액션">액션</option>
				<option value="스포츠">스포츠</option>
				<option value="롤플레잉">롤플레잉</option>
			</select>&nbsp;&nbsp;

			<!-- 데이터 전송 위한 서브밋 -->
			<input type="submit" value="검색" class="myButton1">
			&nbsp;&nbsp;
		</form>
		<!-- 버튼을 폼에 포함시키지 않는 이유는, 버튼 눌렀을 때 form action 실행되지 않게 하기 위해 -->
		<p>
			<button onclick="location.href='MainPage.jsp?center=GameAllList.jsp'"
				class="myButton2">전체보기</button>
	</center>
	<p>
</body>
</html>

