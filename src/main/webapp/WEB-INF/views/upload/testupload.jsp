<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

.fileDrop {
    width: 600px;
    height: 500px;
    border: 1px solid gray;
    background-color: #FAF6F6;
}
</style>
</head>
<body>



첨부파일 등록

<div class="fileDrop"></div>

<div id="uploadList"></div>






<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		
<script>
$(document).ready(function(){
	

	$(".fileDrop").on("dragenter dragover",function(e){
		e.preventDefault();
	});

	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		
		var files = e.originalEvent.dataTransfer.files;
		console.log(files);
		var file = files[0];
		console.log(file);
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		console.log(formData);
		
		$.ajax({
			url: "/upload/testupload",
			data : formData,
			dataType : "text",
			processData : false,
			contentType : false,
			type : "post",
			success : function(data) {
				alert(data);
			}
			
		});
		
	});

});
</script>
</body>
</html>