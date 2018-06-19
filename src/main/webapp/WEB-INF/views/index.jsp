<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/carousel.css" rel="stylesheet">

<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap-3.3.2/dist/js/bootstrap.min.js"></script>

<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="/resources/bootstrap-3.3.2/docs/assets/js/vendor/holder.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/resources/bootstrap-3.3.2/docs/assets/js/ie10-viewport-bug-workaround.js"></script>


<!-- Carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner" role="listbox" style="margin-bottom: 10px;">
		<div class="item active" >
			<img class="first-slide"
				src="https://www.suyongso.com/files/attach/images/115/733/477/014/9060e163a43cd0a58f88813dbf53d12a.png"

				alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>What's your name?</h1>
					<p>
						<code>URL, the "next" and "previous" Glyphicon buttons on the left and
						right might not load/display properly due to web browser security
						rules.</code>

					</p>
					<p>
						<a class="btn btn-lg btn-primary" href="/board/list" role="button">게시판으로</a>
					</p>
				</div>
			</div>
		</div>
		<div class="item">
			<img class="second-slide"
				src="https://2.bp.blogspot.com/-eSC4Gupz5ns/WNCnusetmrI/AAAAAAAAAQg/oG3xz6lXO7UZuzJYgqTE4_cX3-Bxl0biwCLcB/s1600/%25EB%2584%2588%25EC%259D%2598%2B%25EC%259D%25B4%25EB%25A6%2584%25EC%259D%2580%2B%25EB%25B0%25B0%25EA%25B2%25BD%25ED%2599%2594%25EB%25A9%25B4%2B%25EA%25B3%25A0%25ED%2599%2594%25EC%25A7%2588-2.jpg"
				alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Another example headline.</h1>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Donec id elit non mi porta gravida at eget metus. Nullam id dolor
						id nibh ultricies vehicula ut id elit.</p>
					<p>
						<a class="btn btn-lg btn-primary" href="#" role="button">Learn
							more</a>
					</p>
				</div>
			</div>
		</div>
		<div class="item">
			<img class="third-slide"
				src="http://mblogthumb3.phinf.naver.net/MjAxNzExMjZfNjEg/MDAxNTExNzA4Mjk1NTYy.4SXS_LsnEU28hSmgwnyu0KAhwTNGPqWfa7f4kwVuEEog.47VS0GKZACI3hkDdzEhRmm8GgKBq7BvRBeqDanMgjfYg.JPEG.bongdoly123/743487.jpg?type=w2"
				alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>One more for good measure.</h1>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Donec id elit non mi porta gravida at eget metus. Nullam id dolor
						id nibh ultricies vehicula ut id elit.</p>
					<p>
						<a class="btn btn-lg btn-primary" href="#" role="button">Browse
							gallery</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>	
	<!-- youtube media add -->
	<p>인기예고편<p>
	<video width="400" height="300" controls>
	<source src="https://cdn.videofarm.daum.net/vod/vb51edcxsexhVkVOBnkXNTX/mp4_1280_720_2M/movie.mp4?px-time=1529058708&px-hash=5aff1be8b48c18225679b9ff5ed88312&px-bps=2861447&px-bufahead=10" type="video/mp4">
	</video>
	<video width="400" height="300" controls>
	<source src="https://cdn.videofarm.daum.net/vod/vd5b6fISB6eTRIexsIIfSnN/mp4_1280_720_2M/movie.mp4?px-time=1529059376&px-hash=cae68c6944d04ac4cf7105ad9b360f10&px-bps=2879703&px-bufahead=10">
	</video>
	<video width="400" height="300" controls>
	<source src="https://cdn.videofarm.daum.net/vod/v2d6e1IK31QIbQr5Mwrrw5a/mp4_1280_720_2M/movie.mp4?px-time=1529059621&px-hash=cfc10ffd2a615edfd5f7c44025523498&px-bps=2809572&px-bufahead=10">
	</video>
	<p>박스오피스 주간순위<p>
	<c:forEach var="item" items="${weekly}" >
	<img src = ${item.image}>
	</c:forEach>
	<p>
	${weekly}
	${monthly}
	${yearly}
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <div class="container marketing main">

 </div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>