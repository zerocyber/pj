<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8">
<title>Moderna - Bootstrap 3 flat corporate template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<!-- css -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="../resources/css/jcarousel.css" rel="stylesheet" />
<link href="../resources/css/flexslider.css" rel="stylesheet" />
<link href="../resources/css/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../resources/css/boot.css">

<!-- Theme skin -->
<link href="../resources/skins/default.css" rel="stylesheet" />

<style type="text/css">
.ellip {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>





<div id="wrapper">

	<section id="inner-headline">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="#"><i class="fa fa-home"></i></a><i
							class="icon-angle-right"></i></li>
						<li class="active">Blog</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<section id="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<c:forEach items="${BoardVO}" var="board">
						<article>
							<div class="post-image">
								<div class="post-heading">
									<h3>
										<a href="#">${board.title}</a>
									</h3>
								</div>
								<!--<img src="img/dummies/blog/img1.jpg" alt="" />-->
							</div>
							<p class="ellip"></p>
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-folder-open"></i><a href="#">${board.bno }</a></li>

									<li><i class="icon-user"></i><a href="#">${board.mid}</a></li>
									<li><i class="icon-calendar"></i><a href="#">${board.regdate}</a></li>
									<li><i class="icon-comments"></i><a href="#">${board.views}</a></li>
								</ul>

							</div>
						</article>
					</c:forEach>


				</div>

			</div>
		</div>
	</section>
	


<div id="pagination">
<span class="all">Page 1 of 3</span>
<ul class="pagination" >
<c:if test="${pm.prev}">
<li> 
<a class="btn btn-info" href="list?page=${pm.startPage - 1}">prev</a>
</li>
</c:if>

<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx" >
<li><a class="btn btn-secondary" href="/board/list?page=${idx}">${idx}</a></li>
</c:forEach>

<c:if test="${pm.next}">
<li>
<a class="btn btn-info" href="list?page=${pm.endPage + 1}">next</a>
</li>
</c:if>
</ul>
</div>

<form method="get">
<select name="type" id="selectType">
    <option value="">----</option>
    <option value="t">제목</option>
    <option value="c">내용</option>
    <option value="m">작성자</option>
    <option value="tc">제목+내용</option>
    <option value="tm">제목+작성자</option>
    <option value="tcm">제목+내용+작성자</option>
</select>
	<input type="text" class="">
    <button id="btn_search" class="btn btn-default">검색</button>

</form>

<%@ include file="footer.jsp"%>