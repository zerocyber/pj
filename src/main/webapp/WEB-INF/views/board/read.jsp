<%@ include file="header.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/*====================*/
/* reset.css */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
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
section {max-width:960px; margin:30px auto; padding:30px;}
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
.demo01 th,  .demo01 td {
    width: 100%;
    display: block;
    border-top: none;
}
.demo01 tr:first-child th {
    border-top: 1px solid #ddd;
}
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
</div>



	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<form id="inform" method="post">
		<input type="hidden" name="page" value="${cri.page}"> <input
			type="hidden" name="bno" value="${BoardVO.bno}"> <input
			type="hidden" name="type" value="${cri.type}"> <input
			type="hidden" name="keyword" value="${cri.keyword}">
	</form>



	
	<div class="wrapper">
	<textarea class="replyContent" name="content" cols="92" rows="3">
	</textarea>
	<button id="replyBtn">Apply</button>
	</div>

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
	function pageList() {
		$.getJSON("/replies/"+${param.bno}+"/"+${cri.page}, function(data){
			console.log(data.length);
			var str = "";		
			$(data).each(function() {
				str += "<li>"+ this.rno+ ":" + this.content + "<button>Modify</button>X</li>";
			});
			$(".replyUL").html(str);
		});
	}
	pageList();
	/* 댓글 페이지 로딩 */
	
	
});

	
	
	

	</script>


<%@ include file="footer.jsp"%>