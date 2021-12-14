<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header2.jsp"%>


<div class="row">

	<%@ include file="/WEB-INF/views/include/leftSidebar.jsp"%>

	<div class="col-md-8">
		<div class="panel-heading">
			<h2 class="panel-title" style="text-align:center; margin-bottom:30px; font-family:'Jua'; font-size:3.0em;">
				<i class="fas fa-comments"></i>질문답변 - 게시글 조회
			</h2>
		</div>

		<div class="panel-body">
			
			<div class="row">
				<div class="col-md-10 mb-3">
					<label class="form-label">제목</label> <input type="text"
						class="form-control" name="title" readonly
						value='<c:out value="${board.title}"/>'>
				</div>
				
				<div class="col-md-2 mb-3">
					<label class="form-label">번호</label> <input type="text"
						class="form-control" name="bno" readonly
						value='<c:out value="${board.bno}"/>'>
				</div>
			</div>

			<div class="row">
				<div class="col-md-5 mb-3">
					<label class="form-label ">작성일</label> <input type="text"
						class="form-control" name="regDate" readonly
						value='<fmt:formatDate pattern="yyyy년 MM월 dd일   HH시 mm분 ss초"
									value="${board.regdate }" />'>
				</div>
				<div class="col-md-5 mb-3">
					<label class="form-label ">수정일</label> <input type="text"
						class="form-control" name="updateDate" readonly
						value='<fmt:formatDate pattern="yyyy년 MM월 dd일   HH시 mm분 ss초"
									value="${board.updatedate }" />'>
				</div>
				<div class="col-md-2 mb-3">
					<label class="form-label ">조회수</label> <input type="text"
						class="form-control" name="viewcnt" readonly
						value='<c:out value="${board.viewcnt}" />'>
				</div>
			</div>

			<div class="mb-3">
				<label class="form-label">작성자</label> <input type="text"
					class="form-control" name="writer" readonly
					value='<c:out value="${board.writer}"/>'>
			</div>

			<div class="mb-3">
				<label class="form-label">내용</label>
				<textarea class="form-control" rows="12" name='content' readonly><c:out value='${board.content}'  /></textarea>
			</div>

			
			<!-- 첨부파일 -->
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header with-border ">
						<h5 class="card-title" style="margin-top:10px; margin-bottom:10px;">
							<i class="fas fa-folder-open"></i>&nbsp;첨부파일
						</h5>
						<small>파일은 클릭시 다운로드, 이미지는 크기가 커집니다.</small>
					</div>
					<div class="card-body">
							<div class="row">
								<div class="uploadResult" id="uploadResult">
									<ul>
					
									</ul>
								</div>
			
							</div>
					</div>
					
				</div>
			</div>
			
			<div class="bigPictureWrapper">
				<div class="bigPicture"></div>
			</div>
			<!-- 첨부파일 -->

			<div class="row " style="margin-top: 10px; margin-bottom: 10px;">
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary btn_list"><i class="fas fa-bars"></i>목록</button>
					<button type="button" class="btn btn-outline-primary btn_modify"><i class="fas fa-eraser"></i>수정</button>
					<button type="button" class="btn btn-outline-danger btn_remove"><i class="fas fa-times"></i>삭제</button>
				</div>
			</div>
			
			<!-- Page 264 조회페이지에서 <form>처리 -->
			<form id='actionForm' action="/board/qna/list" method='get'>
				<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'>	
			</form>
			
			<form id='modifyForm' action="/board/qna/modify" method='get'>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				
				<!-- Page 345 조회 페이지에서 검색 처리 -->
				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
			</form>
			
			
			<!-- 댓글 -->
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header with-border ">
						<h5 class="card-title" style="margin-top:10px; margin-bottom:10px;">
							<i class="fa fa-comments fa-fw"></i>댓글창입니다
						</h5>
					</div>
					<div class="card-body">
						<div class="row">
						
						<!-- 댓글 출력 -->	
						<ul class="chat" style="list-style:none;">
						</ul>

						</div>
						<button type="button" id="addReplyBtn" class="btn btn-outline-primary"  style="float:right;">등록</button>
					</div>
					

					<div class="card-footer">
						<nav aria-label="Contacts Page Navigation">
							<ul class="pagination pagination-sm no-margin justify-content-center m-0">
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- 댓글 -->


		</div>
	</div>
</div>



<!-- Page 420 새로운 댓글 처리 → 모달창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">&times;</button>
				<h4 class="modal-title" id="myModalLabel">답변 모달</h4>
			</div>
			
			<div class="modal-body">
				<div class="form-group">
					<label>답변</label>
					<input class="form-control" name="reply" value="새로운 답변">
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="replyer" value="replyer">
				</div>
				<div class="form-group">
					<label>작성일</label>
					<input class="form-control" name="replyDate" value="">
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" id="modalModBtn" class="btn btn-outline-primary">수정</button>
				<button type="button" id="modalRemoveBtn" class="btn btn-outline-danger">삭제</button>
				<button type="button" id='modalRegisterBtn' class="btn btn-outline-primary">등록</button>
				<button type="button" id='modalCloseBtn'  class="btn btn-outline-default" data-dismiss="modal" aria-hidden="true">닫기</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		
		
		$(".btn_list").on("click", function(e){
			actionForm.find("#bno").remove();
			actionForm.append("<input type='hidden' name='type' value='qna'>");
			actionForm.attr("action", "/board/qna/list").submit();
		});
		
		$(".btn_modify").on("click", function(e){
			actionForm.append("<input type='hidden' name='type' value='qna'>");
			actionForm.attr("action", "/board/qna/modify").submit();
		});
		
		$(".btn_remove").on("click", function(e){
			var del = confirm("정말 삭제하시겠습니까?")
			if(del == true){
				actionForm.append("<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token }' />");x
				actionForm.append("<input type='hidden' name='type' value='qna'>");
				actionForm.attr("action", "/board/qna/remove").attr("method", "post").submit();
			}
			else return;
		});
		


	});
