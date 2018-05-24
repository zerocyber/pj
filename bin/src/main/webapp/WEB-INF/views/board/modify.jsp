<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container">
	<div id="content" class="snippet-hidden">

		<div id="mainbar" class="ask-mainbar">

			<form id="post-form" class="post-form" method="post">

				<select name="kno">
					<option value="">게시판 분류</option>
					<option value="10" ${boardVO.kno eq "10"?"selected":''}>후기</option>
					<option value="20" ${boardVO.kno eq "20"?"selected":''}>일반</option>
					<option value="30" ${boardVO.kno eq "30"?"selected":''}>질문</option>
				</select> 
				<select name="cno">
					<option value="">과정선택</option>
					<option value="100" ${boardVO.cno eq "100"?"selected":''}>JAVA</option>
					<option value="200" ${boardVO.cno eq "200"?"selected":''}>C</option>
					<option value="300" ${boardVO.cno eq "300"?"selected":''}>C#</option>
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
										class="js-ask-title"
										data-min-length="15" data-max-length="150" value = "${boardVO.title}"></td>
								</tr>
							</table>

						</div>
					</div>
				</div>


				<div id="post-editor" class="post-editor js-post-editor">

					<div style="position: relative;">
						<div class="wmd-container">
							<label>내용</label> <br>
							<textarea id="wmd-input" class="wmd-input" name="content"
								cols="92" rows="15" tabindex="101" data-min-length="">${boardVO.content}</textarea>
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
										data-max-length="150" value = "${boardVO.mid}"></td>
								</tr>
							</table>

						</div>
					</div>
				</div>
				<br>


				<div id="question-only-section">
					<div class="form-submit cbt">
						<button>수정</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


	<%@ include file="footer.jsp"%>