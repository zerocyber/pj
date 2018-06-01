<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Header 시작 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>Leaf village</title>
<!-- CSS -->
<link href="/resources/bootstrap-3.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/dashboard.css" rel="stylesheet">


<!-- JAVA SCRIPT -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="/resources/bootstrap-3.3.2/docs/assets/js/ie-emulation-modes-warning.js"></script>
</head>
<style>
ul li{
list-style: none;
}
</style>

<body>
<script>

$(document).ready(function(){
	
	var Obj = $("#loginform");
	
	$("ul").on("click",".logout",function(e){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href = "/logout";
		}
	});
	
});

</script>
	<!-- Body 시작 -->

	
	<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: white;">
		<ul class="nav text-right" style="list-style: none; background-color: white;">

		<c:choose>
		  <c:when test="${LOGIN.mname eq null}">
		  	<li style="float: right;"><a href="/login">Sign in</a></li>
			<li style="float: right;"><a href="/signup">Sign up</a></li>	
		  </c:when>
		  <c:otherwise>
		  	<li style="float: right;"><a class="logout">로그아웃</a></li>	
		  	<li style="float: right;"><a href="#">${LOGIN.mname}님</a></li>
		  </c:otherwise>
		</c:choose>				
							
		</ul>
	
	
	<div class="container-fluid" style="background-color: white; border-top: solid 1px #e5e5e5; border-bottom: solid 1px #e5e5e5;">
		
		<div class="navbar-header">
			
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				
			</button>
			<a class="navbar-brand" href="/index">Leaf Movie Viliage</a>
		</div>

		<div class="row col-sm-4 col-sm-offset-3">
			<div id="navbar" class="navbar-collapse text-center">
				<ul class="nav navbar-nav">
					<li><a href="/index">Home</a></li>
					<li><a href="/board/list">Board</a></li>
					<li><a href="#">Gallery</a></li>
					<li><a href="#">About us</a></li>
					<li><a href="#">Q&A</a></li>
				</ul>						
			</div>
		</div>
	</div>
		
		
	</nav>

<!-- 	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="/index">Home</a></li>
					<li><a href="/board/list">Board</a></li>
					<li><a href="#">Gallery</a></li>
					<li><a href="#">Team</a></li>
					<li><a href="#">Contact us</a></li>
				</ul>
			</div>
		</div>
	</div> -->
	<!-- Header 끝 -->