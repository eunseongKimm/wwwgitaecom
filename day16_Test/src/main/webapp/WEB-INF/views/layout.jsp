<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Single+Day&display=swap" rel="stylesheet">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">

container 
{
	border: 1px slid #bcbcbc;
}
header 
{
	text-align: center;
	width: 100%;
	font-family: 'Single Day', cursive;
}
nav 
{
	width: 100%;
	font-family: 'Single Day', cursive;
}

body 
{
	top: 80px;
	text-align: center;
	width: 100%;
	font-family: 'Single Day', cursive;
}
footer 
{
	position:fixed;
	bottom:0px;
	width: 100%;
	text-align: center;
	font-size: 20px;
	line-height: 30px;
	height: 30px;
	background-color: #000000;
	color:white;
	font-family: 'Single Day', cursive;
}

table 
{
    width: 60%;
    border-collapse: collapse;
    margin-bottom: 20px;
}
caption
{
	font-family: 'Single Day', cursive;
}
th, td 
{
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-family: 'Single Day', cursive;
}
th 
{
    background-color: #f2f2f2;
}
tr:hover 
{
    background-color: #f5f5f5;
}
</style>
<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
</head>
<body>
	<div id="container">
		<div id="top">
			<t:insertAttribute name="top"/>
		</div>
		<div id="body">
			<t:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<t:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>