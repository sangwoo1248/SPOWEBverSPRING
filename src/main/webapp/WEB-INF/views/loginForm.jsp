<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOWEB</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#member").on("click", function() {
	    location.href='member/loginForm.jsp';
	});
	
	$("#admin_member").on("click", function(event) {
		location.href='admin/adminLogin.jsp';
	});
});
</script>
</head>
<body>
<h1>로그인</h1>
<jsp:include page="common/top.jsp" flush="true"/><br>
<hr>
<input type="radio" id="member" name="login" value="로그인">로그인
<input type="radio" id="admin_member" name="login" value="관리자 로그인">관리자 로그인
<%-- <jsp:include page="member/loginForm.jsp" flush="true" /> --%>
<!-- <input id="member" name="member" type="radio" value="로그인" 
OnClick="member/loginForm.jsp'"/>로그인 -->
<!-- <input id="admin_member" name="admin_member" type="radio" value="관리자 로그인"
OnClick="member/adminLogin.jsp'"/>관리자 로그인 -->

</body>
</html>


