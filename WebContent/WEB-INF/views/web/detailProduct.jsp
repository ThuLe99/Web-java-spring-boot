<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
</head>
<body>
<c:url value="/cart.htm" var="themCart" />
	<div class="hero-wrap hero-bread"
		style="background-image: url('../../../template/images/bg1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">Chi tiết sản phẩm</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href='<c:url value="${product.image}"></c:url>'
						class="image-popup"><img
						src='<c:url value="${product.image}"></c:url>' class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${product.name }</h3>

					<p class="price">
						<%-- <span>${product.price }</span> --%>
						<span class="mr-2 price-dc"><f:formatNumber value="${product.price }" type="number"   maxFractionDigits = "3"/> VNĐ</span>
					</p>
					<p>${product.content }</p>
					<div class="row mt-4">
						<div class="col-md-6">
							<div class="form-group d-flex">
								<div class="select-wrap"></div>
							</div>
						</div>
						<div class="w-100"></div>
						<form:form action="${themCart}" method="POST" modelAttribute="gioHang">
							<div class="input-group col-md-6 d-flex mb-3">
								<form:input path="count"
									class="form-control input-number" value="1" min="1" max="100" />
								<form:hidden path="product.id" value ="${product.id}"/>
								<form:hidden path="product.price" value ="${product.price}"/>
								<input type="hidden" value="${category}" name="idCategory"/>
								
							</div>
							<div class="w-100"></div>
					</div>
					<p>
						<a href="#" class="btn btn-black py-3 px-5"><button
								style="color: #FFFF; cursor: pointer">Thêm vào giỏ hàng</button></a>
					</p>
					</form:form>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Products</span>
					<h2 class="mb-4">Các sản phẩm liên quan</h2>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach var="i" items="${products}">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="<c:url value="/category/${i.category.id}/product/${i.id}.htm"></c:url>" class="img-prod"><img class="img-fluid"
								src='<c:url value="${i.image}"></c:url>' alt="Colorlib Template">
								<span class="status">-30%</span>
								<div class="overlay"></div> </a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="<c:url value="/category/${i.category.id}/product/${i.id}.htm"></c:url>">${i.name }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="mr-2 price-dc"><f:formatNumber
													value="${i.price }" type="number" maxFractionDigits="3" /></span><span
												class="price-sale"><f:formatNumber
													value="${i.price - (i.price *( i.discount /100 ))}"
													type="number" maxFractionDigits="3" /></span>
										</p>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<a href="<c:url value="/category/${i.category.id}/product/${i.id}.htm"></c:url>"
											class="add-to-cart d-flex justify-content-center align-items-center text-center">
											<span><i class="ion-ios-menu"></i></span>
										</a> <a href="<c:url value="/category/${i.category.id}/product/${i.id}.htm"></c:url>"
											class="buy-now d-flex justify-content-center align-items-center mx-1">
											<span><i class="ion-ios-cart"></i></span>
										</a> <a href="<c:url value="/category/${i.category.id}/product/${i.id}.htm"></c:url>"
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