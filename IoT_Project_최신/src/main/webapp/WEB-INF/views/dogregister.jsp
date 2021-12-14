<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	<%@ include file="/WEB-INF/views/include/header2.jsp" %>
<!-- 	
<script type="text/javascript">
$(document).ready(function(){
	$("#regBtn").on("click", function(){
		self.location="/doglist";
	});
	
}); 
</script> -->
	
<script type="text/javascript">

function Submit(){
	
	if( form.simple.length > 65){
		alert('한줄 특징은 65글자 이하로 입력해주세요.');
		form.simple.focus();
		return false;
	}
	
	
	// 파일 업로드 확장자 체크
    if( $("#uploadfileName").val() != "" ){
         var ext = $("#uploadfileName").val().split('.').pop().toLowerCase();
 	  if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
 	     alert('등록 할수 없는 파일명입니다.');
 	     $("#uploadfileName").val(""); // input file 파일명을 다시 지워준다.
 	     return;
	  } //안쪽 if문
    }// 바깥쪽 if문

	
	
	/* function fileName(str){
		n = str.replace(/,/g,"");
		var _pattern1 = /^\d*[.]\d{1}$/; 
		return n;
	} */
	
	//품명DB 들어갈때 숫자 콤마제거-1
	/* if( form.kind.value != "" ) {
		var str = $("#kind").val();   
	    return str.replace(/[^\d]+/g, '');
	} */
	//품명DB 들어갈때 문자열 콤마제거-2
	 if( form.kind.value != "" ) {
	 	var kind = $("#kind").val();
		return kind.slice(0,-1);
	 }
		 	
	//체중weight 소수점 첫째자리수까지만 DB insert
	if( form.name.value != "" ) {
    	var tmps = $("#weight").val().replace(/[^\.|^0(0)+|^0-9\.]/g, '');
   		/* 소수점은 하나만 입력되도록*/
        var arr = tmps.split(".");
        if(arr.length > 2) {
            tmps = arr[0] + '.' + arr[1];
        } //안쪽 if문
 	   $("#weight").val(tmps);
	}//바깥쪽 if문
	
document.getElementById("form").submit();
}

/* var cnt=1;
function file(){
	$("#file").append("<br>"+"<input type='file' name='file"+cnt+"'/>");
	cnt++;
	
}
 */

</script>
	
      
<form action="/dogregister" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
<br>
<br>

<h2 class="panel-title" style="text-align:center; margin-bottom:30px; font-family:'Jua'; font-size:3.0em;">
	<i class="fas fa-bullhorn"></i>&nbsp;&nbsp; 강아지 분양등록양식을 입력해주세요
</h2>
<br>
<br>

<div class="container">
	<div class="row">
		<div class="col-lg-8"><!-- 없을경우 전체화면 가로차지한다 -->
			<div class="card-header">강아지 이름을 입력하세요</div>
			<input type="text" class="form-control" name="name" placeholder="강아지 이름을 입력하세요">
		</div>
	</div>
</div>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8"><!-- 없을경우 전체화면 가로차지한다 -->
			<div class="card-header">강아지 체중을 입력하세요(소수점 첫자리까지만 입력해주세요)단위kg 생략</div>
			<input type="text" class="form-control" name="weight" placeholder="강아지 체중을 입력하세요">
		</div>
	</div>
</div>
<br>
<br> 

<div class="container">
<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 품종을 선택하세요</div>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="닥스훈트" checked> 닥스훈트 </label> 
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="몰티즈"> 몰티즈</label>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="미니어처핀셔"> 미니어처 핀셔	</label>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="보스턴테리어"> 보스턴테리어</label>
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="비숑프리제"> 비숑프리제</label> 
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="시바이누"> 시바 이누</label> 
			<label class="radio-inline"> <input type="radio" name="kind" id="kind" value="진돗개"> 진돗개</label>
			<br>
			<label class="radio-inline">  <input type="radio" name="kind" id="kind" value=""> 그외  <input type="text"  name="kind" id="kind" ></label>
			<!-- 그외를 입력값으로 받는 radio 속성에도 name을 동일하게 줘야 라디오버튼 1개만 선택이 가능하다.-->
			<!-- value="" 값이 없더라도 입력을 해야 on 이라는 기본값이  DB에 들어가지 않는다. 그러나 여전히 ,는 남는다. -->
		</div>
	</div>
