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
	a.menu-friend {
    	color:#000 !important;
	}
	div.friend-wrapper {
		min-height: 600px;
		padding-bottom: 50px;
	}
	div.friend-top {
		padding: 25px 0;
		position:sticky;
		top:100px;
		background-color: white;
		height: 90px;
		z-index: 2;
		display: flex;
		justify-content: space-between;
	}
	div.friend-top div>hr{
		width: 90px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	b.friend-top-b2 {
		font-size: 25px;
		font-weight: 1000;
	}
	div.friend-menu {
		margin:0 auto; 
		width: 80%; 
		background-color: #fafafa; 
		display: flex; 
		justify-content: center;
		height: 40px;
		border-top: 1px solid #f0f0f0;
		border-bottom: 1px solid #f0f0f0;
		margin-bottom: 20px;

	}
	div.friend-menu span {
		font-size: 16px;
		color: #808080;
		height: 35px;
		position: relative;
		top: 3px;
	}
	div.friend-menu>div {
		cursor: pointer; 
		width: 50%; 
		display: flex; 
		justify-content: center; 
		align-items: center;
	}
	div.friend-menu>span{
		display: flex; 
		align-items: center; 
		color:#d0d0d0; 
		font-size: 15px; 
	}
	div.friend-object:hover {
		background-color: #eff9ee;	
	}
	.friend-after span {
		color:#000; 
		border-bottom: 3px solid #000;
	}
	.friend-object {
		display: flex; 
		flex-direction: row; 
		justify-content: flex-start; 
		padding:10px 40px; 
		widows: 100%;
	}
	.friend-object-left {
		display: flex; 
		justify-content: center; 
		align-items: center; 
		margin-right: 20px;
	}
	.friend-object-left img {
		background-color: #909090; 
		width:60px; 
		height:60px; 
		border-radius: 20px;
	}
	.friend-object-right {
		display: flex; 
		align-items: center; 
		width: 100%; 
		justify-content: space-between;
	}
	.friend-info {
		display: flex;
		height:100%; 
		flex-direction: column; 
		align-items: flex-start;
		padding-top: 5px;
	}
	.friend-name {
		font-size: 17px; 
		font-weight: 1000;
	}
	.friend-status {
		font-size: 13px; 
		font-weight: 1000; 
		color: #a0a0a0;
	}
	.friend-icon {
		width: 130px; 
		display: flex; 
		justify-content: space-between;
	}
	span.friend-after-count {
		margin: 30px 0;
	}
	div.friend-modal-result{
		margin-top: 10px;
    	overflow: auto;
    	height: 330px; 	
    }
	.fa-user-plus {
		font-size:24px; 
		position: relative; 
		right: 40px; 
		cursor: pointer;
	}
	
	/* modal */
	img.gift-friend-img {
		width: 50px;
		border-radius: 20px;
		border: 2px solid white;
	}
	#gift-modal.gift-modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(50, 50, 50, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        display: none;
        z-index: 999;
    }
    #gift-modal .gift-modal-window {
        background: #fff;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 400px;
        height: 600px;
        position: absolute;
        top: 80px;
        padding: 20px;
    }
    #gift-modal .gift-close-area {
        cursor: pointer;
        color: gray;
        font-weight: 400px;
        font-size: 20px;
        z-index: 999;
    }
    .modal-fix {
	    position: fixed;
	    width :100%;
	    height: 100%;
	    overflow: scroll;
	}
	 div.gift-title{
    	display: flex;
    	justify-content: space-between;
    }
    div.gift-modal-button{
    	width:90%;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	position: fixed;
    	bottom: 10px;
    }
    div.gift-modal-button>button{
    	width:100%;
    }
    div.gift-modal-button>div{
    	width:30px;
    }
    div.gift-modal-select-flex {
    	display: flex;
    	align-items: center;
    }
    div.gift-modal-select-object {
    	display: flex;
    	align-items: center;
    }
    div.gift-modal-select>input{
		margin-right: 5px;
    }
    div.gift-modal-select>img{
    	margin-left:0;
		margin-right: 5px;
    }
    div.gift-modal-search {
    	margin-top: 0px;
    	margin-bottom: -10px;
    }
    div.gift-modal-search input{
    	position:relative;
    	top:10px;
    	width:100%;
    	height: 40px;
    }
    div.gift-modal-search img{
    	width:30px;
    	position: relative;
    	top: -25px;
    	left: 325px;
    	cursor: pointer;
    }
    div.gift-friend-list{
 		height: 300px;
 		margin-top: 20px;
    }
    
    div.friend-result input{
    	position: relative;
    	top: 5px;
    }
    div.friend-result b{
    	position: relative;
   
    }
    div.friend-select-list {
    	height: 80px;
    	display: flex;
    	align-items: center;
    }
    div.gift-left{
   		display: flex;
   		align-items: center;
    }
    button.getWishlist {
    	background-color: #cff0cc;
    }
