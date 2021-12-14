<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="/WEB-INF/views/include/header2.jsp"  %>




	<div class="row">

	<%@ include file="/WEB-INF/views/include/leftSidebar.jsp"  %>	

		<div class="col-md-8">
			<div class="panel-heading">
				<h2 class="panel-title" style="text-align:center; margin-bottom:30px; font-family:'Jua'; font-size:3.0em;">
					<i class="fas fa-comments"></i>질문답변 - 게시글 등록
				</h2>
			</div>
			
			<div class="panel-body">
				<form action="/board/qna/register" method="post" class="needs-validation" novalidate>	
					<div class="mb-3">
  						<label class="form-label" for="valid01">제목</label>
  						<input type="text" class="form-control" name="title" id="valid01" required>
  						<div class="invalid-feedback">제목을 입력하세요</div>
					</div>
					
					<div class="mb-3">
  						<label class="form-label" for="valid03">작성자</label>
  						<input type="text" class="form-control" name="writer" id="valid02" required>
  						<!-- 로그인 연동하면 readonly, value='<c:out value="${board.writer}"/>' -->
						<div class="invalid-feedback">작성자를 입력하세요</div>
					</div>
					
					<div class="mb-3">
  						<label class="form-label" for="valid02">내용</label>
  						<textarea class="form-control" rows="12" name='content' id="valid02" required></textarea>
						<div class="invalid-feedback">내용을 입력하세요</div>
					</div>

					<input type="hidden" name="type" value="qna">
					
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

					<div class="row" style="margin-top:10px; margin-bottom:10px;">
						<div class="col" align="right">
							<button type="submit" class="btn btn-outline-primary btn_register" ><i class="fas fa-edit"></i>등록</button>
							<button type="button" class="btn btn-outline-danger btn_cancel"><i class="fas fa-times"></i>취소</button>
						</div>
					</div>
			</form>

			</div>
		</div>
	</div>



<script type="text/javascript">
$(document).ready(function(){
	
	
	$(".btn_cancel").on("click", function(){
		self.location = "/board/qna/list?type=qna";
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

	var formObj = $("form");
	
	$(".btn_register").on("click", function(e){
		e.preventDefault();
		
		var str = "";
		
		if($("#valid01").val() == ""){
			alert("제목을 입력하세요");
			return;
		}
		if($("#valid02").val() == ""){
			alert("작성자를 입력하세요");
			return;
		}
		if($("#valid03").val() == ""){
			alert("내용을 입력하세요");
			return;
		}
		
		$(".uploadResult ul li").each(function(i, obj){
			
			var jobj = $(obj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			
		});
		
		formObj.append(str).submit();
	});
	
	
	var reg = new RegExp("(.*?)\.(exe|sh|zip|alz|dll|apk)");
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
						  	"</div></li>";
				
			}
			else{
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid.substring(0, 6) + "_" + obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid.substring(0, 6)+"' data-fileName='"+obj.fileName+"' data-type='"+obj.image+"'><div>"+
						  	"<img src='/resources/img/attach.png'></a>"+
						  	"<p>"+obj.fileName+"<button type='button' class='btn btn-outline-warning btn-circle' data-file=\'"+fileCallPath+"\' data-type='image'>삭제</button></p>"+
						  	"</div></li>";
			  	
			}
			
		});
		
		uploadResult.append(str);
	}
	
	
	$(".uploadResult").on("click", "button", function(e){
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		var targetli = $(this).closest("li");
		
		$.ajax({
			url : '/deleteFile',
			data : {fileName : targetFile, type : type},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				alert(result);
				targetli.remove();
			}
		});
	});
	
	
});
</script>


<%@ include file="/WEB-INF/views/include/footer.jsp"  %>