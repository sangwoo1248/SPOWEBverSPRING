<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<meta charset="UTF-8">
<title>검색결과</title>
<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" 
			  cellpadding="0" border="0">

				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>

<!-- 반복시작 -->
<c:forEach var="dto" items="${seacrch}" varStatus="status">
				<td>
				 <table style='padding: 15px'>
				 
				 <tr>
				  <td class="td_gray" align="center">
					<font color="blue"><a class="a_black"
					 href="ProductRetrieveServlet?sBrand=${dto.sBrand}">
					  </a></font>
				  </td>
				  </tr>
					
					<tr>
				  <td class="td_gray" align="center">
					<font color="blue"><a class="a_black"
					 href="ProductRetrieveServlet?sCategory=${dto.sCategory}">
					  </a></font>
				  </td>
				  </tr>
				  
					<tr>
					  <td>${dto.sCode}
						<img src="image/items/${dto.sImage}.jpg" border="0"
						  align="center" width="200">
							</a></td>
						</tr>
							
							<tr>
							  <td height="10">
							</tr>
							
							<tr>
							 <td class="td_default" align="center">
								${dto.sName} 
								 <br>
							  <font color="gray"> -------------------- 
								   </font>
							   </td>
							  </tr>
								
								<tr>
									<td height="10">
								</tr>
								<tr>
								  <td class="td_gray" align="center">
								   ${dto.sContent}</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								
								<tr>
								 <td class="td_red" align="center">
								  <font color="red"><strong>
									${dto.sPrice} </strong></font></td>
								</tr>
							</table>
						</td>
						
						<!-- 한 줄에5개씩 -->
						<c:if test="${status.count %5 ==0}">
							<tr>
							 <td height="10">
							</tr>
						</c:if>
<!-- 반복끝-->
					</c:forEach>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>






<%-- <table border="1">
<tr>
 <th width="200">브랜드</th>
 <th width="200">제품코드</th>
 <th width="200">종류</th>
 <th width="200">상품명</th>
 <th width="200">이미지</th>
 <th width="200">가격</th>
 <th width="300">내용</th> 
</tr>

<%
   List<ProductDTO> list= (List<ProductDTO>)request.getAttribute("seacrch");  
   for(ProductDTO dto: list){
	String sBrand = dto.getsBrand();
	String sCode = dto.getsCode();
	String sImage = dto.getsImage();
	String sName = dto.getsName();
	String sCategory = dto.getsCategory();
	int sPrice = dto.getsPrice();
	String sContent = dto.getsContent();
%>

<tr>
	  <td>${seacrch.sBrand}</td>
	  <td>${seacrch.sCode}</td>
	  <td>${seacrch.sCategory}</td>
	  <td><a href="ProductSearchSevlet?sCategory=${seacrch.sCategory}">
	  ${seacrch.sName}</a></td>
	  <td><img src="image/items/${seacrch.sCode}.jpg" width="200"/></td>
	  <td>${seacrch.sPrice}</td>
	  <td>${seacrch.sContent}</td>
</tr>
<%
   }//end for
%>	
</table>
</body> --%>