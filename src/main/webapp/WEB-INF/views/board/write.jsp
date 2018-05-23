<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	

<style>
.fileDrop {
	width: 600px;
	height: 70px;
	border: gray;
	background-color: #FAF6F6;
}
</style>

	<div id="content" class="snippet-hidden">
		<div id="mainbar" class="ask-mainbar">
		<form id="post-form" class="post-form" name="post-form" method="post" enctype="multipart/form-data">
		<select name="kno">
			<option value="">게시판 분류</option>
			<option value="10">후기</option>
			<option value="20">일반</option>
			<option value="30">질문</option>
		</select> 
		<select name="cno">
			<option value="">과정선택</option>
			<option value="100">JAVA</option>
			<option value="200">C</option>
			<option value="300">C#</option>
		</select>
	
					<div id="question-form">
						<div style="position: relative;">
							<div class="form-item ask-title">
	
								<table class="ask-title-table">
									<tr>
										<td class="ask-title-cell-key"><label for="title">제목</label>
										</td>
										<td class="ask-title-cell-value"><input id="title"
											name="title" type="text" maxlength="300" tabindex="100"
											placeholder="제목을 입력하세요" class="js-ask-title"
											data-min-length="15" data-max-length="150"></td>
									</tr>
								</table>
								<div>
									첨부파일 등록
									<div class="fileDrop"></div>
	
									<div id="uploadList"></div>
								</div>
							</div>
						</div>
					</div>
	
	
					<div id="post-editor" class="post-editor js-post-editor">
	
						<div style="position: relative;">
							<div class="wmd-container">
								<label>내용</label> <br>
								<textarea id="wmd-input" class="wmd-input" name="content"
									cols="92" rows="15" tabindex="101" data-min-length=""></textarea>
							</div>
						</div>
	
						<div class="fl" style="margin-top: 8px; height: 24px;">&nbsp;</div>
						<div id="draft-saved" class="draft-saved community-option fl"
							style="margin-top: 8px; height: 24px; display: none;">draft
							saved</div>
	
						<div id="draft-discarded"
							class="draft-discarded community-option fl"
							style="margin-top: 8px; height: 24px; display: none;">draft
							discarded</div>
	
					</div>
	
					<div id="question-form">
						<div style="position: relative;">
							<div class="form-item ask-title">
	
								<table class="ask-title-table">
									<tr>
										<td class="ask-title-cell-key"><label for="title">작성자</label>
										</td>
										<td class="ask-title-cell-value"><input id="user"
											name="mid" type="text" maxlength="300" tabindex="100"
											class="js-ask-title" data-min-length="15"
											data-max-length="150"></td>
									</tr>
								</table>
	
							</div>
						</div>
					</div>
					<br> <br>
	
					<div id="question-only-section">
						<div class="form-submit cbt">
							<button>등록</button>
						</div>
					</div>
				</form>
		</div>
	</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>
$(document).ready(function() {

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
				str = "<div>"+ "<img src ='/displayFile?fileName="+data+"'/>"+data+"</div>" + "<input type='hidden' name='file' value='"+data+"'/>"
				} else {
				str = "<div>"+ data + "</div>";
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