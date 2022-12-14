<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	a.header-brand>span{
		color:#000 !important;
		border-bottom: 5px solid #cff0cc;
	}
	
	.brand_layout{
		margin-top: 30px;
	}
	.brandTop{
	   margin: 30px 250px;
	    width: 70%;
	    border-bottom: 1px solid #ebebeb;
	    position: relative;
	    padding: 0 16px;
	}
	
	brandTop_inner{
	    display: flex;
	    flex-wrap: nowrap
	}
	.brandTop_logo{
		display:flex;
		align-items: center;
	    margin: 0;
	    padding: 0;
	    margin-right: 24px;
	}
	.brandTop_logo img{
	    width: 120px;
	    border-radius: 24px;
	}
	.brandTop_name{
	    box-sizing: border-box;
	    margin-bottom: 16px;
	    font-weight: 600;
	    font-size: 28px;
	}
	.brandTop_desc{
	    margin-bottom: 16px;
	    font-weight: 500;
	    margin-top: 12px;
	    font-size: 16px;
	}
	.brandContent{
	    position: relative;
	    background: #fff;
	    z-index: 10;
	    padding: 0 16px;
	}
	
	.brandList{
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    max-width: 1180px;
	    margin: 32px auto;
	}
	.productImage{
		width:100%;
		border-radius: 10px;
	
	}
	
	}
	.categoryName{
		margin: auto;
	    display: flex;
		width: 1200px;   
		padding-top: 2%;
		padding-bottom: 1%; 
	
	}
		 
	 .categoryTotal{
		text-align: center;
		margin: auto;
	    display: flex;
	    justify-content: space-around;
		width: 1200px;
		margin: auto;	    
	    flex-direction: row;
	    flex-wrap: wrap;
	    align-content: stretch;
	    align-items: baseline;
	} 
	
	.cateImage{
		width: 90px;
		border-radius: 30px;
		
	}
	
	.productImage{
		width:100%;
		border-radius: 10px;
	
	}
	
	.categorySort{
	    font-weight: 400;
	    line-height: 16px;
		width: 100px;
	    border: 0px;
	    font-size: 15px;
	    margin-right: 15px;
	}
	
	
	.categorySort:focus{
    box-sizing: border-box;
    border-radius: 5px;
    outline: 3px solid #F8E4FF;
	}
	
	.productList {
		width: 1200px;
	    display: flex;
	    margin: auto;
	    margin-top: 10px;
	    flex-wrap: wrap;
	    justify-content: flex-start;
	} 
	
	.productItem{
		width: 280px;
		padding-bottom: 5%;
		margin-right: 20px;
	}
	
	.brandName{
		font-weight: bold;
		font-size: 18px;
	}
	
	.productName{
		font-size: 18px;
	
	}
	
	.productPrice{
		font-weight: bold;
		font-size: 20px;
		
	}
	.card-img-top{
		width: 280px;
		height: 280px;
		border: 0.1px solid #d3d3d3;
		border-radius: 5px;
		margin-bottom: 5px;
	}
</style>
</head>
<body>
<div class="brand_layout">
	<!-- ????????? ????????? ?????? -->
	<div class="brandTop">
		<div class="brandTop_inner input-group" style="flex-wrap: nowrap">
			<div class="brandTop_logo">
				<img alt="???????????????" src="${dto.logoImage}">
			</div>
			<div class="brandTop_content">
				<p class="brandTop_name">${brand}</p>
				<p class="brandTop_desc">${dto.description}</p>
			</div>
		</div>
	</div>
	<!-- ????????? ????????? ?????? ??? -->
	<!-- ????????? ??? -->
	<div class="brandContent">
		<!-- ?????? -->
		<div class="brandList">
			<span><h5>??? ?????? ?????? : ${count}???</h5></span>
			<div>
				<select class="categorySort" name="sort">
					<option value="createdAt desc" selected>?????????</option>
					<option value="price desc">???????????????</option>
					<option value="price asc">???????????????</option>
					<option value="readCount desc">?????????</option>
				</select>
			</div>
		</div> 
		<!-- ?????? ??? -->
		<!-- ????????????  -->
		<div class="productList">
		<c:forEach var="productList" items="${productList}">
			<div class="productItem">
			<a href="/jogong/product/detail?num=${productList.num}">
				<img class='card-img-top' src="${productList.thumbnailImageUrl }" alt='Card image cap'>
				<span style="display: inline-block;">
					<span class='brandName'>${productList.brand }</span><br>
					<span class='productName'>${productList.name }</span><br>
					<span class='productPrice'><fmt:formatNumber value="${productList.price}" type="number"/>???</span>
				</span>
			</a>
			</div>
		</c:forEach>	
		</div>
	<!-- ???????????? ???  -->
	</div><!-- ????????? ??? ??? -->
</div>
</body>
<script type="text/javascript">
$(function () {
	$(".categorySort").change(function() {
		var sort=$(this).val();
		var s= "";
		 $.ajax({
				type:"get",
				url:"brandSort",
				dataType:"json",
				data:{"brand":'${brand}', "sort":sort},
				success:function(res){
					
					$(".productList").empty();	
					$.each(res.productList, function(i,elt) {
						var price= elt.price.toLocaleString();
						s += "<div class='productItem'>";
						s += "<a href='/jogong/product/detail?num="+elt.num+"'>";
						s += "<img class='card-img-top' src='"+elt.thumbnailImageUrl+"'class='productImage'><br>";
						s += "<span style='display: inline-block;'>";
						s += "<span class='brandName'>"+elt.brand+"</span><br>";
						s += "<span class='productName'>"+elt.name+"</span><br>";
						s += "<span class='productPrice'>"+price+"???</span>";
						s += "</span>";
						s += "</a>";
						s += "</div>";
					});
					$(".productList").append(s);
				}
			});
		});
	});

</script>
</html>