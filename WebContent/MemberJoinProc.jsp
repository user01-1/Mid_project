<%@page import="db.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	%>

	<!-- useBean을 이용하여 한번에 데이터 받아오기 -->
	<jsp:useBean id="mbean" class="db.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
		<!-- 모두 매핑 -->
	</jsp:useBean>

	<%
		if (pass1.equals(pass2)) {
		//데이터 베이스 클래스 객체 생성
		//멤버 생성해야 그 안에 있는 메소드를 사용할 수 있으니 생성하는 것.
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);
	} else {
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다."); // 경고창
		history.go(-1); //이전 페이지로 이동
	</script>
	<%
		}
	%>
	<!-- 회원 가입이 되었다면 로그인창으로. -->
	<script>
		alert("회원가입 완료");
		location.href = "Login.jsp";
	</script>
</body>
</html>