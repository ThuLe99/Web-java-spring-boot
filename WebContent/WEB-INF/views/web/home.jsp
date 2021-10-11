<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<c:url value="/category.htm" var="login" />
	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<div class="slider-item"
				style="background-image: url(template/images/slider-1.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-md-12 ftco-animate text-center"></div>

					</div>
				</div>
			</div>

			<div class="slider-item"
				style="background-image: url(template/images/slider2.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-sm-12 ftco-animate text-center"></div>

					</div>
				</div>
			</div>

			<div class="slider-item"
				style="background-image: url(template/images/khuyenmai.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-sm-12 ftco-animate text-center"></div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row no-gutters ftco-services">
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-shipped"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Free Shipping</h3>
							<span>On order over $100</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Always Fresh</h3>
							<span>Product well package</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-award"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Superior Quality</h3>
							<span>Quality Products</span>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-customer-service"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Support</h3>
							<span>24/7 Support</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6 order-md-last align-items-stretch d-flex">
							<div
								class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
								style="background-image: url(template/images/pin1.jpg);">
								<div class="text text-center">
									<h2>Tea Oicha</h2>
									<p>Protect the health of every home</p>
									<p>
										<a href="#" class="btn btn-primary">Shop now</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div
								class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
								style="background-image: url(template/images/teaBox.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href='<c:url value = "/category/${2}.htm"></c:url>'>Trà hộp</a>
									</h2>
								</div>
							</div>
							<div
								class="category-wrap ftco-animate img d-flex align-items-end"
								style="background-image: url(template/images/teacan.webp);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href='<c:url value = "/category/${3}.htm"></c:url>'>Trà lon</a>
									</h2>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div
						class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
						style="background-image: url(template/images/teabag.jfif);">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a href='<c:url value = "/category/${1}.htm"></c:url>'>Trà túi lọc</a>
							</h2>
						</div>
					</div>
					<div class="category-wrap ftco-animate img d-flex align-items-end"
						style="background-image: url(template/images/traDao.jfif);">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a href='<c:url value = "/category/${4}.htm"></c:url>'>Trà đạo</a>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Featured Products</span>
					<h2 class="mb-4">CÁC LOẠI TRÀ</h2>
					<p>TỪ NHỮNG MẦM TRÀ, CHÚNG TÔI TẠO RA NIỀM ĐAM MÊ</p>
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
											<span class="mr-2 price-dc"><f:formatNumber value="${i.price }" type="number"   maxFractionDigits = "3"/> </span><span
												class="price-sale"><f:formatNumber value="${i.price - (i.price *( i.discount /100 ))}" type="number"   maxFractionDigits = "3"/> VNĐ</span>
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

	<section class="ftco-section img"
		style="background-image: url(template/images/km2.jpg);">
		<div class="container">
			<div class="row justify-content-end">
				<div
					class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
					<span class="subheading">Best Price For You</span>
					<h2 class="mb-4">Giảm giá ngay hôm nay!</h2>
					<p>CHƯƠNG TRÌNH ƯU ĐÃI ĐẶC BIỆT – THƯỞNG THỨC TRÀ Ủ LẠNH THANH MÁT</p>
					<h3>
						<a href="#">Spinach</a>
					</h3>
					<span class="price">giá chỉ còn 54,500đ</span>
					<div id="timer" class="d-flex mt-5">
						<div class="time" id="days"></div>
						<div class="time pl-3" id="hours"></div>
						<div class="time pl-3" id="minutes"></div>
						<div class="time pl-3" id="seconds"></div>
					</div>
				</div>
			</div>
		</div>
	</section>



</body>

</html>