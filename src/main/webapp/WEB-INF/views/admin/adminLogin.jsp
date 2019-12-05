<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<script type="text/javascript">

	function check() {
		if(f.id.value == "" || f.pass.value == "") {
			alert("자료를 입력하시오");
			return;
		} 
		else {
			f.submit();
		}
	}
</script>
</head>
<body>
<form action="AdminLoginServlet" name="f" method="get">
<h1>관리자 로그인</h1>
		<table style = "width:100%">
		<%

			String admin = (String)session.getAttribute("adminOk");

			if(admin !=null){

		%>

			<tr>

				<td>

					<script>

						window.opener.location.href="admin_index.jsp";

					</script>
					관리자 로그인 중입니다<br/>
					[<a href="adminLogout.jsp">로그아웃</a>]

					[<a href="javascript:window.close()">창닫기</a>]

				</td>				

			</tr>

		<%

			} else {

		%>

			<tr>
			<td>
			id : <input type="text" name="id"/>
			</td>
			</tr>
			<tr>
			<td>pw : <input type="text" name="password" />
			</td>
			</tr>

			<tr>
				<td>
					 <button onclick="check()">로그인</button>&nbsp;
					 <button onclick = "location.href = 'Main.jsp' ">돌아가기</button>
				</td>
			</tr>
		<%

			}

		%>
		</table>
	</form>
</body>
</html>