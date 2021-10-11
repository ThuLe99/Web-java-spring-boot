<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
</head>
<body>
	<c:url value="/register.htm" var="register" />

	<div class="hero-wrap hero-bread"
		style="background-image: url('template/images/bg1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<!-- 	<p class="breadcrumbs" >
						<span class="mr-2"  style="color: #88b04b"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p> -->
					<h1 class="mb-0 bread" style="color: #88b04b">Đăng ký</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					${message}
					<form:form action="${register}" method="POST" modelAttribute="user"
						class="billing-form">
						<!-- <h3 class="mb-4 billing-heading">Billing Details</h3> -->
						<div class="row align-items-end">
							<div class="col-sm-12" style="color: red;">
								<form:errors path="*"></form:errors>

							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="firstname">Nhập tên đăng nhập</label>
									<form:input path="account" class="form-control" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="lastname">Mật khẩu</label>
									<form:input path="password" class="form-control" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="lastname">Email</label>
									<form:input path="email" class="form-control" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="lastname">Họ tên</label>
									<form:input path="hoTen" class="form-control" />
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="lastname">Số điện thoại</label>
									<form:input path="sdt" class="form-control" />
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-6">
								<div class="form-group mt-4">
									<div>

										<button class="btn btn-primary py-3 px-4"
											style="margin-bottom: 20px">Đăng ký</button>




									</div>
								</div>
							</div>
						</div>
					</form:form>
					<!-- END -->
				</div>

				<!-- .col-md-8 -->
			</div>
		</div>
	</section>
</body>
</html>