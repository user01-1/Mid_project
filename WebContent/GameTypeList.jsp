<%@page import="db.GameListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		String type = request.getParameter("gameType");
	%>
	
	<h1> <%=type %> 게임 목록 </h1> 
	<!-- 데이터 몇개인지 모름. 반복문 돌면서 3개씩 3개가 출력되면 다시 tr부터 새롭게 밑으로 내려가야함. -->
	<table width="1000" align="center">
		<%
			// 카테고리(타입) 분류 값을 가져온다.
		type = request.getParameter("gameType");
		GEMDAO gdao = new GEMDAO();

		// 데이터 몇개 인지 정확히 알 수 없음. 벡터 사용.
		Vector<GameListBean> v = gdao.getTypeGame(type);

		//td을 3개씩 보여주고 다시 tr을 실행할 수 있도록 하는 변수 선언
		int j = 0;
		for (int i = 0; i < v.size(); i++) {
			//벡터에 저장되어있는 bean 클래스를 추출
			GameListBean bean = v.get(i);
			if (j % 3 == 0) {
		%>
		<tr height="220">
		<%
			}
		%>
			<td width="333" align="center">
				<a href="MainPage.jsp?center=GameInfo.jsp?gameName=<%=bean.getGameName()%>">
					<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
			</a>
				<p>
					<font size="3"><center><b>게임명: <%=bean.getGameName()%></b><p></center></font></td>
		<%
				j = j + 1; //j값을 증가시켜 하나의 행에 3개의 게임정보를 보여주기 위해 증가
			}
		%>
		
	</table>
</body>
</html>