<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css1.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">

<!-- css -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="../resources/css/jcarousel.css" rel="stylesheet" />
<link href="../resources/css/flexslider.css" rel="stylesheet" />
<link href="../resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/boot.css">

<!-- Theme skin -->
<link href="../resources/skins/default.css" rel="stylesheet" />
<style>
    body, html {
        height: 100%;
        font-family: "Inconsolata", sans-serif;
    }
    .bgimg {
        background-position: center;
        background-size: cover;
        background-image: url("https://pre00.deviantart.net/c03b/th/pre/f/2014/338/a/0/hidden_leaf_village__landscape__the_best__by_iennidesign-d88ors4.png");
        min-height: 60%;
    }
    .menu {
        display: none;
    }
    .w2-block {
    display:block;
    width:100%;
    }    
</style>
<body>
<!-- Links (sit on top) -->
<div class="w3-top">
    <div class="w3-row w3-padding w3-black">
        <div class="w3-col s2">
            <a href="/index/home" class="w3-button w3-block w3-black">HOME</a>
        </div>
        <div class="w3-col s2">
            <a href="/board/list" class="w3-button w3-block w3-black">BOARD</a>
        </div>
        <div class="w3-col s2">
            <a href="/gallery/list" class="w3-button w3-block w3-black">GALLERY</a>
        </div>
        <div class="w3-col s2">
            <a href="/index/qna" class="w3-button w3-block w3-black">Q&A</a>
        </div>
        <div class="w3-col s2">
            <a href="/index/contact" class="w3-button w3-block w3-black">CONTACT US</a>
        </div>
        <div class="w3-col s2">
        <div class="w3-button w2-block w3-black">
        <a href="/member/login">SIGN IN</a> or <a href="/member/register">SIGN UP</a>
        </div>    
        </div>
    </div>
</div>

<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
    <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
        <span class="w3-tag"><%= new java.util.Date() %></span>
    </div>
    <div class="w3-display-middle w3-center">
        <span class="w3-text-white" style="font-size:90px">
        Leaf Village</span>
    </div>
</header>

<!-- Add a background color and large text to the whole page -->
<div id="wrapper">
	<section id="inner-headline">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="//www.google.com" target="_blank"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
						<li class="active">Google</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
</div>