</style>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
    <input type="hidden" name="userNum" value="${sessionScope.loginUserNum}" />
	<div class="friend-wrapper">
		<div class="friend-top">
			<div>
				<b class="friend-top-b2">????????????</b>
				<hr>
			</div>
			<i class='fas fa-user-plus' id="friend-search-button"></i>
		</div>
		<div class="friend-menu">
			<div class="friend-after">
				<span>??? ??????</span>
			</div>
			<span>|</span>
			<div class="friend-before">
				<span>?????? ?????? ??????</span>
				<span class="friend-before-count"></span>
			</div>
		</div>
		<span class="friend-after-count" style="font-size: 17px; color: #808080; font-weight: 1000;">?????? 0</span>
		<div class="friend-result">
		</div>
	</div>
	<!--  ?????? ?????? modal -->
    <div id="gift-modal" class="gift-modal-overlay">
        <div class="gift-modal-window">
        	<form>
        	<div class="gift-modal-top">
	            <div class="gift-title">
	            	<div>
		                <h5>
		                	?????? ??????
		                	<span style="font-size: 20px; margin-bottom: 5px; color:#ff6b00;" class="friend-length"></span>
		                </h5>
	            	</div>
	            	<div class="gift-close-area">X</div>
	            </div>
	            <div class="friend-select-list">
	            	<img src="${root }/image/default.png" class="gift-friend-img">
	            	<b style="font-weight: normal; position: relative; left: 5px;">????????? ????????? ???????????????.</b>
	            </div>
	            <div class="gift-modal-search">
	            	<input type="search" placeholder="??????, ????????? ??????" id="friend-search" name="friend-search">
	            	<img src="${root}/image/search.svg" style="cursor: pointer" id="search-start">
	            </div>
        	</div>
            <div class="gift-modal-middle">
            	<div class="friend-modal-result">
            	</div>
            </div>
            <div class="gift-modal-button">
				<button type="button" class="btn btn-secondary btn-cancel">??????</button>
				<div></div>
				<button type="button" class="btn getWishlist">??????</button>
            </div>
            </form>
        </div>
    </div>
