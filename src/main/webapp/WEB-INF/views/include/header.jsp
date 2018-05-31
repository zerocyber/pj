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
<link href="/resources/sticky-footer.css" rel="stylesheet">

<!-- JAVA SCRIPT -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap-3.3.2/docs/assets/js/ie-emulation-modes-warning.js"></script>
</head>

<body>
	<!-- Body 시작 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/index">Leaf viliage</a>	
		</div>
		
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="/index">Home</a></li>
				<li><a href="/board/list">Board</a></li>
				<li><a href="#">Gallery</a></li>
				<li><a href="#">Team</a></li>
				<li><a href="#">Contact us</a></li>
			</ul>
			<%-- ${LOGIN.mname} --%>
			
			<c:choose>
			 <c:when test="${LOGIN.mname eq null}">
				 <ul class="nav navbar-nav navbar-right">
					<li><a href="../login">Sign In</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../signup">Sign Up</a></li>
	
				</ul>
			 </c:when>
			 <c:otherwise>
			 	 <ul class="nav navbar-nav navbar-right">
					<li><a href="#">${LOGIN.mname}님 로그아웃</a></li>
				</ul>		 
			 </c:otherwise>
			
			</c:choose>
			

			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
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