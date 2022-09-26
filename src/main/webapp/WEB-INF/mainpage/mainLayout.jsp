<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring5+Tiles3+Mybatis</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<c:set var="root" value="<%=request.getContextPath() %>"/>
<style type="text/css">
	body * {
		font-size: 15px;
	}
	#wrapper{
	  width:100%;
	  height: auto;
	  min-height: 100%;
	  padding-top: 100px;
	}
	#header{
		background-color: #fff;
		position: fixed;
		top: 0;
		width: 100%;
		height: 100px;
	}
	.content{
	  background-color:lightpink;
	  width:100%;
	}
	footer{
	  background-color:lightblue;
	  width: 100%;
	  height: 150px;
	  position : relative;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div class="content">
			<div id="gift">
				<tiles:insertAttribute name="gift"/>
			</div>	
			<div id="brand">
				<tiles:insertAttribute name="brand"/>
			</div>
			<div id="theme">
				<tiles:insertAttribute name="theme"/>
			</div>
			<div id="price">
				<tiles:insertAttribute name="price"/>
			</div>
		</div>
	</div>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>