<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header.jsp"  %>


<div class="container">
	<div class="row">
	
	
		<div class="col-md-12">
			<a href="notice/list?type=notice" id="notice"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4 ">
				<h4>
					<i class="fas fa-bullhorn"></i>공지사항
				</h4>
				<small>공지사항과 여러 알림을 볼 수 있는 게시판 입니다.</small>
			</a> 
		</div>
		
		<div class="col-md-12">
			<a href="community/list?type=community" id="community"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4 ">
				<h4>
					<i class="fas fa-comments"></i>커뮤니티
				</h4>
				<small>회원들이 자유롭게 글을 올릴 수 있는 게시판입니다.</small>
			</a> 
		</div>
		
		<div class="col-md-12">
			<a href="qna/list?type=qna" id="qna"
				class="navbar-brand text-black text-center d-block mx-auto py-3 mb-4">
				<h4>
					<i class="fas fa-question-circle"></i>질문답변
				</h4>
				<small>이곳에 질문을 하시면 답변을 해드립니다.</small>
			</a>
		</div>
	
		
		
	</div>
</div>



	
			


<script type="text/javascript">
$(document).ready(function(){
	
	history.replaceState({}, null, null);

 	
	$("#notice").on("click", function(e){
		e.preventDefault();
		location.href="/board/notice/list";
	});
	
	$("#community").on("click", function(e){
		e.preventDefault();
		location.href="/board/community/list?type=community";
	});
	
	$("#qna").on("click", function(e){
		e.preventDefault();
		location.href="/board/qna/list?type=qna";
	});

});

</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"  %>