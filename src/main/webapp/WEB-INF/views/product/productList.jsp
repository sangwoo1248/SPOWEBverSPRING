<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">

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
<c:forEach var="dto" items="${productList}" varStatus="status">
				<td>
				 <table style='padding: 15px'>
				 
				 <tr>
						<td class="td_gray" align="center">
						<font color="blue">${dto.sBrand}</font>
						</td>
					</tr>
					
					<tr>
					  <td><a href="productRetrieve?sCode=${dto.sCode}"> 
						<img src="image/items/${dto.sImage}.jpg" border="0"
								   align="center" width="200">
							</a></td>
						</tr>
							<tr>
							  <td height="10">
							</tr>
							
								<tr>
									<td class="td_default" align="center">
									 <a class="a_black"
										href="productRetrieve?sCode=${dto.sCode}"> 
										${dto.sName}
										<br>
									 </a> <font color="gray"> -------------------- 
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
    
    <%-- <% 
    	  PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
		  List<ProductDTO> list = pDTO.getList();
		  
		  int curPage = pDTO.getCurPage(); 
		  int perPage = pDTO.getPerPage(); 
		  int totalRecord = pDTO.getTotalRecord(); 
		  int totalPage = totalRecord/perPage;
		  if(totalRecord%perPage!=0) totalPage++; 
		  for(int i = 1; i <= totalPage; i++) {
		  if(i==curPage) { 
		  out.print(i); 
		  } 
		  else {
		  out.print("<a href='productList?curPage="+i+">"+i+"</a>&nbsp;"); 
		  	} 
		  }
	 %> --%>




