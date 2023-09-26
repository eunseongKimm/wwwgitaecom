<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="search2" method="post">
<table border="1" width="300px" align="center">
<tr>
<td>
<select name="item">
<option value="id">아이디</option>
<option value="mname">이름</option>
<option value="home">거주지</option>
</select>
</td>
<td><input type="text" name="value"></td>
</tr>
<tr>
<td colspan="2" style="text-align:center;">
<input type="submit" value="검색">
<input type="reset" value="취소"></td>
</tr>


</table>
</form>
</body>
</html>