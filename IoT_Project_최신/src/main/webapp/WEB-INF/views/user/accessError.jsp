<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>Access Denied Page</h1>

<h2>${SPRING_SECURITY_403_EXCEPTION.getMessage() }</h2>
<h2>${msg }</h2>

<p>principal: <sec:authentication property="principal"/></p>
<p>MemberVO: <sec:authentication property="principal.member"/></p>
<p>사용자이름: <sec:authentication property="principal.member.userName"/></p>
<p>사용자아이디: <sec:authentication property="principal.username"/></p>
<p>사용자 권한 리스트: <sec:authentication property="principal.member.authList"/></p>


</body>
</html>
