<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="container-fluid col-sm-9 col-sm-offset-3 col-md-offset-2 col-md-10 main">

  <div class="row">
   <div class="col-sm-9 col-sm-offset-1">
     <h1>Dash Board</h1>
   </div>
 </div>

 <form method="post" id="modiForm">
  <div class="form-group row">
    <div class="col-sm-9 col-sm-offset-1">
      <label for="title">Title</label>
      <div class="row">
        <div class="col-sm-10">
          <input type="text" class="form-control" id="title" name="title" required="required" value="${BoardVO.title}"/>
        </div>
        <div class="col-sm-1">
          <h4 class="text-center"><span class="label label-primary">${BoardVO.kno eq '10' ? '후기': BoardVO.kno eq '20' ? '일반' : '질문'}</span></h4>
        </div>
        <div class="col-sm-1">
          <h4><span class="label label-primary">${BoardVO.cno eq '100' ? 'JAVA' : BoardVO.cno eq '200' ? 'C' : 'C#' }</span></h4>
        </div>
      </div>
    </div>
  </div>

  <div class="form-group row">
    <div class="col-sm-9 col-sm-offset-1">
      <label for="content">Content</label>
      <textarea class="form-control" name="content" rows="10" required="required">${BoardVO.content}</textarea>
    </div>
  </div>

  <div class="form-group row">
    <div class="col-sm-2 col-sm-offset-8">
      <p class="text-right label label-warning pull-right">${BoardVO.mid}</p>
    </div>
  </div>

  <div class="form-group row">
    <div class="col-sm-9 col-sm-offset-1">
      <label for="fileList">FileList</label>
      <div class="row">
        <span class="col-sm-2">X<img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
        <span class="col-sm-2">X<img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
        <span class="col-sm-2">X<img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
        <span class="col-sm-2">X<img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
        <span class="col-sm-2">X<img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
        <span class="col-sm-2">X<img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
      </div>
    </div>
  </div>

</form>

	<div class="row">
	  <div class="col-sm-9 col-sm-offset-1">
	    <div class="row">
	      <div class="col-sm-offset-5">
	        <button id="modify" type="button" class="btn btn-xs btn-default">Modify</button>
	        <button id="delete" type="button" class="btn btn-xs btn-default">Cancle</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
  $(document).ready(function(){
   var formObj = $("#modiForm");
   $("#modify").on("click", function(e){
     formObj.submit();
   });

   $("#delete").on("click", function(e){
     self.location = "/board/read?page=${param.page}&perPageNum=${param.perPageNum}&bno=${BoardVO.bno}";
   });


 });
</script>
<%@ include file="footer.jsp"%>
    