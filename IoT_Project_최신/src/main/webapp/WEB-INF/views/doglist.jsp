<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    
<%@ taglib uri = "http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/include/header2.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">




<script type="text/javascript">

$(document).ready(function(){
	//제이쿼리 ->$ 알려주고 있다. 문법
	var result ="<c:out value='${registerdno}'/>";
	//Controller 에서 값을 들고오는 $. addFlashAttribute 1번만 값을 전송하라. 
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result){
		
		if(result==='' || history.state) return;
		//if(parseInt(result) >0 ) $("#registerModal").modal();
		 
		 
		if(parseInt(result) > 0 ){
			$(".modal-body").html("강아지 분양등록이 이루어졌습니다.");
			$("#registerModal").modal("show"); 
		}		
			
	}
	
	//doglist 아래 상세보기 버튼 클릭시 자바스크립트로 이동
	//상세보기 버튼은 dno 값을 URL에 넘겨줘야하기에 자바스크립트 처리보다는 버튼 onclick 속성이용.
	/* $("#detailBtn").on("click", function(){
		location.herf="/dogdetail";
	}); */
	
	
	/* var doglist =$("#doglist");
	//doglist 아래 장바구니 버튼 클릭시 자바스크립트로 이동
	//해당 폼 post 방식으로 전송하니깐 해당자바스크립트는 굳이 사용하지 않는다.
	$("#cartBtn").on("click", function(e){
		//location.href="/doglist"; 이동되면 안된다.
		cart.attr("action", "/dogcart");
		cart.attr("method", "post").submit();
	}); */
	
	//doglist 위의 등록하기 버튼 클릭시 자바스크립트로 이동처리
	//post로 가야하기에 location.href는 get방식이라 post로 이동하지 않고 getmapping 되기에 에러발생할듯.
	/* $("#regBtn").on("click", function(){
		location.href="/cart";
	}); */
	
	/* var actionForm =$("#actionForm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault(); //보호해제
		console.log('click');//개발자도구에서 보이는  console 자바스크립트 블록안이라서
		actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));
	//val=value , a가 this 객체가 된다.
	}); */
	
	/* $(".paginate_button a").on("click",function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});//이 처리를 해줘야 페이지가 이동된다. */
	
	/* $(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
		//제목의 하이퍼링크 속성 클릭=this
		actionForm.attr("action","/board/get");
		actionForm.submit();
	}); */
	
});

</script>

<style>
p{font-family: 'Poor Story', cursive; font-size:1.6em;}
.card-title{font-family: 'Poor Story', cursive; font-size:1.8em; font-weight:800;}
</style>


<br> 
<br>
<br>
<h2 class="panel-title" style="text-align:center; margin-bottom:30px; font-family:'Jua'; font-size:3.0em;">
	<i class="fas fa-bullhorn"></i>&nbsp;&nbsp; 분양 강아지 알림
</h2> 

  
<div class="container">
	<div class="row">
		<div class="col-lg-4">
			<button id="regBtn" type="button" class="btn btn-danger btn-lg" onclick="location.href='/dogregister'">분양 강아지 등록</button>
		</div>
	</div>
</div>
		
<br>
<br>
<!--$.ajax 장바구니담기 버튼 클릭시 이동 -->
<form action="/cart" method="post">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
<%-- 장바구니 담기에 필요한데 필요없을듯 주석처리 <input type="hidden" name="dno" value="${registerdno.dno}"> --%>		







<div class="container">
		<div class="row">
			 <c:forEach items="${registerdno}" var="list">
			<%-- <c:forEach items="${registerdno}"> 화면이 안나온다--%>
				<div class="col-lg-4">
					<div class="card mb-4">
							<!-- <a href="#"><img class="card-img-top" src="resources/img/dog/닥스훈트.png" style="object-fit: scale-down"
								alt="..."></a> -->
								
							<%-- 안됨<a href="#"><img class="card-img-top" src="C://upload/${list.fileName}" style="width:200%;" alt="..." /></a> --%>
							<%-- 안됨<a href="#"><img class="card-img-top" src="<spring:url value='/image/${list.fileName}'/>" style="object-fit: scale-down" alt="..."/></a> --%>
								 <a href="#"><img class="card-img-top" src="<spring:url value='/image/${list.fileName}'/>" style="object-fit: scale-down" alt="<c:out value='${list.kind}'/>" title="<c:out value='${list.kind}'/>"/></a>
							<%-- 안됨<a href="#"><img class="card-img-top" src="C://upload/${list.fileName}" style="object-fit: scale-down" alt="..."/></a> --%>
							<!-- 안됨<a href="#"><img class="card-img-top" src="resources/img/dog/닥스훈트.png" style="object-fit: scale-down" alt="..."></a> -->
						
						
						<div class="card-body">
							<div class="small text-muted">
								등록일자 :
								<fmt:formatDate pattern="yyy-MM-dd" value="${list.regdate}" />
							</div>
							<div>
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</div>
	<%-- 						<h2 class="card-title h4">
								품종 :
								<a href='/dogdetail?dno=<c:out value="${list.dno}"/>'>
								<c:out value="${list.kind}" /></a>
							</h2> --%>
							
							
							<h2 class="card-title h4">
									품종 :
									<a href='/dogdetail?dno=<c:out value="${list.dno}"/>'>
									<%-- <c:out value="${list.kind.substring(0, list.kind.length-1)}" /> --%>
									<c:out value="${fn:split(list.kind,',')[0]}"/></a>
									<%-- <c:out value="${list.kind.slice(0, -1)}" /></a> --%>
	
							</h2>
							
							
							<p class="card-text">
								나이 :
								<c:out value="${list.age}" />
								<br> 성별 :
								<c:out value="${list.sex}" />
								<br> 특징:
								<c:out value="${list.simple}" />
								<br> 분양가:
								
								<%-- 아래 코드로 변경 <c:out value="${list.price}" /> --%>
								<fmt:formatNumber value="${list.price }" pattern="#,###,###"/>원
							</p>
							
							<!-- <div class="card-body"> 안에 위치해야 한다. -->
							
							
							<div style="text-align:right;">
								<button type="button" data-oper='dogdetail' class="btn btn-outline-warning" onclick="location.href='/dogdetail?dno=<c:out value="${list.dno }"/>'">
								상세보기</button>
								<%-- <button type="submit" id="detailBtn" class="btn btn-outline-warning">상세보기</button>
								<input type="hidden" value="<c:out value='${list.dno}'/>"> --%><!--${registerdno} 값으로는 페이지 이동불가 -->
								<!-- <button type="submit" id="bagBtn" class="btn btn-outline-danger">장바구니담기</button> -->
								<!-- <button type="submit" id="cartBtn" class="btn btn-outline-danger">장바구니담기</button> -->
							</div>
						</div>	
					</div>
				</div>		
	
				
					<%-- <button type="button" id="detailBtn"
					class="btn btn-outline-warning"><a href='/dogdetail?dno=<c:out value="${register.dno}"/>'
					target='_blank'>상세보기</a></button> --%>
					
					<%-- <form action="/dogdetail" method="get">
					<input type="hidden" value="{c:out value='${detail.dno}'/>">
					<button type="button" id="bagBtn" class="btn btn-outline-warning">상세보기</button>
					</form> 이 방법 안됨 레이아웃 비틀어짐--%>
					
			</c:forEach>

