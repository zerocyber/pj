<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 

<%-- <link href='<c:url value="/css/kfonts2.css" />' rel="stylesheet"> --%>

<title>메일 보내기</title>
</head>
<body>

 <div class="row">
 <div class="col-sm-12 col-md-12" style="margin-top:50px";>

<div class="container">
  <h4>메일 보내기</h4>
  <form action="${pageContext.request.contextPath}/mailSending" method="post">
 
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" placeholder="이메일을 입력해주세요" class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용" class="form-control"></textarea>
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
</div>
</div>
</div>

</body>
</html> 