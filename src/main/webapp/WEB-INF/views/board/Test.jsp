<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="row">
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="info">
						<th style="text-align: center" width="10%">글번호</th>
						<th style="text-align: center" width="50%">제목</th>
						<th style="text-align: center" width="15%">작성자</th>
						<th style="text-align: center" width="20%">작성일</th>
						<th style="text-align: center" width="5%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr style="text-align: center" class="odd gradeX">
						<td>1</td>
						<td style="text-align: left">테스트중입니다</td>
						<td>정원준</td>
						<td>2018/05/23 오후 4시 30분</td>
						<td class="center">10</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
	 <form method="get">
		<div class="col-sm-12">
				<select name="type" id="selectType" class="custom-select" style="width: 170px;">
					<option value="">----</option>
					<option value="t" ${pm.cri.type eq 't'? "selected": '' }>TITLE</option>
					<option value="c" ${pm.cri.type eq 'c'? "selected": '' }>CONTENT</option>
					<option value="m" ${pm.cri.type eq 'm'? "selected": '' }>WRITER</option>
					<option value="tc" ${pm.cri.type eq 'tc'? "selected": '' }>TITLE+CONTENT</option>
					<option value="tm" ${pm.cri.type eq 'tm'? "selected": '' }>TITLE+WRITER</option>
					<option value="tcm" ${pm.cri.type eq 'tcm'? "selected": '' }>TITLE+CONTENT+WRITER</option>
				</select>
			<input type="text" id="keyword" name="keyword" value="${pm.cri.keyword}" size="70">
			<button id="btn_search" class="btn btn-primary">SEARCH</button>
			<button id="write" class="btn btn-info">등록</button>
			</form>
		</div>
	</div>
</div>


<%@ include file="footer.jsp"%>