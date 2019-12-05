<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>

  
			

	
	
</script>

<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td><b>구매정보</b></td>
	</tr>
	
	<tr>
		<td class="td_default"><b>구매정보</b>
		</td>
	</tr>
	
	<tr>
		<td height="15">
	</tr>
	
	
	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
	
	<tr>
		<td width="250" class="td_default" height="35" align="center"><strong>상품번호</strong></td>
		<td width="250" class="td_default" height="35" align="center"><strong>고객이름</strong></td>		
		<td width="100" class="td_default" height="35" align="center"><strong>상품명</strong></td>
		<td width="100" class="td_default" height="35" align="center"><strong>상품이미지</strong></td>
		<td class="td_default" width="50" height="35" align="center"><strong>가격</strong></td>
		<td class="td_default" width="100" height="35" align="center"><strong>수량</strong></td>
		<td class="td_default" width="100" height="35" align="center"><strong>합계</strong></td>
	</tr>
	
	
	<tr>
					<td height="35" class="td_default">
						<span class="a_default">${oDTO.num}</span>
					</td>
					<td height="35" class="td_default">
						<span class="a_default">${oDTO.userid}</span>
					</td>
					<td height="35" class="td_default">
						<span class="a_default">${oDTO.sName}</span>
					</td>
					<td height="35" class="td_default">
					<span><img src="images/items/${x.sImage}.gif" 
					border="0" align="center"width="80" />
					</span>
					</td>
					<td height="35" class="td_default" align="center">
						<span  id = "price1">${oDTO.sPrice}</span>원
					</td>
					<td height="35" class="td_default" align="center">
						<span id = "num1">${oDTO.sAmount}</span>개
					</td>
					<td height="35" class="td_default" align="center">
						<span>${oDTO.sPrice * oDTO.sAmount}</span>원
					</td>
				</tr>
		</table>
	</td>
 </tr>
 
	<tr>
		<td class="td_default" align="center">
		<a class="td_default" href="main.jsp">메인화면</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a class="td_default" href="index.jsp">계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	
	<tr>
		<td height="20">
	</tr>

</table>


	
	

	