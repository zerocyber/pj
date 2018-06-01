<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
#wall {
	width:100%;
	height:100%;
	border:1px solid #E0F8F7;
	background-color: #F2F2F2;
	position: absolute;
	display: none;
	z-index: 100000;
	justify-content: center;
	align-items: center;
	opacity:1;
	top: 0px;
	left: 0px;
}
.picture {
	z-index:1;
	opacity: 1;
}
</style>

<div class="container-fluid col-sm-12 col-md-12 main" style="margin-top:10px;">
	<div class="row">
		<div class="col-sm-offset-2 col-sm-4">
			<h3>영화 게시판</h3>
		</div>
	</div>


<form>
	<div class="form-group row">
		<div class="col-sm-8 col-sm-offset-2">
			<label for="title">Title</label>
			<div class="row">
				<div class="col-sm-9">
					<input type="text" class="form-control" id="title" value="${BoardVO.title}" readonly />
				</div>

				<div class="col-sm-3 text-right">
					<div class="col-sm-6 text-right"><h4><span class="label label-primary">${BoardVO.kno eq '10' ? '후기': BoardVO.kno eq '20' ? '일반' : '질문'}</span></h4></div>
					<div class="col-sm-6 text-right"><h4><span class="label label-primary">${BoardVO.gno eq '100' ? 'Comedy' : BoardVO.gno eq '200' ? 'Action' : 'Drama' }</span></h4></div>

				</div>

			</div>
		</div>
	</div>

	<div class="form-group row">
	    <div class="col-sm-8 col-sm-offset-2">
	      <label for="content">Content</label>
	      <textarea class="form-control" rows="10" readonly>${BoardVO.content}</textarea>
	    </div>
    </div>

     <div class="form-group row">
       <div class="col-sm-2 col-sm-offset-8">
         <p class="text-right label label-warning pull-right">${BoardVO.mid}</p>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-8 col-sm-offset-2 upload">
         <label for="fileList">FileList</label>
         <div class="row">
           <c:forEach items="${BoardVO.files }" var="list">
           <c:choose> 
           <c:when test="${list.contains('jpg') || list.contains('png') || list.contains('gif') }">                                 
           <span class="col-sm-2"><img src="/displayFile?fileName=${list}" class="img-thumbnail picture"></span>
           </c:when>
           <c:otherwise>         
           <a href="/displayFile?fileName=${list}"><span class="col-sm-2">${list}</span></a>
           </c:otherwise>                        
           </c:choose>
           </c:forEach>
         </div>
       </div>
     </div>
</form>


	<div id="wall">
		<div class="picture" align="center">
		</div>
	</div>


	<div class="row">
	  <div class="col-sm-8 col-sm-offset-2">
	    <label for="replyList" class="replyUL">ReplyList</label>
		</div>
	    <div class="col-sm-8 col-sm-offset-2 replyBox"></div>
	</div>

	<div class="row">
	  <div class="col-sm-8 col-sm-offset-2">
	    <div class="empty col-sm-12 text-center"></div>
	  </div>
	</div>

	<div class="row">
	     <div class="col-sm-8 col-sm-offset-2">
	       <label for="replyContent">ReplyContent</label>
	       <div class="row">
	       <textarea class="form-control replyContent" rows="2"></textarea>
	       <label class="col-sm-1">Writer</label>
	       <button type="submit" class="col-sm-1 col-sm-offset-10 btn btn-default btn-xs active" id="replyBtn">등록</button>
	       </div>
	       <div class="row">
	       <input type="text" class="col-sm-2 replyWriter btn-xs"/>
	       </div>
	       </div>
	     </div>
	</div>
    
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
    

