<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption><h2>상품별 매출액</h2></caption>
	<tr>
	  <th>상품명</th>
	  <th>매출액 합계</th>
	  <th>수량</th>
	</tr>
	<c:forEach items="${list2}" var="cc">
	<tr>
	<td>${cc.spname}</td>
	<td>
	<fmt:formatNumber value="${cc.mae}" pattern="#,##0"></fmt:formatNumber>원
	</td>
	<td>${cc.su}개</td>
	</tr>
	</c:forEach>
</table>
<a href="main">메인으로</a>
</body>
</html>