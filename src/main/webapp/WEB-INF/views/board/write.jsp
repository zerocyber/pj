<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.fileDrop {
	width: 100%;
	height: 100px;
	border: gray;
	background-color: #FAF6F6;
}
.form-control-s {
	display: block;
	width: 150px;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>

<div class="container-fluid col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<div class="row">
		<div class="col-md-10 col-sm-10">
			<form  id="post-form" name="post-form" method="post">
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3">
							<select class="form-control" name="kno">
								<option value="30">일반</option>
								<option value="20">후기</option>
								<option value="10">질문</option>
							</select>
						</div>
						<div class="col-sm-3">
							<select class="form-control col-sm-3" name="cno">
								<option value="100">Java</option>
								<option value="200">C</option>
								<option value="300">C#</option>
							</select>
						</div>
					</div>
				</div>


				<div class="form-group">
					<label for="title">Title</label> <input id="title" name="title"
						type="text" class="form-control" placeholder="Text input" required="required">
				</div>
				<label for="content">Content</label>
				<p>
					<textarea id="content" name="content" class="form-control"
						rows="15" required="required"></textarea>
				</p>
				<label>Writer</label>
				<p>
					<input id="mid" name="mid" type="text" class="form-control-s"
						placeholder="Text input" required="required">
				</p>
				<div>
					<div class="form-group">
						<label for="exampleInputFile">파일 업로드</label> <input type="file"
							id="exampleInputFile">
					</div>

					<div class="fileDrop"></div>

					<div id="uploadList"></div>
				</div>

					<div class="row">
						<div class="col-md-9 col-sm-9 col-md-offset-1 col-sm-offset-1">
							<div class="row">
							<div class="col-md-offset-5 col-sm-offset-5">
							<button class="btn btn-info btnc">등록</button>

							<button id="back" type="button" class="btn btn-danger ">취소</button>
							</div>
							</div>
						</div>
					</div>

			</form>
		</div>
	</div>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>
$(document).ready(function() {

	$("#back").on("click", function(e) {
		self.location = "/board/list";
	});
// 파일 업로드
	$(".fileDrop").on("dragenter dragover",function(event) {
		event.preventDefault();
	});
	$(".fileDrop").on("drop",function(event) {
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];

		console.log(file);

		var formData = new FormData();
		formData.append("file", file);
		console.log(files);

		$.ajax({
			url : '/upload',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
			var str = "";

			if (checkImageType(data)) {
				str = "<div>"+ "<img src ='/displayFile?fileName="+data+"'/>"+data+"</div>" + "<input type='hidden' name='files' value='"+data+"'/>"
				} else {
				str = "<div>"+ data +"<input type='hidden' name='files' value='"+data+"'/>"+"</div>";
				}
				$("#uploadList").append(str);
			}
		});
	});

	function checkImageType(fileName) {
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		return fileName.match(pattern);
	}

});
</script>


<%@ include file="footer.jsp"%>