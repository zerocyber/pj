<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

${pm}
${cri}
${BoardVO}

<li><a href="read?page=${pm.cri.page}&perPageNum=${pm.cri.perPageNum}&bno=${BoardVO[0].bno}">${BoardVO[0].title}</a></li>



			
						
<c:if test="${pm.prev}">
<li><a href="list?page=${pm.startPage-1}&perPageNum=${pm.cri.perPageNum}">prev</a></li>
</c:if>
						
<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
<li><a href="list?page=${idx}&perPageNum=${pm.cri.perPageNum}">${idx}</a></li>
</c:forEach>

<c:if test="${pm.next}">
<li><a href="list?page=${pm.endPage+1}&perPageNum=${pm.cri.perPageNum}">next</a></li>
</c:if>
</body>
</html>