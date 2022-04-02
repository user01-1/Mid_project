<%@page import="db.GameListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
table {
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

</style>
<body>
	<table width="900" width="1000" align="center">
		<%
			//데이터베이스에 접근
		GEMDAO gdao = new GEMDAO();
		//장바구니 전체를 가져옴.
		Vector<GameListBean> v = gdao.MyGameAllList();
		%>

		<h1 align="center">구매한 게임 목록</h1>
		<br><br>
		<%
			for (int i = 0; i < v.size(); i++) {
			GameListBean bean = v.get(i);
		%>
		<tr align="center">
			<td rowspan="6" style="border-right: 2px solid #EAEAEA;" ><%=i + 1%></td>
			<td rowspan="6" width="300" style="border-right: 2px solid #EAEAEA;"><img src="img/<%=bean.getImg()%>"
				width="300" height="400"></td>
			<td height="60" style="border-right: 2px solid #EAEAEA;">게임명</td>
			<td width="300"><%=bean.getGameName()%></td>
		</tr>
		<tr align="center">
			<td height="60" style="border-right: 2px solid #EAEAEA;">구매가격</td>
			<td><%=bean.getPrice()%> ￦</td>

		</tr>
		<tr align="center">
			<td height="60" style="border-right: 2px solid #EAEAEA;">카테고리</td>
			<td><%=bean.getGameType()%></td>

		</tr>
		<tr align="center">
			<td height="60" style="border-right: 2px solid #EAEAEA;">출시일</td>
			<td><%=bean.getRelease()%></td>
		</tr>
		<tr align="center">
			<td height="60" style="border-right: 2px solid #EAEAEA;">개발자</td>
			<td><%=bean.getDeveloper()%></td>
		</tr>
		<tr align="center">
			<td height="60" style="border-right: 2px solid #EAEAEA;">사용자 평가</td>
			<td><%=bean.getEvaluation()%></td>
		</tr>


		<%
			}
		%>
	</table>
</body>
</html>