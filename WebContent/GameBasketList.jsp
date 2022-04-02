<%@page import="db.BasketBean"%>
<%@page import="db.GEMDAO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
.myButton {
	box-shadow: 4px -2px 0px 0px #050505;
	background-color:#000000;
	border-radius:8px;
	border:2px solid #474747;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:빙그레 메로나체;
	font-size:12px;
	padding:10px 10px;
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
}table
{
    border-collapse: collapse;
}
th, td
{
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}
</style>
<body>
	<center>
		<h1>장바구니 목록</h1>
	</center>

	<%
		//데이터베이스에 접근
	GEMDAO gdao = new GEMDAO();
	//장바구니 전체를 가져옴.
	Vector<BasketBean> v = gdao.BasketAllList();
	//총 금액
	int totalPrice = 0;
	int gameNum = 0;
	%>

	<table width="1000">
		<%
			for (int i = 0; i < v.size(); i++) {
			BasketBean bean = v.get(i);
			totalPrice += bean.getPrice();
		%>
		<tr align="center" height="60">
			<td rowspan="4" width="300"><img src="img/<%=bean.getImg()%>"
				width="300" height="200" ></td>
			<td></td>
			<td></td>
			<td rowspan="4" width="200">
				<button onclick="location.href='GameBasketRemove.jsp?gameName=<%=bean.getGameName()%>'" class="myButton">장바구니에서 제거</button>
			</td>
		</tr>
		<tr height="60" align="center">
			<td height="60">게임 명</td>
			<td><%=bean.getGameName()%></td>
		</tr>
		<tr height="60" align="center">
			<td >가격</td>
			<td><%=bean.getPrice()%> ￦ </td>
		</tr>
		<tr height="60">
			<td></td>
			<td></td>
		</tr>
		<%
			gameNum++;
		}
		%>
		<tr align="center">
			<td style="border-right: 2px solid #EAEAEA;">총 <%=gameNum%> 개의 게임
			</td>
			<td>총 금액</td>
			<td style="border-right: 2px solid #EAEAEA;"><%=totalPrice%> ￦ </td>
			<td>
				<button onclick="location.href='BuyingProc.jsp'" class="myButton">구매하기</button>
			</td>
		</tr>
	</table>
</body>
</html>