<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Course Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="text/x-icon" href="client/assets/images/logo.png">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<tilesx:useAttribute id="defaultCss" name="default-css"
	classname="java.util.List" />
<tilesx:useAttribute id="defaultJs" name="default-js"
	classname="java.util.List" />
<tilesx:useAttribute id="homeCss" name="home-css"
	classname="java.util.List" />
<tilesx:useAttribute id="homeJs" name="home-js"
	classname="java.util.List" />
<tilesx:useAttribute id="loginCss" name="login-css"
	classname="java.util.List" />
<tilesx:useAttribute id="loginJs" name="login-js"
	classname="java.util.List" />

<!-- Css -->
<c:forEach items="${defaultCss}" var="item">
	<link rel="stylesheet" href="<c:url value='${item}'/>" type="text/css"
		media="screen" />
</c:forEach>

<c:forEach items="${homeCss}" var="item">
	<link rel="stylesheet" href="<c:url value='${item}'/>" type="text/css"
		media="screen" />
</c:forEach>

<c:forEach items="${loginCss}" var="item">
	<link rel="stylesheet" href="<c:url value='${item}'/>" type="text/css"
		media="screen" />
</c:forEach>

<!-- Js -->
<c:forEach items="${defaultJs}" var="item">
	<script src="<c:url value='${item}'/>" type="text/javascript"></script>
</c:forEach>

<c:forEach items="${homeJs}" var="item">
	<script src="<c:url value='${item}'/>" type="text/javascript"></script>
</c:forEach>

<c:forEach items="${loginJs}" var="item">
	<script src="<c:url value='${item}'/>" type="text/javascript"></script>
</c:forEach>

</head>
<body>
	<div class="super-container">
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="body" />

		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>