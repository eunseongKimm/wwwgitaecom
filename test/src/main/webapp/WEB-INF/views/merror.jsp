<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var yn = confirm("로그인후 사용하세요");
if(yn==true)
	{
	window.location="logingo";
	}
else
	{
	window.location="main";
	}
</script>
</body>
</html>