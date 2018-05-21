<%@ include file="header.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- css -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/fancybox/jquery.fancybox.css"
	rel="stylesheet">
<link href="../resources/css/jcarousel.css" rel="stylesheet" />
<link href="../resources/css/flexslider.css" rel="stylesheet" />
<link href="../resources/css/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../resources/boot.css">

<!-- Theme skin -->
<link href="../resources/skins/default.css" rel="stylesheet" />


<style>
/*====================*/
/* reset.css */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}
/*====================*/
section {
	max-width: 960px;
	margin: 30px auto;
	padding: 30px;
}

table {
	width: 100%;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
}

th {
	background: #f4f4f4;
}

.demo01 th {
	width: 10%;
	text-align: left;
}

@media only screen and (max-width:768px) {
	.demo01 {
		margin: 0 -10px;
	}
	.demo01 th, .demo01 td {
		width: 100%;
		display: block;
		border-top: none;
	}
	.demo01 tr:first-child th {
		border-top: 1px solid #ddd;
	}
}
</style>

<style>
.fileDrop {
	width: 600px;
	height: 600px;
	border: gray;
	background-color: #FAF6F6;
}
</style>

<section>
	<table class="demo01">
		<tr>
			<th>제목</th>
			<td>${BoardVO.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${BoardVO.content}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${BoardVO.mid}</td>
		</tr>
	</table>
	<br>

	<button id="back">뒤로가기</button>
	<button id="modify">수정</button>
	<button id="remove">삭제</button>

</section>


<div class="replyBox">
	<ul class="replyUL">

	</ul>
	<div class="empty"></div>
</div>



<form id="inform" method="post">
	<input type="hidden" name="page" value="${cri.page}"> <input
		type="hidden" name="bno" value="${BoardVO.bno}"> <input
		type="hidden" name="type" value="${cri.type}"> <input
		type="hidden" name="keyword" value="${cri.keyword}">
</form>

<div class="wrapper">
	<textarea class="replyContent" name="content" cols="92" rows="10"></textarea>
	<input class="replyWriter" type="text" name="replyWriter" value="none">
	<button id="replyBtn">Apply</button>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	
	var formObj = $("#inform");
	$("#back").on("click", function(e) {
		self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}";

	});
	
	$("#modify").on("click", function(e) {
		self.location = "/board/modify?page=${cri.page}&perPageNum=${cri.perPageNum}&bno=${BoardVO.bno}";
	});
	
	$("#remove").on("click", function(e) {
		formObj.attr("action", "/board/delete");
		formObj.submit();
	});
	
	/* 댓글 페이지 로딩 */
	
	function pageList(page) {
		if(typeof page == "undefined"){
			var page = 1;
		}
		console.log("page loading.....................	");

		$.getJSON("/replies/${param.bno}/"+page, function(data){

			var str = "";

			$(data.list).each(function(){

			str += "<li data-rno='"+this.rno+"' data-content='"+this.content+"' data-mid = '"+this.mid+"' data-event = regist>"+this.rno+" : "+this.content + this.mid
				       +"<button id='reModiBtn'>Modify</button><button id='redeleteBtn'>Delete</button></li>";

			});
			$(".replyUL").html(str);
	
			replyPaging(data.pm);
		});
	};
	pageList();
	/* 댓글 페이지 로딩 */
	
	/* 댓글 추가 */

	$("#replyBtn").on("click", function(e){
		
		if( $("#replyBtn").attr('event') !== 'modify') {
			
		var content = $(".replyContent").val();
		var writer = $(".replyWriter").val();
		var bno = '${param.bno}'
		var UL = $(".replyUL");

 		$.ajax({
			type: "post",
			url : "/replies/new",
			dataType : "text",
			headers : {
				"content-type" : "application/json",
				"x-http-method-override" : "post"
			},
			data : JSON.stringify({
				content : content,
				mid : writer,
				bno : bno
			}),
			success : function(result) {
				alert(result);
				$(".replyContent").val("");
				pageList();
				
			}	
		});
		}else{
			var content = $(".replyContent")[0].value;

			var rno = $("#replyBtn").attr('rno');

			var mid = $("#replyBtn").attr('mid');

			$.ajax({
				type: "PUT",
				url : "/replies/${param.bno}/1",
				dataType : "text",
				headers : {
					"content-type" : "application/json",
					"x-http-method-override" : "PUT"
				},
				data : JSON.stringify({
					content : content,
					rno : rno,
					mid : mid
				}),
				success : function(result) {
						alert(result);	
						$("#replyBtn")[0].innerText = "Apply";
						$("#replyBtn").attr('event', 'regist');
						$(".replyContent").val("");
						pageList();
				}	
			});
		}
		
	});
	/* 댓글 추가 */
	

	/* 댓글 수정 */
	$(".replyBox").on("click","ul li #reModiBtn",function(e){
		
		
		var applyBtn = $("#replyBtn");
		applyBtn[0].innerText = "Modify";
		
		var replyText = $(e.target.parentElement);
		var rno = replyText.data('rno');
		var mid = replyText.data('mid');
		var content = replyText.data('content');
		
		$(".replyContent")[0].value = content;
		$(".replyWriter")[0].value = mid;
		
		applyBtn.attr("rno", rno);
		applyBtn.attr("content", content);
		applyBtn.attr("mid", mid);
		applyBtn.attr("event", "modify");
	});

	/* 댓글 수정  */
	
	/* 댓글 삭제 시작*/
	$(".replyBox").on("click","ul li #redeleteBtn",function(e){
	
		if(confirm("삭제하시겠습니까?")){

		var random = $(this).parent();
		var bno = "${param.bno}";
		var rno = random.data('rno');

		$.ajax({
			
		type : 'delete',
		url : "/replies/"+bno+"/"+rno,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},	
		dataType : 'text',
		success : function(result){
			console.log("result: " + result)
			if(result == 'SUCCESS'){
				alert("댓글이 삭제되었습니다");
				pageList();
			}
		  }
		});
		};
	}); // delete ajax
	/* 댓글 삭제 */
	
	/* 댓글 하단 페이징 */
	function replyPaging(pm){
		
		var ddd = "";
		
		if(pm.prev){
			
			ddd += "<li><a href = '"+(pm.startPage -1)+"'> >> </a></li>";
		}
		
		for(var i = pm.startPage, len = pm.endPage; i< len+1; i++){
			
			var strClass = pm.cri.page == i?'class=active':'';
			ddd += "<li class='btn btn-secondary'"+ strClass +"><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pm.next){
			
			ddd += "<li><a href = '"+(pm.endpage +1)+"'> >> </a></li>";
		}
		$('.empty').html(ddd);
		};
		
		$(".empty").on("click","li a",function(e){
			e.preventDefault();
			var page = $(e.target).text(); // page number
			pageList(page);
		});

	
});


</script>





<%@ include file="footer.jsp"%>