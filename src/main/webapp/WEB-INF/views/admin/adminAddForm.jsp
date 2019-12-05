<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원가입</title>
</head>
<body>
<form name = "f" action="AdminAddServlet" method="get">
<table border="1" bordercolor="skyblue">

<tr>
<th scope="row" bgcolor="blue">아이디* 
</th>
<td> 
<input type="text" name="admin_id" id="admin_id">
<span id="result">(영문소문자/숫자, 4~16자)</span><br>
</td>
</tr>

<tr>
<th scope="row" bgcolor="blue">비밀번호*
</th>
<td>
<input type="password" id="admin_passwd" name="admin_passwd" maxlength="16" size="16"/> 
<span id="result">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span><br>
</td>
</tr>

<tr>
<th scope="row" bgcolor="blue">비밀번호확인*
</th>
<td>
<input type="password" id="passwd2" name="passwd2" maxlength="16" size="16"/> 
<span id="result"></span><br>
</td>
</tr>

<tr>
<th scope="row" bgcolor="blue">이름*
</th>
<td><input type = "text" id="admin_username" name="admin_username"/> 
</td>
</tr>
</table>
<input type="submit" value="회원가입">
<input type="reset" value="취소">
</form>
</body>
</html>