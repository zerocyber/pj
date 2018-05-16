<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


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

<a href="list?page=${cri.page}&perPageNum=${cri.perPageNum}">뒤로가기</a>
<a href="modify?page=${cri.page}&perPageNum=${cri.perPageNum}&bno=${BoardVO.bno}">수정</a>
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


</body>
</html>