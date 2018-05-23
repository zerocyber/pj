<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid col-sm-9 col-sm-offset-3 col-md-offset-2 col-md-10 main">

    <form>
      <div class="form-group row">
        <div class="col-sm-9 col-sm-offset-1">
          <label for="title">Title</label> <input type="text" class="form-control" id="title" placeholder="Title" />
        </div>
      </div>
      <div class="form-group row">
        <div class="col-sm-9 col-sm-offset-1">
          <label for="content">Content</label>
          <textarea class="form-control" placeholder="Content" rows="10"></textarea>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-2 col-sm-offset-8">
          <p class="text-right">작성자</p>
        </div>
      </div>

      <div class="form-group row">
        <div class="col-sm-9 col-sm-offset-1">
          <label for="fileList">FileList</label>
          <div class="row">
            <span class="col-sm-2"><img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
            <span class="col-sm-2"><img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
            <span class="col-sm-2"><img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
            <span class="col-sm-2"><img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
            <span class="col-sm-2"><img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
            <span class="col-sm-2"><img src="http://cfile26.uf.tistory.com/image/2539083755DD6E5A21E5C8" class="img-thumbnail"></span>
          </div>
        </div>
      </div>

      <div class="form-group row">
        <button type="submit" class="btn btn-default">제출</button>
      </div>
    </form>
    <div class="row">
      <div class="col-sm-9 col-sm-offset-1">
        <label for="replyList">ReplyList</label>
        <div class="row" style="background-color: #f5f5f5;">
          <span class="col-sm-2">작성자</span>
          <button class="col-sm-1 col-sm-offset-6 btn-xs btn-link active">수정</button>
          <button class="col-sm-1 btn-xs btn-link active">삭제</button>
          <span class="col-sm-2 text-right">2018/05/15</span>
          <span class="col-sm-12">내용</span>
        </div>
        <div class="row" style="background-color: #f5f5f5;">
          <span class="col-sm-2">작성자</span>
          <button class="col-sm-1 col-sm-offset-6 btn-xs btn-link active">수정</button>
          <button class="col-sm-1 btn-xs btn-link active">삭제</button>
          <span class="col-sm-2 text-right">2018/05/15</span>
          <span class="col-sm-12">내용</span>
        </div>
        <div class="row" style="background-color: #f5f5f5;">
          <span class="col-sm-2">작성자</span>
          <button class="col-sm-1 col-sm-offset-6 btn-xs btn-link active">수정</button>
          <button class="col-sm-1 btn-xs btn-link active">삭제</button>
          <span class="col-sm-2 text-right">2018/05/15</span>
          <span class="col-sm-12">내용</span>
        </div>
        <div class="row" style="background-color: #f5f5f5;">
          <span class="col-sm-2">작성자</span>
          <button class="col-sm-1 col-sm-offset-6 btn-xs btn-link active">수정</button>
          <button class="col-sm-1 btn-xs btn-link active">삭제</button>
          <span class="col-sm-2 text-right">2018/05/15</span>
          <span class="col-sm-12">내용</span>
        </div>
        <div class="row" style="background-color: #f5f5f5;">
          <span class="col-sm-2">작성자</span>
          <button class="col-sm-1 col-sm-offset-6 btn-xs btn-link active">수정</button>
          <button class="col-sm-1 btn-xs btn-link active">삭제</button>
          <span class="col-sm-2 text-right">2018/05/15</span>
          <span class="col-sm-12">내용</span>
        </div>
      </div>
    </div>
  </div>

</div>
<%@ include file="footer.jsp"%>