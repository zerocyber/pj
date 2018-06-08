<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
#fakeContent {
	height: 600px;
	overflow:scroll;
}
</style>

<div class="col-sm-12 col-md-12 main" style="margin-top: 50px;">
	<div class="row">
	  <div class="text-center">
	    <h3>이미지 게시판</h3>
	  </div>
	</div>

	<form>
		<div class="form-group row">
			<div class="col-sm-8 col-sm-offset-2">
				<label for="title">Title</label>
				<div class="row">
					<div class="col-sm-12">
						<input type="text" class="form-control" id="title" value="${PhotoVO.title}" />
					</div>
				</div>
			</div>
		</div>
	
		<div class="form-group row">
		    <div class="col-sm-8 col-sm-offset-2">
		      <label for="content">Content</label>
		      
		      <div class="form-control" id="fakeContent" contenteditable="true">
			   <div class="col-sm-12">
			   ${PhotoVO.content}
			   </div>
			  </div>
		    </div>
	    </div>
	
	     <div class="form-group row">
	       <div class="col-sm-2 col-sm-offset-8">
	         <p class="text-right label label-warning pull-right">${PhotoVO.mid}</p>
	       </div>
	     </div>
	</form>
    
	<div class="row">
	    <div class="col-sm-8 col-sm-offset-2">
	      <div class="row">
	        <div class="col-sm-12 text-center">
		        <button id="back" type="button" class="btn btn-xs btn-default">To List</button>
		        <button id="modify" type="button" class="btn btn-xs btn-default">Modify</button>
		        <button id="remove" type="button" class="btn btn-xs btn-default">Delete</button>
	        </div>
	      </div>
	    </div>
	</div>
</div>  
<form id="inform" method="post">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="pno" value="${PhotoVO.pno}">
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
});

</script>   
<%@ include file="/WEB-INF/views/include/footer.jsp"%>