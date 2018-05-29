<<<<<<< HEAD
<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
=======
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
>>>>>>> 913a1ccbe37d9a49307e8f2f9aba6680a6636ea7
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
th {
	text-align: center;
}
</style>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<div class="row">
		<div class="col-sm-9 col-sm-offset-1">
			<h1>Dash Board</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-9 col-sm-offset-1">

			<table width="100%"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="info">
						<th width="10%">글번호</th>
						<th width="50%">제목</th>
						<th width="10%">작성자</th>
						<th width="20%">작성일</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${BoardVO}" var="board">
						<tr style="text-align: center">
							<td><c:out value="${board.bno}" /></td>
							<c:choose>
								<c:when test="${pm.cri.type eq '' && pm.cri.keyword eq '' }">
									<td style="text-align: left"><a
										href="/board/read?page=${pm.cri.page}&perPageNum=${pm.cri.perPageNum}&bno=${board.bno}"><c:out
												value="${board.title}" /></a></td>
								</c:when>
								<c:otherwise>
									<td style="text-align: left"><a
										href="/board/read?page=${pm.cri.page}&perPageNum=${pm.cri.perPageNum}&bno=${board.bno}&type=${pm.cri.type}&keyword=${pm.cri.keyword}"><c:out
												value="${board.title}" /></a></td>
								</c:otherwise>
							</c:choose>
							<td><c:out value="${board.mid}" /></td>
							<td><fmt:formatDate value='${board.regdate}'
									pattern="yyyy.MM.dd hh:mm:ss" /></td>
							<td class="center"><c:out value="${board.views}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<form method="get">
		<div class="form-group row">
			<div class="col-sm-9 col-sm-offset-1">
				<div class="row">

					<div class="col-sm-3">
						<select name="type" id="selectType" class="form-control">
							<option value="">----</option>
							<option value="t" ${pm.cri.type eq 't'? "selected": '' }>TITLE</option>
							<option value="c" ${pm.cri.type eq 'c'? "selected": '' }>CONTENT</option>
							<option value="m" ${pm.cri.type eq 'm'? "selected": '' }>WRITER</option>
							<option value="tc" ${pm.cri.type eq 'tc'? "selected": '' }>TITLE+CONTENT</option>
							<option value="tm" ${pm.cri.type eq 'tm'? "selected": '' }>TITLE+WRITER</option>
							<option value="tcm" ${pm.cri.type eq 'tcm'? "selected": '' }>TITLE+CONTENT+WRITER</option>
						</select>
					</div>

					<div class="col-sm-7">
						<input class="form-control" type="text" id="keyword"
							name="keyword" value="${pm.cri.keyword}" />
					</div>

					<div class="col-sm-1">
						<button id="btn_search" class="btn btn-xs btn-primary">SEARCH</button>
					</div>

					<div class="col-sm-1">
						<button id="btn_write" class="btn btn-xs btn-info">등록</button>
					</div>

				</div>
			</div>
		</div>
	</form>


	<div class="row">
		<div class="col-sm-9 col-sm-offset-1">
			<div class="col-sm-12 text-center">
				<div id="pagination">
					<ul class="pagination">

						<li><span style="background-color: black;">Page
								${pm.cri.page} of ${pm.total}</span></li>
						<c:if test="${pm.prev}">
							<c:choose>
								<c:when test="${pm.cri.type eq '' && pm.cri.keyword eq '' }">
									<li><a class="btn btn-info"
										href="list?page=${pm.startPage -1}">prev</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="btn btn-info"
										href="list?page=${pm.startPage -1}&type=${pm.cri.type}&keyword=${pm.cri.keyword}">prev</a></li>
								</c:otherwise>
							</c:choose>
						</c:if>

						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
							<c:choose>
								<c:when test="${pm.cri.type eq '' && pm.cri.keyword eq '' }">
									<li ${pm.cri.page == idx ? 'class=active':''}><a
										id="pageLink" class="btn btn-secondary"
										href="/board/list?page=${idx}">${idx}</a></li>
								</c:when>
								<c:otherwise>
									<li ${pm.cri.page == idx ? 'class=active':''}><a
										id="pageLink" class="btn btn-secondary"
										href="/board/list?page=${idx}&type=${pm.cri.type}&keyword=${pm.cri.keyword}">${idx}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${pm.next}">
							<c:choose>
								<c:when test="${pm.cri.type eq '' && pm.cri.keyword eq '' }">
									<li><a class="btn btn-info"
										href="list?page=${pm.endPage + 1}">next</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="btn btn-info"
										href="list?page=${pm.endPage + 1}&type=${pm.cri.type}&keyword=${pm.cri.keyword}">next</a></li>
								</c:otherwise>
							</c:choose>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>

$(document).ready(function() {
	if(msg=="success" && !history.state){
		alert("등록이 완료되었습니다.");
		
	}
	history.replaceState({}, null, null);
	
});

	var btn = $("#btn_search")
	var selectType = $("#selectType")
	var writeBtn = $("#btn_write") 
	var keyword = $("#keyword")
	var pageLink = $("#pageLink")
	var msg = '${msg}';

	btn.on("click", function(e) {
		console.log("click........................")
		if (selectType.val() == "") {
			alert("검색조건을 선택해주세요");
			e.preventDefault();
		}
		if (keyword.val() == "") {
			alert("검색어를 입력해주세요")
			e.preventDefault();
		}
	});

    writeBtn.on("click", function(e) {
    	e.preventDefault();
		location.href = "/board/write"
	});
 

 
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