</div>
<br>
<br>

<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 성별을 선택하세요</div>
			<div class="card-body radio">
				<label> <input type="radio" name="sex" id="sex1" value="남(수컷)" checked> 남(수컷)
				</label>
			</div>

			<div class="card-body radio">
				<label> <input type="radio" name="sex" id="sex2" value="여(암컷)"> 여(암컷)
				</label>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 나이를 선택하세요</div>
			<select name="age" class="form-control">
				<option value="1개월미만">1개월 미만</option>
				<option value="2개월미만">2개월 미만</option>
				<option value="3개월미만">3개월 미만</option>
				<option value="4개월">4개월</option>
				<option value="5개월">5개월</option>
				<option value="6개월">6개월</option>
				<option value="7개월">7개월</option>
				<option value="8개월">8개월</option>
				<option value="9개월">9개월</option>
				<option value="10개월">10개월</option>
				<option value="11개월">11개월</option>
				<option value="12개월">12개월</option>
				<option value="1살">1살</option>
				<option value="2살">2살</option>
				<option value="3살">3살</option>
				<option value="4살">4살</option>
				<option value="5살">5살</option>
				<option value="6살">6살</option>
				<option value="7살">7살</option>
				<option value="8살">8살</option>
				<option value="9살">9살</option>
				<option value="10살">10살</option>
				<option value="11살">11살</option>
				<option value="12살">12살</option>
				<option value="13살">13살</option>
				<option value="14살">14살</option>
			</select>
		</div>
	</div>
</div>
<br> 
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 사진을 올려주세요</div>
			<div class="form-group">
				<label><input type="file" name="uploadfileName"> </label> 
			</div>
		</div>
	</div>
</div>

<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 특징을 한줄로 요약해주세요</div>
			<input type="text" name="simple" class="form-control" placeholder="한줄로 요약해주세요">
		</div>
	</div>
</div>

<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 특징을 적어주세요</div>
			<textarea class="form-control" name="feature" rows="7"></textarea>
		</div>
	</div>
</div>
		
<br>
<br>

<div class="container">
	<div class="row">
		<!-- Blog entries-->
		<div class="col-lg-8">
			<div class="card-header">강아지 건강상태를 선택해주세요(중복선택가능)</div>
			<div class="card-body">
				<div>
					<label> <input type="checkbox" value="종합백신" name="health">종합백신</label> 
					<label> <input type="checkbox" value="켄넬코프" name="health"> 켄넬코프</label>
					<label> <input type="checkbox" value="인플루엔자" name="health"> 인플루엔자</label>
					<label> <input type="checkbox" value="광견병"    name="health">광견병 </label> 
					<label> <input type="checkbox" value="외부기생충" name="health"> 외부기생충</label>
					<label> <input type="checkbox" value="코로나장염" name="health"> 코로나장염 </label>
					<br>
					<label> 그외  <input type="text" name="health"></label>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<br>

<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<div class="card-header">강아지 분양가격을 입력하세요 (숫자만 입력해주세요) 단위:원</div>
			<input type="text" name="price" class="form-control" placeholder="분양가격을 입력해주세요 (단위:원)" required> 
		</div>
	</div>
</div>

<br>
<br>
<br>
<br>

<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<button type="submit" class="btn btn-warning" onclick="return Submit()">위 내용으로 분양 강아지를 등록합니다</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-outline-primary">다시작성</button>
			<!-- <button type="button" id="regBtn" class="btn btn-success">목록으로</button> -->
			<button type="button" id="regBtn" class="btn btn-outline-success" onclick="location.href='/doglist'">목록으로</button>
		</div>
	</div>
</div>
</form>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>