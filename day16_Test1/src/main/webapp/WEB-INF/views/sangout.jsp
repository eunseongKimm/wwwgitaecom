<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th,td
{
text-align: center;
}
#img1:hover
{
transform: scale(1.5);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption><h2>상품정보 출력</h2></caption>
	<tr>
	  <th>상품번호</th>
	  <th>상품명</th><th>판매일자</th>
	  <th>가격</th><th>상품이미지</th>
	  <th>조회수</th>
	</tr>
	<c:forEach items="${list}" var="aa">
	<tr>
	<td><a href="sangdelete?spnum=${aa.spnum}">${aa.spnum}</a></td>
	<td><a href="sangdetail?spnum=${aa.spnum}">${aa.spname}</a></td>
	<td>${aa.spdate}</td>
	<td>
	<fmt:formatNumber value="${aa.sprice}" pattern="#,##0"></fmt:formatNumber>원
	</td>
	<td><img id="img1" src="image/${aa.spimage}" width="100px" height="100px"></td>
	<td>${aa.cnt}</td>
	</tr>
	</c:forEach>
</table>
<a href="main">메인으로</a>

<!-- 페이징 처리 -->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="5" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="sangnotice?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
      
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="sangnotice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="sangnotice?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">▶</a>
   </c:if>
   
   </td>
</tr>
</body>
</html>