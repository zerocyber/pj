<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.gallery {
	display: inline-block;
	margin-top: 20px;
}
</style>



<div class="container">
	<div class="row">
	
		<div class='list-group gallery'>
		
<%-- 			<c:forEach items="${GalleryVO}" var="gallery">
				<div class='col-sm-4 col-xs-6 col-md-3 col-lg-3'>
					<a class="thumbnail fancybox" rel="ligthbox" href="${gallery.fullname}"> 
						<img class="img-responsive" alt="" src="${gallery.fullname}" />
						<div class='text-right'>
							<small class='text-muted'><c:out value="${gallery.title}" /></small>
							<small class='text-muted'><c:out value="${gallery.mid}" /></small><br>
							<small class='text-muted'><c:out value="${gallery.content}" /></small>
						</div>
					</a>
				</div>				
			</c:forEach> --%>
			
		</div>
		
	</div>	
</div>




<div class="row">
	<div class="col-sm-9 col-sm-offset-1">
		<div class="col-sm-12 text-center">
			<div id="pagination">
				<ul class="pagination">
					<li><span style="background-color: black;">Page
							${pm.cri.page} of ${pm.endPage}</span></li>
					<c:if test="${pm.prev}">
						<c:choose>
							<c:when test="${pm.cri.type eq '' && pm.cri.keyword eq '' }">
								<li><a class="btn btn-info"
									href="gallery/list?page=${pm.startPage -1}">prev</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="btn btn-info"
									href="gallery/list?page=${pm.startPage -1}&type=${pm.cri.type}&keyword=${pm.cri.keyword}">prev</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
						<c:choose>
							<c:when test="${pm.cri.type eq '' && pm.cri.keyword eq '' }">
								<li ${pm.cri.page == idx ? 'class=active':''}><a
									id="pageLink" class="btn btn-secondary"
									href="/gallery/list?page=${idx}">${idx}</a></li>
							</c:when>
							<c:otherwise>
								<li ${pm.cri.page == idx ? 'class=active':''}><a
									id="pageLink" class="btn btn-secondary"
									href="/gallery/list?page=${idx}&type=${pm.cri.type}&keyword=${pm.cri.keyword}">${idx}</a></li>
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

	<div class="col-sm-1">
		<button id="btn_write" class="btn btn-xs btn-info">등록</button>
	</div>
</div>



<script>
	$(document).ready(function() {
		//FANCYBOX
		//https://github.com/fancyapps/fancyBox
		$(".fancybox").fancybox({
			openEffect : "none",
			closeEffect : "none"
		});
	
		$("#btn_write").on("click", function(e) {
	    	e.preventDefault();
			location.href = "/gallery/write"
		}); 	
	
	});
</script>







<%@ include file="/WEB-INF/views/include/footer.jsp"%>