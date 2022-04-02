<%@page import="db.GEMDAO"%>
<%@page import="db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<jsp:useBean id="mbean" class="db.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

	<%
		MemberDAO mdao = new MemberDAO();
	// String 타입으로 저장되어 있는 패스워드를 가져옴. (DB에서 가져온 pass값이 저장)
	String pass = mdao.getPass(mbean.getId());

	// 삭제하기 위해서 작성한 패스워드값과 기존 DB에서 가져온 패스워드 값을 비교
	if (mbean.getPass1().equals(pass)) { //기존 패스워드와 DB 패스워드가 같다면 member 테이블 수정 가능
		//MemberDAO 클래스의 회원 삭제 메소드를 호출
		mdao.deleteMember(mbean.getId());

		//로그아웃 처리
		session.invalidate(); // 모든세션정보 삭제

		//장바구니 데이터 베이스 초기화
		GEMDAO gdao = new GEMDAO();
		gdao.BasketALLClean();
		gdao.MyGameALLClean();
		
	%>
	<script type="text/javascript">
		alert("회원 탈퇴 처리되었습니다.");
		location.href = "MainPage.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("패스워드가 맞지 않습니다. 다시 확인 해 주세요.");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>