<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	.navbar-toggler{
		text-decoration:none;
		font-size:32px;
		font-family: 'Jua', sans-serif;
	}
	.navbar-toggler:hover{
		border:1px solid gray;
		border-radius:30px;
		/* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#ebe9f9+0,d8d0ef+75,cec7ec+96,c1bfea+100 */
		background: rgb(235,233,249); /* Old browsers */
		background: -moz-radial-gradient(center, ellipse cover,  rgba(235,233,249,1) 0%, rgba(216,208,239,1) 75%, rgba(206,199,236,1) 96%, rgba(193,191,234,1) 100%); /* FF3.6-15 */
		background: -webkit-radial-gradient(center, ellipse cover,  rgba(235,233,249,1) 0%,rgba(216,208,239,1) 75%,rgba(206,199,236,1) 96%,rgba(193,191,234,1) 100%); /* Chrome10-25,Safari5.1-6 */
		background: radial-gradient(ellipse at center,  rgba(235,233,249,1) 0%,rgba(216,208,239,1) 75%,rgba(206,199,236,1) 96%,rgba(193,191,234,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ebe9f9', endColorstr='#c1bfea',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

	}
</style>

		<!-- 왼쪽 사이드바 -->
	
		<div class="col-md-2 pt-4 sidebar "  >
			<a href="notice" class="notice  navbar-toggler text-black text-center d-block mx-auto px-2 py-3 mb-4 ">
				<i class="fas fa-bullhorn"></i>&nbsp; 공지사항
			</a> 
			<a href="community"  class="community  navbar-toggler text-black text-center d-block mx-auto px-2 py-3 mb-4 ">
				<i class="fas fa-comments"></i>&nbsp; 커뮤니티
			</a> 
			<a href="qna" class="qna  navbar-toggler text-black text-center d-block mx-auto px-2 py-3 mb-4">
				<i class="fas fa-question-circle"></i>&nbsp; 질문답변
			</a>
		
		</div>
		<!-- 왼쪽 사이드바 종료 -->




<script type="text/javascript">
	$(document).ready(function() {

		$(".notice").on("click", function(e) {
			e.preventDefault();
			location.href = "/board/notice/list?type=notice";
		});

		$(".community").on("click", function(e) {
			e.preventDefault();
			location.href = "/board/community/list?type=community";
		});

		$(".qna").on("click", function(e) {
			e.preventDefault();
			location.href = "/board/qna/list?type=qna";
		});

	});
</script>