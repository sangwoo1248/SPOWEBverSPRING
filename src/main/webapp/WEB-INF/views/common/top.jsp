<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${empty login}">
<button type="button" onclick="location.href='loginForm'">로그인</button>&nbsp;
<button type="button" onclick="location.href='cartList'">장바구니</button>&nbsp;
<button type="button" onclick="location.href='SignUpForm'">회원가입</button>&nbsp;
<button type="button" onclick="location.href='BoardListServlet'">리뷰 게시판</button>&nbsp;
</c:if>
    
<c:if test="${! empty login}">
안녕하세요${login.username}님!<br>
<button type="button" onclick="location.href='loginCheck/logout'">로그아웃</button>&nbsp;
<button type="button" onclick="location.href='loginCheck/myPage'">마이페이지</button>&nbsp;
<button type="button" onclick="location.href='loginCheck/cartList'">장바구니</button>&nbsp;
<button type="button" onclick="location.href='BoardListServlet'">리뷰 게시판</button>&nbsp;
</c:if>       

<!-- <a href="loginForm">로그인</a> -->
<!-- <a href="">장바구니</a>&nbsp;
<a href="SignUpForm">회원가입</a>&nbsp;
<a href="AdminAddUIServlet">관리자 회원가입</a>&nbsp;
<a href="AdminLoginUIServlet">관리자 로그인</a>&nbsp;
<a href="BoardListServlet">리뷰 게시판</a> -->

<!-- <a href="loginCheck/myPage">내정보</a>&nbsp;
<a href="loginCheck/cartList">장바구니</a>&nbsp;
<a href="BoardListServlet">리뷰 게시판</a>&nbsp; -->