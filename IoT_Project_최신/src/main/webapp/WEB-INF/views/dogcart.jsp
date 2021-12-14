<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<%@ include file="/WEB-INF/views/include/header2.jsp"%>

<script>
	function del(dno) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?dno='+dno;
		}
		
	}	

	function selectAll(selectAll)  {
		  const checkboxes = document.getElementsByName('dog');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  });
		};
</script>


<!-- <script>
	//메시지 안띄워진다
	var message ='${cartmessage}';
	//var message ='<c:out value="${cartmessage}"/>';
	alert(message);
	document.location.href='/doglist';
</script> -->

<h1 class="tit-cart" style="margin: 40px 0px 0px;  padding: 30px 0px; text-align: center; font-size: 30px; line-height: 1.25; color: rgb(31, 31, 31); font-family: Cardo, serif; background-image: url(&quot;bul01.gif&quot;); background-position: 0px 1px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial;">장바구니 담긴 상품</h1>
<div class="table-cart table-fill-prd" style="margin-top: 0px; text-align: center; margin-bottom: 20px;  color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif, &quot;Nanum Gothic&quot;, nanumgothic, AppleGothic, Helvetica, sans-serif; font-size: 12px;">
    

    <center><table class="__se_tbl_ext" summary="번호, 사진, 상품명, 수량, 적립, 가격, 배송비, 취소" style="line-height: 1.25; width: 1000px; border-collapse: collapse; border-spacing: 0px; table-layout: fixed; overflow-wrap: break-word; word-break: keep-all;">
	</center>
        <thead>
            <tr>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;"><input type="checkbox" onclick='selectAll(this)' name="dog" class="MS_input_checkbox" checked="" style="margin: 0px; padding: 0px; font-size: 12px; line-height: 1.25; color: rgb(68, 68, 68); font-family: 'Open Sans', sans-serif, 'Nanum Gothic', nanumgothic, AppleGothic, Helvetica, sans-serif; vertical-align: middle;"></div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">이미지</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">상품명</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;"></div>
                </th>

                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">적립</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">가격</div>
                </th>
                
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">취소</div>
                </th>
            </tr>
        </thead>
        
        
        
        <tbody>
		   <c:forEach items="${dog2List}" var="dog2List">
	            <tr style="border-bottom: 1px solid rgb(227, 227, 227);">
	            	<td scope="col" style="margin: 0px; padding: 7px 0px 6px; background-image: none; font-weight: normal; font-size: 18px;">
	                    <div class="tb-center" style="padding: 0px 10px;"><input type="checkbox" name="dog" class="MS_input_checkbox" checked="" style="margin: 0px; padding: 0px; font-size: 12px; line-height: 1.25; color: rgb(68, 68, 68); font-family: 'Open Sans', sans-serif, 'Nanum Gothic', nanumgothic, AppleGothic, Helvetica, sans-serif; vertical-align: middle;"></div>
	                </td>
	            	<td id="filename" name="filename" background-image: none;><img src="/resources/img/dog/<c:out value="${dog2List.filename}"/>" width="100px" height="80px"/></td>
	            	<td id="name" name="name" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${dog2List.name}"/></td>
	            	<td scope="col" style="margin: 0px; padding: 7px 0px 6px; background-image: none; font-weight: normal; font-size: 18px;">
	                    <div class="tb-center" style="padding: 0px 10px;"></div>
	                </td>
	                
	                
	                <c:set var="bonus" value="${dog2List.price/100 }" />
	                <fmt:parseNumber var="i" type="number" value="${bonus}" />

	            	<td style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;">
	            		<c:out value="${i}"/> 원</td>
	            	
	            	
	            	<td id="price" name="price" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${dog2List.price}"/> 원</td>
	            	<td style="margin: 0px; padding: 18px 0px; font-size: 18px; border-top: 1px solid rgb(227, 227, 227); background-image: none;">
	                    <input type="button" value="삭제" onclick="del(${dog2List.dno})">
	                </td>
	            </tr>
          	  </c:forEach>
        </tbody>
    </table>

    
    <br><br>
   	<table>
   	
	<c:set var = "total" value = "0" />
	<c:forEach var="dog2List" items="${dog2List}" varStatus="status">     
		<tr>
			<c:set var= "total" value="${total + dog2List.price}"/></c:forEach>
			
			<c:if test="${total != 0 }">
			<td style="font-size: 25px; color: red;">총 가격 : <c:out value="${total}"/> 원</td>
    		</c:if>
       </tr>
       
		 <c:if test="${total == 0 }">
	      	<tr>
	      		<td style="padding: 22px 0px; font-size: 22px;">장바구니가 비었습니다.</td>
	      	</tr>
      	</c:if>
  
    </table>
</div>

<center>

<c:if test="${total != 0 }">
<button type="button" onClick="location.href='dogorder.html'" name="submit" style="color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.3px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(242, 244, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none; font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: -0.3px; text-align: center; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding: 12px 0px; font-size: 18px; background: rgb(243, 80, 78); display: inline-block; font-weight: bold; border: 1px solid rgb(211, 50, 48); width: 200px; cursor: pointer; color: rgb(255, 255, 255) !important;">
결제하기</button>
</c:if>
<c:if test="${total == 0 }">
<button type="button" onClick="location.href='doglist.html'" name="submit" style="color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.3px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(242, 244, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none; font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: -0.3px; text-align: center; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding: 12px 0px; font-size: 18px; background: rgb(243, 80, 78); display: inline-block; font-weight: bold; border: 1px solid rgb(211, 50, 48); width: 200px; cursor: pointer; color: rgb(255, 255, 255) !important;">
구경하러 가기</button>
</c:if>

</center><br>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>