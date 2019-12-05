<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스포츠 용품의 모든것!!!</title>
</head>
<body>
<h1 align="center">SPOWEB</h1>
<jsp:include page="common/top.jsp" flush="true" /><br>
<jsp:include page="common/menu.jsp" flush="true" />
<hr>
<jsp:include page="product/productList.jsp" flush="true" />
</body>
</html>

<!-- <form action="ProductSearchSevlet" flush="true">
<select name="sCategory">
<option value="TOP">상의</option>
<option value="BOTTOM">하의</option>
<option value="SHOES">신발</option>
<option value="OUTER">아우터/외투</option>
</select>
<input type="text" name="sBrand" width="50px">
<input type="image" src="image/d.png" width="20px" value="image">
</form> -->