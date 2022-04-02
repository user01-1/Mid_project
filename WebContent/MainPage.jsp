<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: '빙그레 메로나체';
}
</style>
<meta charset="EUC-KR">
<title>GEM</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String center = request.getParameter("center");
	//처음 실행 시에는 center값이 넘어오지 않기에 null처리
	if (center == null) {
		center = "Center.jsp"; //디폴트 center값 부여
	}
	%>

	<table width="600" align="center">
		<!-- Top -->
		<tr height="150">
			<td align="center" colspan="2"><jsp:include page="Top.jsp" /></td>
		</tr>
		<!-- Center -->
		<td align="center" width="1000"><jsp:include page="<%=center%>" /></td>
		</tr>
		<!-- Bottom -->
		<tr height="100">
			<td align="center" colspan="2"><jsp:include page="Bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>