<%@page import="db.GameListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String gameName = request.getParameter("gameName");

	GEMDAO gdao = new GEMDAO();

	//게임정보 하나 추출함
	GameListBean bean = gdao.getOneGame(gameName);
	
	//장바구니에 넣어
	gdao.setBasketInsert(bean);
	%>
	<script>
		alert("게임을 장바구니에 넣었습니다.");
		location.href = "MainPage.jsp?center=Store.jsp";
	</script>
</body>
</html>