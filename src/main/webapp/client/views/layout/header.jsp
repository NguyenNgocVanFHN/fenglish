<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<header class="header d-flex flex-row">
	<div class="header_content d-flex flex-row align-items-center">
		<!-- Logo -->
		<div class="logo_container">
			<div class="logo">
				<spring:url value="/client/assets/images/logo.png" var="imgLogo" />
				<img src="${imgLogo}" alt=""> <span>fenglish</span>
			</div>
		</div>

		<!-- Main Navigation -->
		<nav class="main_nav_container">
			<div class="main_nav">
				<ul class="main_nav_list">
					<li class="main_nav_item"><a
						href="${pageContext.request.contextPath}">trang chủ</a></li>
					<li class="main_nav_item"><a
						href="${pageContext.request.contextPath}/posts">bài đăng</a></li>
					<li class="main_nav_item"><a href="#">khóa học</a></li>
					<li class="main_nav_item"><a
						href="${pageContext.request.contextPath}/subjects">bài thi</a></li>
					<li class="main_nav_item"><a
						href="${pageContext.request.contextPath}/contact">liên hệ</a></li>
					<c:if test="${userName != null && isAdmin}">
						<li class="main_nav_item"><a
							href="${pageContext.request.contextPath}/admin/">Admin</a></li>
					</c:if>
					<!-- <li class="main_nav_item"><a href="elements.html"></a></li> -->
				</ul>
			</div>
		</nav>
	</div>
	<div
		class="header_side d-flex flex-row justify-content-center align-items-center">
		<c:choose>
			<c:when test="${sessionScope.userName != null}">
				<ul>
					<li><a href="${pageContext.request.contextPath}/users/show"
						class="login">Wellcome ${userName} </a></li>
					<li><a href="#" id="logout">Logout</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<div id="fb-root"></div>
				<ul id="login_list">
					<li><a href="${pageContext.request.contextPath}/login"
						class="login">Đăng nhập</a></li>
					<li><a href="${pageContext.request.contextPath}/register"
						class="registration">Đăng ký?</a></li>
					<li><a
						href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/fenglish/login-google&response_type=code
    &client_id=625291988126-2t7q2gvarc6v04ohsnl4dbslv9mpihk4.apps.googleusercontent.com&approval_prompt=force">Login
							With Gmail</a></li>
					<li><fb:login-button scope="public_profile,email"
							onlogin="checkLoginState();">
						</fb:login-button></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- Hamburger -->
	<div class="hamburger_container">
		<i class="fas fa-bars trans_200"></i>
	</div>

</header>

<!-- Menu -->
<div class="menu_container menu_mm">

	<!-- Menu Close Button -->
	<div class="menu_close_container">
		<div class="menu_close"></div>
	</div>

	<!-- Menu Items -->
	<div class="menu_inner menu_mm">
		<div class="menu menu_mm">
			<ul class="menu_list menu_mm">
				<li class="menu_item menu_mm"><a
					href="${pageContext.request.contextPath}">trang chủ</a></li>
				<li class="menu_item menu_mm"><a
					href="${pageContext.request.contextPath}/posts">bài đăng</a></li>
				<li class="menu_item menu_mm"><a href="#">khóa học</a></li>
				<li class="menu_item menu_mm"><a
					href="${pageContext.request.contextPath}/subjects">bài thi</a></li>
				<li class="menu_item menu_mm"><a
					href="${pageContext.request.contextPath}/contact">liên hệ</a></li>
			</ul>

			<!-- Menu Social -->

			<div class="menu_social_container menu_mm">
				<ul class="menu_social menu_mm">
					<li class="menu_social_item menu_mm"><a href="#"><i
							class="fab fa-pinterest"></i></a></li>
					<li class="menu_social_item menu_mm"><a href="#"><i
							class="fab fa-linkedin-in"></i></a></li>
					<li class="menu_social_item menu_mm"><a href="#"><i
							class="fab fa-instagram"></i></a></li>
					<li class="menu_social_item menu_mm"><a href="#"><i
							class="fab fa-facebook-f"></i></a></li>
					<li class="menu_social_item menu_mm"><a href="#"><i
							class="fab fa-twitter"></i></a></li>
				</ul>
			</div>
			<div class="menu_copyright menu_mm">Colorlib All rights
				reserved</div>
		</div>
	</div>
</div>