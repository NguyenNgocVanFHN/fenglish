<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="home">
	<div class="home_background_container prlx_parent">
		<div class="home_background prlx"
			style="background-image: url(views/client/assets/images/contact_background.jpg)"></div>
	</div>
</div>

<div class="register">
	<div class="container-fluid">
		<div class="row row-eq-height">
			<div class="col-lg-3 nopadding"></div>

			<div class="col-lg-6 nopadding">

				<!-- Search -->

				<div
					class="search_section d-flex flex-column align-items-center justify-content-center">
					<div class="search_background"
						style="background-image: url(views/client/assets/images/search_background.jpg);"></div>
					<div class="search_content text-center">
						<h1 class="search_title">Đăng nhập</h1>
						<form id="search_form" class="search_form" action="checkLogin"
							action="post">
							<input id="search_form_name" class="input_field search_form_name"
								type="text" placeholder="Tên đăng nhập" required="required"
								data-error="Vui lòng điền tên đăng nhập"> <input
								id="search_form_category"
								class="input_field search_form_category" type="password"
								placeholder="Mật khẩu">
							<button id="search_submit_button" type="submit"
								class="search_submit_button trans_200" value="Submit">đăng
								nhập</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>