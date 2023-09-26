<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="sangmodify1" method="post">
	<table border="1" width="300px" align="center">
	<caption>회원수정화면</caption>
		<tr>
			<th>수정할 상품번호</th>
			<td><input type="number" name="spnum"> </td>
		</tr>	
		<tr>
			<td colspan="2">
				<input type="submit" value="전송"> 
				<input type="reset" value="취소">	
			</td>
		</tr>
	</table>
</form>
</body>
</html>