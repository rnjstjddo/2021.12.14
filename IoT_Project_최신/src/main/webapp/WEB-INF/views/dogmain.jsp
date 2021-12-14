<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<%@ include file="/WEB-INF/views/include/header.jsp" %>


<!-- ================================================================== -->
<div style="margin:0 auto; text-align: center;">
	<div><h2 style="padding: 30px;">상품 목록</h2></div>
	<div style="width: 1300px; display: inline-block; border: 1px solid red;">
	
	<c:forEach items="${dog1List}" var="dog1List">
		<div style="border: 1px solid blue; float: left; width: 260px; margin: 30px;">
			<div><img src="/resources/img/dog/<c:out value="${dog1List.fileName}"/>" style="width: 160px; height: 100px;"></div>
			<div><c:out value="${dog1List.name}"/></div>
			<div><c:out value="${dog1List.price}"/></div>
			<br>
			<button type="button" onclick="location.href='/dogdetail?dno=${dog1List.dno}'">상세보기</button>
		</div>
		 
	</c:forEach>
	</div>
</div>
<!-- ================================================================== -->
       
    
<script>
$(document).ready(function(){ 
	$("#submit").click(function(){
			
			main.submit();
		 
	});
});

/* 
	$.ajax({
 	url : '/main2',
	processData : false,
	contentType : false,
	data : formData,
	type : 'POST',
	dataType : 'json',
	
}); 
*/
</script>
     

<%@ include file="/WEB-INF/views/include/footer.jsp"%>