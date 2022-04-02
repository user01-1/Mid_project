<%@page import="db.BasketBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GameListBean"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

	<%
		request.setCharacterEncoding("euc-kr");
	GameListBean bean = null;
	GEMDAO gdao = new GEMDAO();

	//장바구니에서 구매하기 버튼 눌러서 온 거니까 장바구니 DB를 MyGame DB로 옮길 것.
	Vector<BasketBean> v = gdao.BasketAllList();

	for (int i = 0; i < v.size(); i++) {
		//장바구니 v에서 게임 이름들 추출
		String gameName = v.get(i).getGameName();
		bean = gdao.getOneGame(gameName);
		//장바구니 DB에 넣음
		gdao.setMyGameInsert(bean);
	}
	%>
	<script>
		alert("구매 완료");
		location.href = "MainPage.jsp?center=MyGameList.jsp";
	</script>
</body>
</html>