</body>
<script>
	//?????? ?????? ?????????
	const modal = document.getElementById("gift-modal");
	const btnModal = document.getElementById("friend-search-button");
	const closeBtn = modal.querySelector(".gift-close-area");
	
	// ????????? ?????? ??????
	var fl = 0;
	
	// ???????????? ?????? ??????
	let data = {
			userNum:$("input[name=userNum]").attr("value"),
			friendNum:$("input[name=userNum]").attr("value"),
			search:"",
			check:1
			};
	friendList(data);
	
		
	// ????????????
	$(document).on("click",".friend-after",function(){
	$(this).find("span").css({"color":"#000","border-bottom":"3px solid #000"});
		$(this).siblings().find("span").css({"color":"#808080","border-bottom":"0px solid #000"});
		let data = {
				userNum:$("input[name=userNum]").attr("value"),
				friendNum:$("input[name=userNum]").attr("value"),
				search:"",
				check:1
				};
		friendList(data);
	});
		
	// ??????????????????
	$(document).on("click",".friend-before",function(){
		$(this).find("span").css({"color":"#000","border-bottom":"3px solid #000"});
		$(this).siblings().find("span").css({"color":"#808080","border-bottom":"0px solid #000"});
		let data = {friendNum:$("input[name=userNum]").attr("value"),search:"",check:0};
		friendRequest(data);
	});
		
	// ?????? ??????
	$("#friend-search").on('keyup keypress',function(){
		let data = {userNum:$("input[name=userNum]").attr("value"),search:$(this).val().trim()};
		list(data);
	});
	
	// ?????? ????????? ???????????? ??????
	$(".fa-user-plus").click(function(){
		$("body").attr("class","modal-fix");
	});
	
	// ?????? x?????? ????????? ??????
	closeBtn.addEventListener("click", e => {
		modal.style.display = "none"
	    $("body").attr("class","");
	    $("input[name=friend-search]").val();
	})
		
	// ?????? ?????? ????????? ??????
	modal.addEventListener("click", e => {
		const evTarget = e.target
		if(evTarget.classList.contains("gift-modal-overlay")) {
			modal.style.display = "none"
	        $("body").attr("class","");
			$("input[name=friend-search]").val();
		}
	})
		
	// ?????? ???????????? ????????? ??????
	$(document).on("click",".btn-cancel",function(){
		modal.style.display = "none"
		$("body").attr("class","");
		$("input#friend-search").val("");
	});
		
	// ?????? ??????
	$("#friend-search").on('keyup keypress',function(){
		let data = {
			userNum:$("input[name=userNum]").attr("value"),
			search:$(this).val().trim()
		};
		list(data);
	});
		
	// ??????????????? ?????????
	$("#friend-search-button").click(function(){
			
		if(${empty sessionScope.loginUserNum}) {
			if(!confirm("???????????? ????????? ???????????????.\n????????????????????????????")) {
				
			} else {
				location.href="${root}/loginForm";
			}
			return;
		} else {
			//  ????????? ????????? ??? ??????????????? & ???????????? ????????????
			var data = {userNum:$("input[name=userNum]").attr("value"),search:""};
			list(data);
		    modal.style.display = "flex";
		}
	});
		
	// ?????? ????????? ?????? ????????? ?????? ?????? ?????? ??????
	$(document).on("click",".chkBox",function(){
		var ba = new Array();
		var fs = "";
			
		fl = $(".chkBox:checked").length;
		
		$(".chkBox:checked").each(function() {
			var map = new Map();
		    map.set("b",$(this).siblings().find("b").text()); 
		    map.set("img",$(this).siblings().find("img").attr("src")); 
		    map.set("num",$(this).siblings().find("b").attr("num")); 		    	 		    	 	    	 		    	 
		    ba.push(map);
		});			
			
		if(fl != 0){
			fs += "<ul class='wish' style='padding-left:0;'>";
				
			$.each(ba, function(i,elt) {
				fs += "<li style='list-style:none; float:left;' class='wish' num='"+elt.get("num")+"' name='"+elt.get("b")+"'>";
				fs += "<img src='"+elt.get("img")+"' width='50' style='margin-top:10px;' class='gift-friend-img wish'>";
				fs += "<div style='text-align:center;'>"+elt.get("b")+"</div>";
				fs += "</li>";
			});
			fs += "</ul>";				
			$("div.friend-select-list").html(fs);
	        	
		} else {
			$(".friend-length").text("");
				
			fs += "<img src='${root }/image/default.png' class='gift-friend-img'>";
	        fs += "????????? ????????? ???????????????.";
	        $("div.friend-select-list").html(fs);
		}
	});
	
	// ?????? ??????
	$(".getWishlist").click(function(){
		
		let list = [];
		let friendNum = $('input:radio[name=radio]:checked').attr("friendNum");
		
		$('input:checkbox[name=friend]:checked').each(function() {
			
			let data = {
				userNum : $("input[name=userNum]").val(),
				friendNum : $(this).attr("num"),
				check : 0
			}
			console.log(data);
			list.push(data);
		});
		
		$.ajax({
			type: "post",
			url: "../user/insertFriend",
			data: JSON.stringify({"list":list}),
			contentType: "application/json; charset=utf-8",
			success:function(res){
					
				modal.style.display = "none"
			    $("body").attr("class","");
				let data = {
						userNum:$("input[name=userNum]").attr("value"),
						friendNum:$("input[name=userNum]").attr("value"),
						search:"",
						check:1
						};
				friendList(data);
			}
		});
		alert("???????????? ???????????????")
	});
	
	// ?????? ??????
	$(document).on("click",".delete-friend-btn",function(){
		
	 	let data = {
			userNum : $('input[name=userNum]').val(),
			friendNum : $(this).attr("friendNum"),
		}
		
	 	if(confirm("???????????? ????????? ?????????????????????????")) {
	 		
			$.ajax({
				type: "post",
				url: "../user/deleteFriend",
				data: JSON.stringify({"data":data}),
				contentType: "application/json; charset=utf-8",
				success:function(res){
						
					let data = {
							userNum:$("input[name=userNum]").attr("value"),
							friendNum:$("input[name=userNum]").attr("value"),
							search:"",
							check:1
							};
					friendList(data);
				}
			});
	 	}
	});
	
	// ?????? ?????? ??????
	$(document).on("click",".update-friend-btn",function(){
		
	 	let data = {
			friendNum : $('input[name=userNum]').val(),
			userNum : $(this).attr("friendNum"),
		}
		
	 	if(confirm("??????????????? ?????????????????????????")) {
	 		
			$.ajax({
				type: "post",
				url: "../user/updateFriend",
				data: JSON.stringify({"data":data}),
				contentType: "application/json; charset=utf-8",
				success:function(res){
						
					$(".friend-after").trigger("click");
				}
			});
	 	}
	});
	
	// ????????????
	function friendList(data) {
		let s="";
		
		$.ajax({
			type: "post",
			url: "../user/friendData",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify({"data":data}),
			success:function(res){
				
				$.each(res, function(i,elt) {
					
					s += "<div class='friend-object'>";
					s += "<div class='friend-object-left'>";
					s += "<img src='"+elt.profileImage+"' onerror='this.src=\"${root}/image/user_default.png\";'>";
					s += "</div>";
					s += "<div class='friend-object-right'>";
					s += "<div class='friend-info'>";
					s += "<span class='friend-name'>"+elt.nickname+"</span>";
					s += "<span class='friend-stauts'>"+((elt.status!=null)?elt.status:"")+"</span>";
					s += "</div>";
					s += "<div class='friend-icon'>";
					s += "<i onclick=\"location.href='../wishlist/userPage?userNum="+elt.num+"'\" class='fas fa-heart' style='font-size:24px; cursor:pointer;'></i>";
					s += "<a href='#'><i class='fab fa-instagram' style='font-size:24px'></i></a>";
					s += "<a href='mailto:"+elt.email+"'><i class='fas fa-envelope' style='font-size:24px'></i></a>";
					s += "<i class='fas fa-user-minus delete-friend-btn' friendNum='"+elt.num+"' style='font-size:24px; cursor:pointer;'></i>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					
				});
				$("div.friend-result").html(s);
			}
		});
		
		// ???????????????
		$.ajax({
			type: "post",
			url: "../user/friendCount",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify({"data":data}),
			success:function(res){
				
				$("span.friend-after-count").text("?????? "+res);
			}
		});
		
	}
	
	// ?????? ????????????
	function friendRequest(data) {
		let s="";
		
		$.ajax({
			type: "post",
			url: "../user/friendRequest",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify({"data":data}),
			success:function(res){
				
				$.each(res, function(i,elt) {
					
					s += "<div class='friend-object'>";
					s += "<div class='friend-object-left'>";
					s += "<img src='"+elt.profileImage+"' onerror='this.src=\"${root}/image/user_default.png\";'>";
					s += "</div>";
					s += "<div class='friend-object-right'>";
					s += "<div class='friend-info'>";
					s += "<span class='friend-name'>"+elt.nickname+"</span>";
					s += "<span class='friend-stauts'>"+((elt.status!=null)?elt.status:"")+"</span>";
					s += "</div>";
					s += "<div class='friend-icon' style='display:flex; justify-content:flex-end;'>";
					s += "<i class='fas fas fa-user-check update-friend-btn' friendNum='"+elt.num+"' style='font-size:24px; cursor:pointer;'></i>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					
				});
				$("div.friend-result").html(s);
			}
		});

		// ???????????? ?????????
		$.ajax({
			type: "post",
			url: "../user/friendCount",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify({"data":data}),
			success:function(res){
				
				$("span.friend-after-count").text("???????????? "+res);
			}
		});
	}
	
	// ???????????? ???????????? ??????
	function list(data) {
		
		let s="";
			
		$.ajax({
			type: "post",
			url: "../user/nonFriend",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify({"data":data}),
			success:function(res){
				
				s += "<ul style='padding-left:0;'>";
				
				$.each(res, function(i,elt) {
					
					s += "<li style='list-style:none; float:left; margin-bottom:10px;'>";
					s += "<div style='min-width:170px;'>";
					s += "<input type='checkbox' style='margin-right:10px;' class='chkBox' name='friend' num='"+elt.num+"'>";
					s += "<label>";
					s += "<img src='"+elt.profileImage+"' width='100' class='gift-friend-img' style='margin-right:5px;' onerror='this.src=\"${root}/image/user_default.png\";'>";
					s += "<b num='"+elt.num+"'>"+elt.nickname+"</b>";
					s += "</label>";
					s += "</div>";
					s += "</li>";
				});
				s += "</ul>";
				$("div.friend-modal-result").html(s);
			}
		});
	}
</script>
</html>