</script>


<!-- Page 415 댓글 이벤트 처리 -->
<script>
	$(document).ready(function(){
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);	
			
		function showList(page){
			replyService.getList({bno : bnoValue, page : page || 1 }, function(replyCnt, list){
							
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
					if(list == null || list.length == 0){
						replyUL.html("");
						return;
					}
					
					for (var i=0, len=list.length || 0; i<len; i++){
					
						str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						str += "<div>";
						str += "<div class='header'>";
						str += "<strong class='primary-font'><i class='fa fa-comments fa-fw'></i>"+list[i].replyer+"</strong>";
						str += "<small class='text-muted' style='float:right;'>"+replyService.displayTime(list[i].updateDate)+"</small>";
						str += "</div>";
						str += "<p>"+list[i].reply+"</p>";
						str += "<hr>";
						str += "</div>";
						str += "</li>"; 
						
						
					}
					
					replyUL.html(str);
					
					showReplyPage(replyCnt);
				
				});
			}
		
		// Page 421 새로운 댓글의 추가 버튼 이벤트 처리
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		// 댓글 작성 버튼 클릭
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();				// 작성일 입력폼 hide
			modal.find("button").hide();	
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		// 등록 버튼 클릭
		modalRegisterBtn.on("click", function(e){
			var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					bno : bnoValue
			};
			
			replyService.add(reply, function(result){
				alert("등록  " + result);
				modal.find("input").val("");
				modal.modal("hide");
				showList(-1);
			});
			
		});
		
		
		// Page 424 특정 댓글의 클릭 이벤트 처리
		$(".chat").on("click", "li", function(e){
			var rno = $(this).data("rno");
			replyService.get(rno, function(reply){
			
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rno", reply.rno);
				
				modal.find("button").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
				
			});
		});
		
		
		// Page 426 댓글의 수정/삭제 이벤트 처리
		modalModBtn.on("click", function(e){
			var reply = {rno : modal.data("rno"), reply : modalInputReply.val(), replyer : modalInputReplyer.val()};
			replyService.update(reply, function(result){
				alert("수정 " + result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var rno = modal.data("rno");
			replyService.remove(rno, function(result){
				alert("삭제 " + result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		
		
		// Page 440 댓글 페이징
		var pageNum = 1;
		var replyPageFooter = $(".card-footer");
		
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt / 10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			
			var str ="<ul class='pagination pagination-sm no-margin justify-content-center m-0'>";
			
			if(prev){
				str += "<li class='page-item'><a class='page-link' href='"+(startNum - 1)+"'>이전</a></li>";
			}
			
			for (var i = startNum; i <= endNum; i++){
				var active = pageNum == i ? "active" : "";
				
				str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>다음</a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			
			replyPageFooter.html(str);
		}
		
		
		// 댓글 페이지 번호 이벤트 처리
		replyPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			console.log("페이지 클릭");
			var targetPageNum = $(this).attr("href");
			console.log("누른 페이지 번호 : " + targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
	});
	
</script>


<!-- 파일 업로드  -->
<script>
	$(document).ready(function(){	
	
	
	
	(function(){
		var bno = "<c:out value='${board.bno}' />";
		
		$.getJSON("/board/community/getAttachList", {bno : bno}, function(arr){
			console.log(arr);
			
			var uploadResult = $(".uploadResult ul");
			var str = "";
			
			$(arr).each(function(i, attach){
				
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid.substring(0, 6) + "_" + attach.fileName);
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"' data-type='"+attach.fileType+"'>"
					str += "<div>";
					str += "<img src='/display?fileName="+fileCallPath+"'><br/><span>"+attach.fileName+"</span></a>";
					str += "</div></li>";
				}
				else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"' data-type='"+attach.fileType+"'>"
					str += "<div>";
					str += "<img src='/resources/img/attach.png'><br/><span>"+attach.fileName+"</span>";
					str += "</div></li>";
				}
			});
			
			console.log(str);
			uploadResult.html(str);
			
		});
	})();
	
	
	$(".uploadResult").on("click", "li", function(e){
		
		console.log("VIEW IMAGE");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
		
		if (liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}
		else{
			self.location="/download?fileName="+path
		}
		
	});
	
	function showImage(fileCallPath){
		
		$(".bigPictureWrapper").css("display", "flex").show();
		
		$(".bigPicture")
		.html("<img src='/display?fileName="+fileCallPath+"'>")
		.animate({width : '100%', height : '100%'}, 500);
		
	}
	
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width : '0%', height : '0%'}, 500);
		setTimeout(function(e)  {
			$(".bigPictureWrapper").hide();
		}, 500);
	});
	
	
	
	
	});
	
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
