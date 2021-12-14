<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link  href="/resources/join/joinForm.css" rel="stylesheet">
<!-- jQuery -->
<script src="/resources/join/jquery.min.js"></script>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>
</head>
<!-- 
이름		userName	
연락처	number1,number2,number3
아이디	userId
비밀번호	userPw
이메일	userEmail
성별		userGender
주소		userAddress1,userAddress2
 -->
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form id="joinForm" class="validation-form" novalidate action="/user/join" method="post">
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>  
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <!-- security에서 userid는 해당유저의 이름 즉 username -->
              <input type="text" class="form-control" id="userName" name="userName" placeholder="" required>
              <div class="invalid-feedback">
               	 이름을 입력해주세요.
              </div>
            </div>
            <div class="col-md-2 mb-3">
              <label for="nickname">연락처</label>
              <select class="custom-select" id="number1" name="number1">
                <option selected="selected">010</option>
                  <option>016</option>
                  <option>011</option>
              </select>
            </div>
            <div class="col-md-2 mb-3">
              <label for="nickname">&nbsp;</label>
              <input type="text" class="form-control" id="number2" name="number2" value="" placeholder="" required>
            </div>
            <div class="col-md-2 mb-3">
              <label for="nickname">&nbsp;</label>
              <input type="text" class="form-control" id="number3" name="number3" value="" placeholder="" required>
            </div>
            <div class="invalid-feedback">
           		   연락처를 입력해주세요.
            </div>
          </div>
          <div class="row">
          <div class="col-md-6 mb-3">
            <label for="name">아이디</label>
            <button type="button" class="id_overlap_button" onclick="id_overlap_check()">중복체크</button>
            <!-- Security에서 유저아이디(userid)는 해당유저의 유저네임(username)에 속한다. -->
			<input type="text" class="form-control username_input"
				id="name" name="userId" placeholder="" required>
             <div class="invalid-feedback">
				아이디를 입력해주세요.
           	 </div>
		  </div>
		<!-- 	<div class="col-md-2 mb-3">
            	<input type="text" class="username_input" name="username" check_result="fail" required />
				<img id="id_check_sucess" style="display: none;">
			</div> -->
            <div class="col-md-6 mb-3">
              <label for="name">비밀번호</label>
              <input type="password" class="form-control" id="userPw" name="userPw" placeholder="" required>
              <div class="invalid-feedback">
         		       비밀번호를 입력해주세요.
              </div>
            </div>
          </div>
          <div class="row">
	          <div class="mb-2">
       	     	<label>
            		&nbsp&nbsp&nbsp&nbsp<input type="radio" id="userGender" name="userGender" autocomplete="off" value="man"  checked="checked">남성
       	     	</label>
       	     	<label>
            		<input type="radio" id="userGender" name="userGender" autocomplete="off" value="woman" >여성
       	     	</label>
           	 	<div class="invalid-feedback">
              		성별을 선택해주세요.
            	</div>
			</div>
          </div>
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="userAddress1" name="userAddress1" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="address">상세주소</label>
            <input type="text" class="form-control" id="userAddress2" name="userAddress2" placeholder="상세주소를 입력해주세요." required>
            <div class="invalid-feedback">
              상세주소를 입력해주세요.
            </div>
          </div>

<!--           <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="" name="userAddress1" placeholder="상세주소를 입력해주세요.">
          </div> -->
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" name="enabled" value="1" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>          
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" id="operForm" type="submit">가입하기</button>
          
          
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy;할수있으면 아이디찾기 비밀번호변경</p>
    </footer>
  </div>
<!--   <script>
  
var operForm = $("#joinForm");
  
window.addEventListener('load', () => {
	
	const forms = document.getElementsByClassName('validation-form');
	
	Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function (e) {
			if (form.checkValidity() === false) {
				console.log("1차진입");
				e.preventDefault();
				e.stopPropagation();
			}else{
				console.log("2차진입");
				e.preventDefault();
			 	/* var operForm = $("#joinForm"); */
			 	$("#operForm").on("click", function(e){
					operForm.attr("action","/join").submit();
			 	})
//				$("button[data-oper='gohome']").on("click",function(e){
//				operForm.attr("action","/join").submit();
//				});
			}
			form.classList.add('was-validated');
		}, false);
		
	});
	
}, false);


/* $("#operForm").on("click", function(e){
	operForm.attr("action","/join").submit();
}); */
	
  </script> -->
  
  
  
  <script>
  
  var operForm = $("#joinForm");
  

window.addEventListener('load', () => {
	
	const forms = document.getElementsByClassName('validation-form');
	
	Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function (e) {
			if (form.checkValidity() === false) {
				console.log("1차진입");
				e.preventDefault();
				e.stopPropagation();
				
			}
			if (form.checkValidity() === true) {
				console.log("2차진입");
				e.preventDefault();
				var operForm = $("#joinForm");
				
				operForm.attr("action","/user/join").submit();
//				$("button[data-oper='gohome']").on("click",function(e){
//				operForm.attr("action","/join").submit();
//				});
			}
			form.classList.add('was-validated');
		}, false);
		
	});
	
}, false);


	
/* $("#operForm").on("click", function(e){
	operForm.attr("action","/user/join").submit();
}); */
	
  </script>
</body>

</html>