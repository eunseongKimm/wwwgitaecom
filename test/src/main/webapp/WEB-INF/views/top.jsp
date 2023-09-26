<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>

<header>
<header style="text-align: center;">
	<h1>정보관리 프로그램</h1>
</header>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="min">회원가입</a></li>
          <li><a href="mout">회원출력</a></li>
          <li><a href="modi">회원수정</a></li>
          <li><a href="ser">회원검색</a></li>
          <li><a href="mnotice">게시판출력</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">상품관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="sin">상품입력</a></li>
          <li><a href="sout">상품출력</a></li>
        </ul>
      </li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
    <c:choose>
    <c:when test="${loginstate==true}">
    <li><a href="#"><span class="glyphicon glyphicon-user"></span>${member.id}님 반갑습니다</a></li>
    <li><a href="logoutgo"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
    </c:when>
    <c:otherwise>
      <li><a href="min"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      <li><a href="logingo"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
      </ul>
      </c:otherwise>
      </c:choose>
  </div>
</nav>

</html>