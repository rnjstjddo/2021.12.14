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
			<h2 class="panel-title">
				<i class="fas fa-comments"></i>커뮤니티 - 게시글 수정
			</h2>
		</div>

		<div class="panel-body">

		<form id="modifyForm" action="/board/community/modify" method="post" class="needs-validation"  novalidate>
		<sec:authentication property="principal" var="pinfo"/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<div class="row">
				<div class="col-md-10 mb-3">
					<label class="form-label" for="valid01">제목</label>
					<input type="text" class="form-control" name="title" id="valid01" required value='<c:out value="${board.title}"/>' >
					<div class="invalid-feedback">제목을 입력하세요</div>
				</div>
				
				<div class="col-md-2 mb-3">
					<label class="form-label">번호</label> 
					<input type="text" class="form-control" name="bno" readonly value='<c:out value="${board.bno}"/>' >
				</div>
			</div>

			<div class="row">
				<div class="mb-3 col">
					<label class="form-label ">작성일</label> 
					<input type="text" class="form-control" name="regDate" readonly 
							value='<fmt:formatDate pattern="yyyy-MM-dd  HH시 mm분 ss초"
							value="${board.regdate }" />'>
				</div>
				<div class="mb-3 col">
					<label class="form-label ">수정일</label> 
					<input type="text"class="form-control" name="updateDate" readonly
							value='<fmt:formatDate pattern="yyyy-MM-dd  HH시 mm분 ss초"
							value="${board.updatedate }" />'>
				</div>
			</div>

			<div class="mb-3">
				<label class="form-label" >작성자</label> 
				<input type="text" class="form-control" name="writer" readonly
					value='<c:out value="${board.writer}"/>'>
			</div>

			<div class="mb-3">
				<label class="form-label" for="valid02">내용</label>
				<textarea class="form-control" rows="12" name='content'  id="valid02" required><c:out value="${board.content}" /></textarea>
				<div class="invalid-feedback">내용을 입력하세요</div>
			</div>
			
			
			
			<!-- 첨부파일 -->
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header with-border ">
						<h5 class="card-title" style="margin-top:10px; margin-bottom:10px;">
							<i class="fas fa-folder-open"></i>&nbsp;첨부파일
						</h5>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="uploadResult" id="uploadResult">
								<ul>
								</ul>
							</div>
							
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple>
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
					<button type="button" class="btn btn-outline-primary btn_list" data-oper="list">목록</button>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq board.writer }">
							<button type="submit" class="btn btn-outline-primary btn_modify" data-oper="modify">수정</button>
							<button type="button" class="btn btn-outline-danger btn_remove" data-oper="remove">삭제</button>
						</c:if>
					</sec:authorize>
				</div>
			</div>
		</form>
			
			

		</div>
	</div>
</div>


<script type="text/javascript">
$(document).ready(function(){
	
	var modifyForm = $("#modifyForm");
	
	$("button").on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === "list"){
			modifyForm.empty()
			modifyForm.append("<input type='hidden' name='type' value='community'>");
			modifyForm.attr("action", "/board/community/list").attr("method", "get");
			modifyForm.submit();

		}
		else if(operation === "remove"){
			var del = confirm("정말 삭제하시겠습니까?")
			if(del == true){
				modifyForm.append("<input type='hidden' name='type' value='community'>");
				modifyForm.attr("action", "/board/community/remove").submit();
			}
		}
		else if(operation === "modify"){
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				
				var jobj = $(obj);
				console.dir(jobj);
			    console.log(jobj.data("filename"));
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				
			});

			modifyForm.append(str).submit();
		}
		
		
	});
	
	
	
	// 부트스트랩 유효성검사 시작
	(function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
	// 부트스트랩 유효성검사 종료

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
					str += "<img src='/display?fileName="+fileCallPath+"'></a>";
					str += "<span>"+attach.fileName+"</span><button type='button' class='btn btn-outline-warning btn-circle'>삭제</button><br/>";
					str += "</div></li>";
				}
				else{
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"' data-type='"+attach.fileType+"'>"
					str += "<div>";
					str += "<img src='/resources/img/attach.png'>";
					str += "<span>"+attach.fileName+"</span><button type='button' class='btn btn-outline-warning btn-circle'>삭제</button>";
					str += "</div></li>";
				}
			});
			
			uploadResult.html(str);
			
		});
	})();
	
	$(".uploadResult").on("click", "button", function(e){
		if(confirm("첨부파일을 삭제하시겠습니까?")){
			var targetli = $(this).closest("li");
			targetli.remove();
		}
	});
	
	
	
	
	
	var reg = new RegExp("(.*?)\.(exe|sh|zip|alz)");
	var maxSize = 5242880;
	
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		for (var i=0; i < files.length; i++){
			
			if(!checkFile(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : "/uploadAjaxAction",
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType : 'json',
			success : function(result){
				console.log("RESULT : " + result);
				showUploadFile(result);
				alert("업로드 성공");
			}
		});
		
	});
	
	function checkFile(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일사이즈 초과! 최대용량은 5MB로 설정되어있습니다.");
			return false;
		}
		
		if(reg.test(fileName)){
			alert("해당 확장자의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	function showUploadFile(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		
		var uploadResult = $(".uploadResult ul");
		var str="";
		
		$(uploadResultArr).each(function(i, obj){
			
			if(obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid.substring(0, 6) + "_" + obj.fileName);
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid.substring(0, 6)+"' data-fileName='"+obj.fileName+"' data-type='"+obj.image+"'><div>"+
						  	"<img src='/display?fileName="+fileCallPath+"'>"+
						  	"<p>"+obj.fileName+"<button type='button' class='btn btn-outline-warning btn-circle' data-file=\'"+fileCallPath+"\' data-type='image'>삭제</button></p>"+
						  	"</div></li><br>";
				
			}
			else{
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid.substring(0, 6) + "_" + obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid.substring(0, 6)+"' data-fileName='"+obj.fileName+"' data-type='"+obj.image+"'><div>"+
						  	"<img src='/resources/img/attach.png'></a>"+
						  	"<p>"+obj.fileName+"<button type='button' class='btn btn-outline-warning btn-circle' data-file=\'"+fileCallPath+"\' data-type='image'>삭제</button></p>"+
						  	"</div></li><br>";
			  	
			}
			
		});
		
		uploadResult.append(str);
	}
	
	
	

});
</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
