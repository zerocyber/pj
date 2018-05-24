<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="row">
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="danger">
						<th style="text-align: center" width="10%">글번호</th>
						<th style="text-align: center" width="50%">제목</th>
						<th style="text-align: center" width="15%">작성자</th>
						<th style="text-align: center" width="20%">작성일</th>
						<th style="text-align: center" width="5%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${BoardVO}" var="board">
						<tr style="text-align: center">
							<td><c:out value="${board.bno}"/></td>
							  <c:choose>
							<c:when test="${pm.cri.type eq '' && pm.cri.keyword eq '' }">
							<td style="text-align: left">
							<a href="/board/read?page=${pm.cri.page}&perPageNum=${pm.cri.perPageNum}&bno=${board.bno}"><c:out value="${board.title}"/></a></td>
								</c:when>
								<c:otherwise>
								<td style="text-align: left">
								<a href="/board/read?page=${pm.cri.page}&perPageNum=${pm.cri.perPageNum}&bno=${board.bno}&type=${pm.cri.type}&keyword=${pm.cri.keyword}"><c:out value="${board.title}"/></a></td>
							  </c:otherwise>
							  </c:choose>
							<td><c:out value="${board.mid}"/></td>
							<td><fmt:formatDate value='${board.regdate}' pattern="yyyy.MM.dd hh:mm:ss" /></td>
							<td class="center"><c:out value="${board.views}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	<div class="row">
		<div class="col-sm-8 col-sm-offset-2">
			<form method="get" class="form-inline">
				<div class="form-group">
					<select name="type" id="selectType" class="form-control"
						style="width: 225px;">
						<option value="">----</option>
						<option value="t" ${pm.cri.type eq 't'? "selected": '' }>TITLE</option>
						<option value="c" ${pm.cri.type eq 'c'? "selected": '' }>CONTENT</option>
						<option value="m" ${pm.cri.type eq 'm'? "selected": '' }>WRITER</option>
						<option value="tc" ${pm.cri.type eq 'tc'? "selected": '' }>TITLE+CONTENT</option>
						<option value="tm" ${pm.cri.type eq 'tm'? "selected": '' }>TITLE+WRITER</option>
						<option value="tcm" ${pm.cri.type eq 'tcm'? "selected": '' }>TITLE+CONTENT+WRITER</option>
					</select>
				</div>
				<div class="form-group">
					<input class="form-control" type="text" id="keyword" name="keyword"
						value="${pm.cri.keyword}" size="70">
				</div>
				<div class="form-group">
					<button id="btn_search" class="btn btn-primary">SEARCH</button>
				</div>
				<div class="form-group">
					<button id="btn_write" class="btn btn-info">등록</button>
				</div>
			</form>
		</div>

	</div>
</div>

<div class="row">
	<div class="col-sm-8 col-sm-offset-4">
		<div id="pagination">
			<ul class="pagination">
			<li><span style="background-color: orange">Page ${pm.cri.page} of ${pm.total}</span></li>
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
							<li ${pm.cri.page == idx ? 'class=active':''}><a id="pageLink" class="btn btn-secondary"
								href="/board/list?page=${idx}">${idx}</a></li>
						</c:when>
						<c:otherwise>
							<li ${pm.cri.page == idx ? 'class=active':''}><a id="pageLink" class="btn btn-secondary"
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



<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
	var btn = $("#btn_search")
	var selectType = $("#selectType")
	var writeBtn = $("#btn_write") 
	var keyword = $("#keyword")
	var pageLink = $("#pageLink")

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

<%@ include file="footer.jsp"%>
