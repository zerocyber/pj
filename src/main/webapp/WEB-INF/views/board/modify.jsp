<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

${boardVO}

<form method="post">
<input type="hidden" name="cri" value="${cri}">
<select name="kno">
    <option value="">게시판 분류</option>
    <option value="10" ${boardVO.kno eq 10 ? "selected": ""}>후기</option>
    <option value="20" ${boardVO.kno eq 20 ? "selected": ""}>일반</option>
    <option value="30" ${boardVO.kno eq 30 ? "selected": ""}>질문</option>
</select>

<input type="text" name="title" value="${boardVO.title}">
<input type="text" name="content" value="${boardVO.content}">
<input type="text" name="mid" value="${boardVO.mid}">

<select name="cno" >
    <option value="">과정선택</option>
    <option value="100" ${boardVO.cno eq 100 ? "selected":""}>JAVA</option>
    <option value="200" ${boardVO.cno eq 200 ? "selected":""}>C</option>
    <option value="300" ${boardVO.cno eq 300 ? "selected":""}>C#</option>
</select>
<button>수정</button>
</form>

	<%@ include file="footer.jsp"%>