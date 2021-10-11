<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh mục sản phẩm</title>
</head>
<body>
	<c:url value="/category.htm" var="login" />

	<div class="hero-wrap hero-bread"
		style="background-image: url('../template/images/bg1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">Products</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<h1><a href="#" class="active">${category.name} </a></h1>
				</div>
			</div>
			<div class="row">
			<c:forEach items="${product}" var="i">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="<c:url value="/category/${category.id}/product/${i.id}.htm"></c:url>" class="img-prod"><img class="img-fluid"
							src='<c:url value="${i.image}"></c:url>' alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="<c:url value="/category/${category.id}/product/${i.id}.htm"></c:url>">${i.name}</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>${i.price}</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>

		</div>
	</section>
</body>
</html>