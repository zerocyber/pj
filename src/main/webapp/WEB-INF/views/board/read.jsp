<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		
	<form id="inform" method="post">
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="bno" value="${BoardVO.bno}">
		<input type="hidden" name="type" value="${cri.type}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>


${BoardVO}

<a href="/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}">뒤로가기</a>
<a href="/board/modify?page=${cri.page}&perPageNum=${cri.perPageNum}&bno=${BoardVO.bno}">수정</a>
<button id="remove">삭제</button>

<script>
$(document).ready(function() {
	var formObj = $("#inform");
	
	$("#remove").on("click", function(e) {
		formObj.attr("action", "/board/delete");
		formObj.submit();
	});
});

</script>


<%@ include file="footer.jsp"%>