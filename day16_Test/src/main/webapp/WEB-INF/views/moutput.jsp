<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption>회원출력</caption>
<tr>
<th>아이디</th><th>이름</th><th>전화번호</th>
<th>성별</th><th>거주지</th><th>비고</th>
</tr>
<c:forEach items="${list}" var="aa">
<tr>
<td><a href="deleteb?id=${aa.id}">${aa.id}</a></td>
<td>${aa.mname}</td>
<td>${aa.tel}</td>
<td>${aa.sb}</td>
<td>${aa.home}</td>
<td><a href="modi?id=${aa.id}">수정</a></td>
</tr>
</c:forEach>
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="6" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="mnotice?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
      
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="mnotice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="mnotice?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">▶</a>
   </c:if>
   
   </td>
</tr>
</table>
</body>
</html>