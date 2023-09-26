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
<c:forEach items="${list4}" var="ff">
<form action="sangmodify2" method="post" enctype="multipart/form-data">
<table border="1" width="300px" align="center">
<caption><h2>회원 정보 수정</h2></caption>
  <tr>
      <th>상품번호</th>
      <td>
      <input type="number" name="spnum" value="${ff.spnum}" readonly="readonly">
      </td>
    </tr>
    <tr>
      <th>상품명</th>
      <td><input type="text" name="spname" value="${ff.spname}"></td>
    </tr>
    <tr>
      <th>상호명</th>
      <td><input type="text" name="sangho" value="${ff.sangho}"></td>
    </tr>
    <tr>
      <th>판매일자</th>
      <td><input type="date" name="spdate" value="${ff.spdate}"></td>
    </tr>
    <tr>
      <th>상품특징</th>
      <td>
      <textarea rows="5" cols="30" name="scontent" value="${ff.scontent}"></textarea>
      </td>
    </tr>
    <tr>
      <th>가격</th>
      <td><input type="number" name="sprice" value="${ff.sprice}"></td>
    </tr>
    <tr>
      <th>상품이미지</th>
      <td><input type="file" name="spimage" value="${ff.spimage}"></td>
    </tr>
  <tr>
    <td colspan="2">
    <input type="submit" value="수정">
    </td>
  </tr>
  <a href="main">메인으로</a>
</table>
</form>
</c:forEach>
</body>
</html>