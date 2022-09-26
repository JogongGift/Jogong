<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
</head>
<style>
	div{
		border: 0px solid gray;
	}
	body * {
		font-size: 15px;
	}
	div.header-wrapper {
		display: flex;
		justify-content: space-between;
		max-width: 1180px;
		margin: 10px auto;
		padding: 16px 3px;
	}
	a {
		color: black;
		text-decoration: none;
	}
	div>a:hover {
		color: black;
		text-decoration: none;
	}
	a:link, a:visited {
		color: black;
		text-decoration: none;
	}
	div.left {
		display: flex;
		justify-content: flex-start;
		margin-right:10px;
		width:100%;
	}
	div.left>div {
		display: flex;
		align-items:center;
	}
	div.right {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		min-width:230px;
	}
	form.search{
	    display: flex;
	    align-items: center;
	    min-width: 100%;
	    padding: 10px 18px;
	    border-radius: 12.2px;
	    background: #f4f4f4;
	}
	div.menu>a{
		margin-right:20px;
	}
	div.right button{
		margin-left:10px;
	}
	div.home{
		min-width:60px;
		width:100%;
		max-width:120px;
	}
	div.home>a{
		font-size:30px;
	}
	div.menu{
		min-width:180px;
	}
	div.search-box{
		width:100%;
		max-width:500px;
	}
	div.search-box img{
		width:20px;
		margin-right:12px;
	}
	a.login {
		color: #ff3c78;
		font-size:20px;
		font-weight:400;
		margin-left:10px;
	}
	a.login:hover {
		color: #ff3c78;
		text-decoration: none;
	}
	button.btn {
		background-color: #ff3c78;
		color: #fff;
		font-weight:400;		
	}
</style>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="header-wrapper">
		<div class="left">
			<div class="home">
				<a href="${root}">조공</a>
			</div>
			<div class="menu">
				<a href="${root}">브랜드</a>
				<a href="${root}">카테고리</a>
				<a href="${root}">후기</a>
			</div>
			<div class="search-box">
				<form class="search">
					<img src="${root}/image/search.svg">
					<input disabled="disabled" type="text" placeholder="선물, 브랜드 검색" autocomplete="off" aria-required="true" aria-invalid="false" style="cursor: pointer; border:0px;">
				</form>
			</div>
		</div>
		<div class="right">
			<div>
				<a href="${root}">고객센터</a>
			</div>
			<div>
				<a class="login" href="${root}">로그인</a>
			</div>
			<div>
				<button type="button" class="btn">회원가입</button>
			</div>
		</div>
	</div>	
</body>
</html>