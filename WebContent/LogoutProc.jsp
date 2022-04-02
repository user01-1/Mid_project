<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		session.invalidate(); // 모든 세션 정보 삭제
		
		//로그아웃 시 장바구니 데이터 베이스 초기화
		GEMDAO gdao=new GEMDAO();
		gdao.BasketALLClean(); 
		gdao.MyGameALLClean(); 
	%>
	<script>
		alert("로그아웃 되었습니다.");
		location.href = "MainPage.jsp";
	</script>
</body>
</html>