<form id="inform" method="post">
  <input type="hidden" name="page" value="${cri.page}">
  <input type="hidden" name="bno" value="${BoardVO.bno}">
  <input type="hidden" name="type" value="${cri.type}">
  <input type="hidden" name="keyword" value="${cri.keyword}">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
  var formObj = $("#inform");
  

  var wall= $("#wall");
  var picture=$(".picture");
  var download=$(".download");
  
  console.log('${BoardVO.mid}');
  console.log('${LOGIN.mid}');
  
  var mid = '${BoardVO.mid}';
  var user = '${LOGIN.mid}';
  
  
	$(".upload").on("click","div span img",function(e) {
		console.log("span clicked");
		var address = $(e.target)[0].src;
		var target1 = address.substring(0, address.indexOf('s_'));
		var target2 = address.substring(address.indexOf('s_')+2);
		var originalName = target1 + target2;
		var add = "<img src='"+originalName+"'/>";
		picture.html(add);
		wall.show("slow");
	});

	wall.on("click", function(e) {
		wall.hide("slow");
	});
	
	download.on("click", function(e) {
		console.log(e.target);
		e.preventDefault();
		var fileName = $(e.target).text();
		var result = confirm("download?");
		if(result){
			location.replace('/displayFile?fileName='+fileName);
		};
	});
  

	
	
  	$("#back").on("click", function(e) {
   	 self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
 	});


  	$("#modify").on("click", function(e) {
    	self.location = "/board/modify?page=${cri.page}&perPageNum=${cri.perPageNum}&bno=${BoardVO.bno}";
  	});
  
  	$("#remove").on("click", function(e) {
  		
  		 if(user != "" && user != mid){
  			 alert("글 작성자만 삭제 가능합니다");
  			 e.preventDefault();
  			 return false;
  		 }
  		 if(user === ""){
  			 alert("로그인이 필요한 기능입니다")
  			 location.href = "/login";
  		 }
  		
    	formObj.attr("action", "/board/delete");
    	formObj.submit();
  	});
  
  /* 댓글 페이지 로딩 */
  function pageList(page) {
    if(typeof page == "undefined"){
      var page = 1;
    }
    console.log("page loading.....................  ");

    $.getJSON("/replies/${param.bno}/"+page, function(data){

      var str = "";

      
		/* <td><fmt:formatDate value='${board.regdate}'
			pattern="yyyy.MM.dd hh:mm:ss" /></td> */
      
      
      $(data.list).each(function(){
      var calendar = new Date(this.regdate);
      var cal = calendar.getFullYear() +"/"+ calendar.getMonth() +"/" + calendar.getDate() + "/" + calendar.getHours() + ":" + calendar.getMinutes();
	  str += "<div class='row' data-rno='"+this.rno+"' data-content='"+this.content+"' data-mid='"+this.mid+"' data-event='regist'>"
			      +"<span class='col-sm-1' style='font-size:2px; font-style: italic;'>"+this.mid+"</span>"
				      +"<button class='col-sm-1 col-sm-offset-7 btn-xs btn-link active' id='reModiBtn'>수정</button>"
				      +"<button class='col-sm-1 btn-xs btn-link active' id='redeleteBtn'>삭제</button>"

				      +"<span class='col-sm-2 text-right label label-danger'>"+cal+"</span>"

			      +"<span class='col-sm-12'>"+this.content+"</span>"
    		 +"</div>";
      });
      $(".replyBox").html(str);
      replyPaging(data.pm);
    });
  };
  pageList();
  /* 댓글 페이지 로딩 */
  
  /* 댓글 추가 */
  $("#replyBtn").on("click", function(e){
    
    if( $("#replyBtn").attr('event') !== 'modify') {
      
    var content = $(".replyContent").val();
    var writer = $(".replyWriter").val();
    var bno = '${param.bno}'
    var UL = $(".replyUL");

    $.ajax({
      type: "post",
      url : "/replies/new",
      dataType : "text",
      headers : {
        "content-type" : "application/json",
        "x-http-method-override" : "post"
      },
      data : JSON.stringify({
        content : content,
        mid : writer,
        bno : bno
      }),
      success : function(result) {
        alert(result);
        $(".replyContent").val("");
        pageList();
        
      } 
    });
    }else{
      var content = $(".replyContent")[0].value;

      var rno = $("#replyBtn").attr('rno');

      var mid = $("#replyBtn").attr('mid');

      $.ajax({
        type: "PUT",
        url : "/replies/${param.bno}/1",
        dataType : "text",
        headers : {
          "content-type" : "application/json",
          "x-http-method-override" : "PUT"
        },
        data : JSON.stringify({
          content : content,
          rno : rno,
          mid : mid
        }),
        success : function(result) {
            alert(result);  
            $("#replyBtn")[0].innerText = "Apply";
            $("#replyBtn").attr('event', 'regist');
            $(".replyContent").val("");
            pageList();
        } 
      });
    }
    
  });
  /* 댓글 추가 */
  

  /* 댓글 수정 */
  $(".replyBox").on("click","div #reModiBtn",function(e){
    
    
    var applyBtn = $("#replyBtn");
    applyBtn[0].innerText = "Modify";
    
    var replyText = $(e.target.parentElement);
    var rno = replyText.data('rno');
    var mid = replyText.data('mid');
    var content = replyText.data('content');
    
    $(".replyContent")[0].value = content;
    $(".replyWriter")[0].value = mid;
    
    applyBtn.attr("rno", rno);
    applyBtn.attr("content", content);
    applyBtn.attr("mid", mid);
    applyBtn.attr("event", "modify");
  });

  /* 댓글 수정  */
  
  /* 댓글 삭제 시작*/
  $(".replyBox").on("click","div #redeleteBtn",function(e){
  
    if(confirm("삭제하시겠습니까?")){

    var random = $(this).parent();
    var bno = "${param.bno}";
    var rno = random.data('rno');

    $.ajax({
      
    type : 'delete',
    url : "/replies/"+bno+"/"+rno,
    headers : {
      "Content-Type" : "application/json",
      "X-HTTP-Method-Override" : "DELETE"
    },  
    dataType : 'text',
    success : function(result){
      console.log("result: " + result)
      if(result == 'SUCCESS'){
        alert("댓글이 삭제되었습니다");
        pageList();
      }
      }
    });
    };
  }); // delete ajax
  /* 댓글 삭제 */
  
  /* 댓글 하단 페이징 */
  function replyPaging(pm){
    
    var ddd = "";
    
    if(pm.prev){
      
      ddd += "<li><a href = '"+(pm.startPage -1)+"'> >> </a></li>";
    }
    
    for(var i = pm.startPage, len = pm.endPage; i< len+1; i++){
      
      var strClass = pm.cri.page == i?'class=active':'';
      ddd += "<li class='btn btn-secondary'"+ strClass +"><a href='"+i+"'>"+i+"</a></li>";
    }
    
    if(pm.next){
      
      ddd += "<li><a href = '"+(pm.endpage +1)+"'> >> </a></li>";
    }
    $('.empty').html(ddd);
    };
    
    $(".empty").on("click","li a",function(e){
      e.preventDefault();
      var page = $(e.target).text(); // page number
      pageList(page);

    });  

  /* 파일 리스트 로딩 */
  (function fileList() {
	 
	  
	var file = '${fileList}';
	console.log(file);

	  
  })();
  /* 파일 리스트 로딩 */
  
  $(".download").on("click",function(e){
	  console.log("download click")
	  
	  if(confirm("download??")){
		  location.replace("/displayFile?fileName=${BoardVO.files}");
	  } 
  });
  
});

</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>