</form> 



<!-- 기본틀 추가 -->
<!-- <div class="container">
	<div class="row"> -->
		<div class="col-lg-4">
			<div class="card mb-4">
				<div style="text-align:center;"><img class="card-img-top"
					src="/resources/img/dog/골든리트리버.png"
					style="width:350px; height:400px;" alt="골든리트리버"  title="골든리트리버"/>
				</div>
				
				<div class="card-body">
					<div class="small text-muted">
						등록일자 : 2021.12.15
					</div>
					
					<div>
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</div>
					
					<h2 class="card-title h4">
						<a href="#">품종 : 골든리트리버</a>
					</h2>	
						<p class="card-text">
							 나이 : 8개월						
							<br> 성별 : 여(암컷)
							<br>
							<br> 특징 : 황금색 털과 검은 눈, 검은 코 그리고 처진 귀를 가졌고 사람을 아주 잘 따릅니다. 
							<br>
							<br> 분양가 : 800,000 원

						</p>
						
						<div style="text-align: right;">
							<button data-oper='dogdetail' class="btn btn-outline-warning"
								onclick="location.href='/doglist>'">상세보기</button>
						</div>		
				</div><!-- 끝 <div class="card-body"> -->
			</div><!--끝  <div class="card mb-4"> -->
		</div class="col-lg-4">



		<div class="col-lg-4">
			<div class="card mb-4">
				<div style="text-align:center;"><img class="card-img-top"
					src="/resources/img/dog/펨브록웰시코기.png"
					style="width:350px; height:400px;" alt="펨브록웰시코기"  title="펨브록웰시코기"/>
				</div>
				
				<div class="card-body">
					<div class="small text-muted">
						등록일자 : 2021.12.14
					</div>
					
					<div>
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</div>
					
					<h2 class="card-title h4">
						<a href="#">품종 : 펨브록웰시코기</a>
					</h2>	
						<p class="card-text">
							 나이 : 2살				
							<br> 성별 : 여(암컷)
							<br>
							<br> 특징 : 몸에 비해 다리는 짧지만 튼튼하고 운동량이 많아서 매일 운동이 필요합니다.
							<br>
							<br> 분양가 : 900,000 원

						</p>
						
						<div style="text-align: right;">
							<button data-oper='dogdetail' class="btn btn-outline-warning"
								onclick="location.href='/doglist>'">상세보기</button>
						</div>		
				</div><!-- 끝 <div class="card-body"> -->
			</div><!--끝  <div class="card mb-4"> -->
		</div class="col-lg-4">
		
		<div class="col-lg-4">
			<div class="card mb-4">
				<div style="text-align:center;"><img class="card-img-top"
					src="/resources/img/dog/진돗개.png"
					style="width:350px; height:400px;" alt="진돗개"  title="진돗개"/>
					<!-- object-fit: scale-down;  -->
				</div>
				<div class="card-body">
					<div class="small text-muted">
						등록일자 : 2021.12.13
					</div>
					
					<div>
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</div>
					
					<h2 class="card-title h4">
						<a href="#">품종 : 진돗개</a>
					</h2>	
						<p class="card-text">
							 나이 : 5살						
							<br> 성별 : 남(수컷)
							<br>
							<br> 특징 : 주인에 대한 충성심과 복종심이 강함
							<br>
							<br> 분양가 : 1,000,000 원
						</p>
						
					<div style="text-align: right;">
						<button data-oper='dogdetail' class="btn btn-outline-warning"
							onclick="location.href='/doglist>'">상세보기</button>
					</div>		
				</div><!-- 끝 <div class="card-body"> -->
			</div><!--끝  <div class="card mb-4"> -->
		</div><!-- 끝 <div class="col-lg-4"> -->
<!-- 	</div>끝<div class="row">
</div>끝 <div class="container"> -->
		</div><!-- 끝 <div class="row"> -->
	</div><!-- 끝<div class="container"> -->




<!-- 모달창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">알림창</h4>
            </div>
            <div class="modal-body">
				강아지 분양등록이 이루어졌습니다
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
 	 </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>