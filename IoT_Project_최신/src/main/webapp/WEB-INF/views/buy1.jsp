<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
	function del(bno) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?bno='+bno;
		}
		
	}	

	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('dog');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		};
</script>



<h3 class="tit-cart" style="margin: 40px 0px 0px;  padding: 0px 0px 0px 18px; text-align: center; font-size: 22px; line-height: 1.25; color: rgb(31, 31, 31); font-family: Cardo, serif; background-image: url(&quot;bul01.gif&quot;); background-position: 0px 1px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial;">장바구니 담긴 상품</h3>
<div class="table-cart table-fill-prd" style="margin-top: 10px; text-align: center; margin-bottom: 70px;  color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif, &quot;Nanum Gothic&quot;, nanumgothic, AppleGothic, Helvetica, sans-serif; font-size: 12px;">
    

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
        <c:choose>
        	<c:when test="${list!=null}">
			   <c:forEach items="${list}" var="getList">
	            <tr style="border-bottom: 1px solid rgb(227, 227, 227);">
	            	<td scope="col" style="margin: 0px; padding: 7px 0px 6px; background-image: none; font-weight: normal; font-size: 18px;">
	                    <div class="tb-center" style="padding: 0px 10px;"><input type="checkbox" name="dog" class="MS_input_checkbox" checked="" style="margin: 0px; padding: 0px; font-size: 12px; line-height: 1.25; color: rgb(68, 68, 68); font-family: 'Open Sans', sans-serif, 'Nanum Gothic', nanumgothic, AppleGothic, Helvetica, sans-serif; vertical-align: middle;"></div>
	                </td>
	            	<td id="b_Image" name="b_Image" background-image: none;><img src="/img/<c:out value="${getList.b_Image}"/>" width="100px" height="80px"/></td>
	            	<td id="b_Name" name="b_Name" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList.b_Name}"/></td>
	            	<td scope="col" style="margin: 0px; padding: 7px 0px 6px; background-image: none; font-weight: normal; font-size: 18px;">
	                    <div class="tb-center" style="padding: 0px 10px;"></div>
	                </td>
	            	<td id="b_Bonus" name="b_Bonus" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList.b_Bonus}"/></td>
	            	<td id="b_Price" name="b_Price" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList.b_Price}"/></td>
	            	
	                <td style="margin: 0px; padding: 18px 0px; font-size: 18px; border-top: 1px solid rgb(227, 227, 227); background-image: none;">
	                    <input type="button" value="삭제" onclick="del(${getList.bno})">
	                </td>
	            </tr>
            </c:forEach>
            </c:when>
            
            
            <c:otherwise>
            <tr>
            	<td colspan="7"><h4 align="center">장바구니가 비어있습니다.</h4></td>
            </tr>
            </c:otherwise>
            
            </c:choose>

            
        </tbody>
        
       
    </table>

    
    
   	<table>
	<c:set var = "total" value = "0" />
	<c:forEach var="getList" items="${list}" varStatus="status">     
		<tr>
			<c:set var= "total" value="${total + getList.b_Price}"/></c:forEach>
			<td style="font-size: 25px; color: red;">총 가격 : <c:out value="${total}"/> 원</td>
          </tr>
    </table>
       
</div>

<center><button type="submit" onClick="location.href='buy2.html'" style="color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.3px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(242, 244, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none; font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: -0.3px; text-align: center; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding: 12px 0px; font-size: 18px; background: rgb(243, 80, 78); display: inline-block; font-weight: bold; border: 1px solid rgb(211, 50, 48); width: 200px; cursor: pointer; color: rgb(255, 255, 255) !important;">

	결제하기</button></center><br>

<p><br></p>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>