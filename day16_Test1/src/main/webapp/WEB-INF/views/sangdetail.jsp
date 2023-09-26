<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="400px" align="center">
<caption><h2>디테일 부분</h2></caption>
  <tr>
    <th>상품명</th>
    <th>상호명</th>
    <th>상품특징</th>
    <th>상품이미지</th>
  </tr>
  <c:forEach items="${list1}" var="bb">
    <tr>
    <td>${bb.spname}</td>
    <td>${bb.sangho}</td>
    <td><textarea rows="8" cols="50">${bb.scontent}</textarea></td>
    <td><img src="image/${bb.spimage}" width="100px" height="100px"></td>
    </tr>
  </c:forEach>
</table>
<a href="main">메인</a>//
<a href="sangoutgo">결과창</a>
</body>
</html>