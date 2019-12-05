<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	//총합	
	function totalSum() {
		var total = 0;
		$(".sum").each(function(idx, data) {
			total += Number.parseInt($(data).text());
		});
		$("#total").text(total);
	}

	$(document).ready(function() {
		totalSum();
		
		//전체 주문
		$("#orderAllConfirm").on("click",function(){
			$("form").attr("action", "loginCheck/orderAllConfirm");
			$("form").submit();
		});
		
		//주문
		$(".orderBtn").on("click",function(){
			var num = $(this).attr("data-num");
			location.href="loginCheck/orderConfirm?num="+num;
		});
		
		//전체 삭제
		$("#delAllCart").on("click",function(){
			$("form").attr("action", "loginCheck/delAllCart");
			$("form").submit();
		});
		
		//전체 선택
		$("#allCheck").on("click", function() {
			var result = this.checked;
			console.log(result);
			$(".check").each(function(idx, data) {
					this.checked = result;
			});
		});
		
		$(".delBtn").on("click",function() {
			var num = $(this).attr("data-num");
			var xxx = $(this);
			console.log(num);
			$.ajax({
				url:'loginCheck/cartDelete',
				type:"get",
				dataType:'text',
				data:{
					num:num,
					
				},
				success:function(data,status,xhr){
					 //Dom 삭제
					 xxx.parents().filter("tr").remove();
			    },
			   error:function(xhr,status,error){
				   console.log(error);
			   }
			})//ajax
			});//clcik 
		
		$(".updateBtn").on("click",function() {
			   var num = $(this).attr("data-num");
			   var sAmount = $("#cartAmount" + num).val();
			   var sPrice = $(this).attr("data-price");
			   console.log(num, sPrice, sAmount);
			   $.ajax({
				url : 'loginCheck/cartUpdate',
				type : "get",
				dataType : 'text',
				 data : {
						 num : num,
						 sAmount : sAmount
						},
						  success : function(data, status, xhr) {
						  var total = Number.parseInt(sAmount)* Number.parseInt(sPrice);
						  $("#sum" + num).text(total);
						  
						  totalSum();
						},
						  error : function(xhr, status, error) {
						  console.log(error);
					   }
					})//ajax
			});//clcik 
	});//end ready

	/*var httpRequest;
	var myNum;  
	function amountUpdate(num){
	myNum=num;
		  var sAmount = 
			   document.getElementById("cartAmount"+num).value;
		   console.log(num, sAmount);

		httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange=responseFun;
		
		var update= "CartUpdateServlet?num="+num+"&sAmount="+sAmount;
		httpRequest.open("get",update,true);
		httpRequest.send(null); //get방식
	}
	
	function responseFun(){
		if(httpRequest.readyState==4 && 
				httpRequest.status==200){
			 alert("수정 성공");
		console.log(document.getElementById("ssPrice"+myNum));

		 var price = document.getElementById("ssPrice"+myNum).innerText;
		 var amount= document.getElementById("cartAmount"+myNum).value;
		 var sum= Number.parseInt(price)* Number.parseInt(amount);
	 	 document.getElementById("sum"+myNum).innerText= sum;
			 
		}//end if
	}//end responseFun

	function delCart(num){
		location.href="CartDelServlet?num="+num;
	}
	
	function allCheck(all){
	  // class="check" 추출
	  var z = document.querySelectorAll(".check");
	  console.log(z);
	  for(var x of z){
		  x.checked=all.checked;
	  }
	}//
	
	function delAllCart(delAll){
		delAll.action="CartDelAllServlet";
		delAll.submit();
	}
	function order(num){
		location.href="CartOrderConfirmServlet?num="+num;
	}
	function orderAllConfirm(orderAll){
		orderAll.action="CartOrderAllConfirmServlet";
		orderAll.submit();
	}*/
</script>
<title>장바구니</title>
<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>- 장바구니-</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center"><input type="checkbox"
			name="allCheck" id="allCheck"> <strong>전체선택</strong></td>
		<td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>



	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>



	<form name="myForm">


		<!-- 반복시작 -->
		<c:forEach var="x" items="${cartList}">

			<input type="text" name="num81" value="${x.num}" id="num81">
			<input type="text" name="sImage81" value="${x.sImage}" id="sImage81">
			<input type="text" name="sName81" value="${x.sName}" id="sName81">
			<input type="text" name="sSize81" value="${x.sSize}" id="sSize81">
			<input type="text" name="gColor81" value="${x.sColor}" id="gColor81">
			<input type="text" name="gPrice81" value="${x.sPrice}" id="gPrice81">

			<tr>
				<td class="td_default" width="80"><input type="checkbox"
					name="check" id="check81" class="check" value="${x.num}"></td>

				<td class="td_default" width="80">${x.num}</td>

				<td class="td_default" width="80"><img
					src="image/items/${x.sImage}.jpg" border="0" align="center"
					width="80" /></td>

				<td class="td_default" width="300" style='padding-left: 30px'>
					${x.sName} <br> <font size="2" color="#665b5f"> [옵션 :
						사이즈(${x.sSize}) , 색상(${x.sColor})] </font>
				</td>

				<td class="td_default" align="center" width="110"><span
					id="ssPrice${x.num}">${x.sPrice}</span></td>

				<td class="td_default" align="center" width="90"><input
					class="input_default" type="text" name="cartAmount"
					id="cartAmount${x.num}" style="text-align: right" maxlength="3"
					size="2" value="${x.sAmount}"></input></td>

				<td><input type="button" value="수정" class="updateBtn"
					data-num="${x.num}" data-price="${x.sPrice}" /></td>

				<td class="td_default" align="center" width="80"
					style='padding-left: 5px'><span id="sum${x.num}" class="sum">
						${x.sPrice * x.sAmount} </span></td>

				<td><input type="button" value="주문" class="orderBtn"
					data-num="${x.num}"></td>

				<td class="td_default" align="center" width="30"
					style='padding-left: 10px'><input type="button" value="삭제"
					class="delBtn" data-num="${x.num}"></td>

				<td height="10"></td>
			</tr>

			<!-- 반복끝 -->
		</c:forEach>
	</form>
	<tr>
		<td colspan="10">총합:<span id="total"></span>
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center" colspan="5">
			<button id="orderAllConfirm">전체주문하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="delAllCart">전체 삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<button>계속 쇼핑하기</button>
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>

</table>



