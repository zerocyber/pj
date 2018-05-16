<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post">
<select name="cno">
    <option value=""  selected="selected">과정선택</option>
    <option value="100">JAVA</option>
    <option value="200">C</option>
    <option value="300">C#</option>
</select>
<input type="text" name="title">
<input type="text" name="content">
<input type="text" name="mid">
<select name="kno">
    <option value=""  selected="selected">게시판 분류</option>
    <option value="10">후기</option>
    <option value="20">일반</option>
    <option value="30">질문</option>
</select>
<button>등록</button>
</form>

</body>
</html>