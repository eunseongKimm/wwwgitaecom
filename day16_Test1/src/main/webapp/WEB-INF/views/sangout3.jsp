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
<caption><h2>날짜별 매출액</h2></caption>
	<tr>
	  <th>날짜</th>
	  <th>매출액 합계</th>
	  <th>수량</th>
	</tr>
	<c:forEach items="${list3}" var="dd">
	<tr>
	<td>${(dd.spdate).substring(0,10)}</td>
	<td>
	<fmt:formatNumber value="${dd.mae}" pattern="#,##0"></fmt:formatNumber>원
	</td>
	<td>${dd.su}개</td>
	</tr>
	</c:forEach>
</table>
<a href="main">메인으로</a>
</body>
</html>