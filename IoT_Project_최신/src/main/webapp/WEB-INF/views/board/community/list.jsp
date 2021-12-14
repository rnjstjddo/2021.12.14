<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header2.jsp"  %>



	<div class="row">

	<%@ include file="/WEB-INF/views/include/leftSidebar.jsp"  %>


		<div class="col-md-10">
			<header class="panel-heading">

				<h2 class="panel-title">
					<i class="fas fa-comments"></i>커뮤니티
				</h2>
			</header>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table mb-none table-hover table-striped" >
						<thead>
							<tr>
								<th style="width: 10%">번호</th>
								<th style="width: 30%">제목</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 10%">조회수</th>
								<th style="width: 30%">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<!-- Page 254 목록 페이지와 뒤로가기 문제 -->
									<td>
										<a class='move'  style="text-decoration:none;" href='<c:out value="${board.bno}"/>' >
										<c:out value="${board.title}" />
										<c:if test="${board.replycnt ne 0}">
											<small>[<c:out value="${board.replycnt}"/>]</small>
										</c:if>
										</a>
									</td>
									<td><c:out value="${board.writer}" /></td>
									<td><small><c:out value="${board.viewcnt}"/></small></td>
									<td><small><fmt:formatDate type="both" value="${board.regdate }" /></small></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<div class="row" style="margin: 10px;">
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary " id="btn_register">글쓰기</button>
				<!-- 	
					<button type="button" class="btn btn-outline-info ">수정</button>
					<button type="button" class="btn btn-outline-danger ">삭제</button>
				 -->
				</div>
			</div>

			<div class="row">
				<div class="col">
					<ul class="pagination justify-content-center">
						
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"  href="${pageMaker.startPage -1}">이전</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item  ${pageMaker.cri.pageNum == num ? 'active' : ''} ">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			

			
			<div class="row justify-content-center" style="margin-top: 20px;">
				<div class="col-md-8 col-md-offset-3  ">
					<form id="searchForm" action="/board/community/list" method="get">
					<div class="input-group ">
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>
						
						<div class="input-group-prepend ">
							<select class="custom-select" name="typeSearch" style="height: 38px;">
								<option value=""<c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>검색 조건</option>
									<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
									<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>내용</option>
									<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>작성자</option>
									<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>제목 + 내용</option>
									<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>제목 + 작성자</option>
									<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : '' }"/>>제목 + 내용 + 작성자</option>	
							</select>
						</div>

						<input class="form-control" name="keyword" value="${pageRequestDTO.keyword}" style="margin: 0px 12px 0px 0px;" placeholder="검색">
						<div class="input-group-append" id="button-addon4">
							<button type="button" class="btn btn-outline-secondary btn-search"><i class="fa fa-search"></i>검색</button>
						</div>
					</div>
				</form>
				</div>
			</div>
			
			<!-- Page 311 페이지 번호 이벤트 처리 -->
			<form id='actionForm' action="/board/community/list" method='get'>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				
				<!-- Page 344 검색조건, 키워드 처리 -->
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>' >
				<input type="hidden" name="bno">
			</form>
			

		</div>
	</div>


	

	<div class="row">
		<br> 

		<br>
	</div>
	
	
	
	<!-- Page 247 모달(Modal)창 보여주기 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">모달 창</h4>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary btn_close" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->



<script type="text/javascript">
$(document).ready(function(){
	
		
	// Page 306 페이지 번호 이벤트 처리 
	var actionForm = $("#actionForm");
	

	$(".page-item a").on("click",function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='bno']").val($(this).attr("href"));
		actionForm.attr("action", "/board/community/get");
		actionForm.submit();
	});
	
	// 글쓰기 버튼 클릭이벤트 
	$("#btn_register").on("click", function(){
		self.location = "/board/community/register";
	});

	
	// Page 342 검색버튼의 이벤트처리
	var searchForm = $("#searchForm");
	
	$(".btn-search").on('click', function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("검색 조건을 선택하세요.");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 입력하세요.");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.append("<input type='hidden' name='type' value='community'>");
		e.preventDefault();
		searchForm.submit();
		
	});
	
	// 모달이벤트
	var result='<c:out value="${result}"/>';

	history.replaceState({}, null, null);
	checkModal(result);

	function checkModal(result){
		console.log(history.state);
		if(result === "" || history.state == null){
			return;
		}
		if(parseInt(result) > 0){
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
	
	$(".btn_close").on("click",function(){
		$("#myModal").modal("hide");
	});
	

});

</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"  %>