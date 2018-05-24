<%@ include file="header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.fileDrop {
	width: 600px;
	height: 70px;
	border: gray;
	background-color: #FAF6F6;
}

.form-control-s {
	display: block;
	width: 20%;
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

<div
	class="Site-content col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="container-fluid">

		<div class="row">
			<div class="col-md-9">
				<form>
					<div style="border: 1px solid gold; float: left; width: 33%;">
						<select class="form-control-s">
							<option>분류</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
					<div style="border: 1px solid gold; float: left; width: 33%;">
						<select class="form-control-s">
							<option>과정</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>

					<br>
					<p>Title</p>
					<p>
						<input type="text" class="form-control" placeholder="Text input">
					</p>
					<p>Content</p>
					<p>
						<textarea class="form-control" rows="15"></textarea>
					</p>
					<p>Writer</p>
					<p>
						<input type="text" class="form-control-s" placeholder="Text input">
					</p>
					<div>
						<p>Attach File</p>

						<div class="form-group">
							<label for="exampleInputFile">파일 업로드</label> <input type="file"
								id="exampleInputFile">
						</div>

						<div class="fileDrop"></div>

						<div id="uploadList"></div>

					</div>


					<p>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info">등록</button>
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-danger">뒤로가기</button>
						</div>
						<div class="col-md-3"></div>
					</div>
					</p>
				</form>
			</div>
		</div>
	</div>
</div>


<%@ include file="footer2.jsp"%>