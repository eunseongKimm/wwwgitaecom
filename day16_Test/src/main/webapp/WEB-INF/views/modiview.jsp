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
<c:forEach items="${list}" var="aa">
<form action="modify" method="post">
<table border="1" width="300px" align="center">
<caption>수정정보입력</caption>
<tr>
<th>아이디</th>
<td><input type="text" name="id" value="${aa.id}" readonly="readonly"></td>
</tr>
<tr>
<th>이름</th>
<td><input type="text" name="mname" value="${aa.mname}"></td>
</tr>
<tr>
<th>전화</th>
<td><input type="text" name="tel" value="${aa.tel}"></td>
</tr>
<tr>
<th>성별</th>
<td><input type="text" name="sb" value="${aa.sb}"></td>
</tr>
<tr>
<th>거주지</th>
<td><input type="text" name="home" value="${aa.home}"></td>
</tr>
<tr>
<th>인사말</th>
<td>
<textarea rows="5" cols="30" name="content" value="${aa.content}"></textarea>
</td>
</tr>
<tr>
<td colspan="2" style="text-align:center">
<input type="submit" value="전송"></td>
</tr>
</table>
</form>
</c:forEach>
<a href="main">메인으로</a>
</body>
</html>