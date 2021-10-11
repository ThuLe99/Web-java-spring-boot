<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng của bạn!</title>
</head>
<body>
	<c:url value="/order.htm" var="order" />
	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>Tên sản phẩm</th>
									<th>Giá</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ssc.listpdo}" var="i">
									<tr class="text-center">
										<td class="product-remove"><button><a href="<c:url value="/delete/${i.product.id}.htm"/>">
												 <span
												class="ion-ios-close"></span></button>
										</a></td>

										<td class="image-prod"><img class="img"
											src="<c:url value="${i.product.image}" ></c:url>"> <%-- <div class="img"
												style="background-image: url("${im}");"></div> --%></td>

										<td class="product-name">
											<h3>${i.product.name}</h3>
											<p>${i.product.content}</p>
										</td>

										<td class="price">${i.product.price}</td>

										<td class="quantity">${i.count}</td>

										<td class="total">${i.price}</td>
									</tr>
								</c:forEach>
								<!-- END TR-->


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row justify-content-end">
				<div class="col-lg-6 mt-5 cart-wrap ftco-animate">
					<div class="cart-total mb-3">
						<h3>Thông tin đặt hàng</h3>
						<%-- ${message} --%>
						<form:form action="${order}" method="POST" modelAttribute="order">
							${message}
							<div class="form-group">
								<label>Họ tên</label>
								<form:input path="reciever" class="form-control text-left px-3"
									placeholder=""></form:input>
							</div>
							<div class="col-sm-12" style="color: red;">
								<form:errors path="reciever"></form:errors>
							</div>
							<div class="form-group">
								<label for="country">Địa chỉ</label>
								<form:input path="address" class="form-control text-left px-3"
									placeholder=""></form:input>
							</div>

							<div class="col-sm-12" style="color: red;">
								<form:errors path="address"></form:errors>
							</div>
							<div class="form-group">
								<label for="country">Số điện thoại</label>
								<form:input path="sdt" class="form-control text-left px-3"
									placeholder=""></form:input>
							</div>
							<div class="col-sm-12" style="color: red;">
								<form:errors path="sdt"></form:errors>
							</div>
							<div class="form-group">
								<label for="country">Mô tả</label>
								<form:input path="content" class="form-control text-left px-3"
									placeholder=""></form:input>
							</div>
							<div class="col-sm-12" style="color: red;">
								<form:errors path="content"></form:errors>
							</div>
							<form:hidden path="total_money" value="${ssc.price}"></form:hidden>
							<p>
								<button>
									<a class="btn btn-primary py-3 px-4">Mua hàng</a>
								</button>
							</p>
						</form:form>
					</div>

				</div>
				<div class="col-lg-6 mt-5 cart-wrap ftco-animate">
					<div class="cart-total mb-3">
						<h3>Tổng tiền</h3>

						<hr>
						<p class="d-flex total-price">
							<span>Total</span> <span>${ssc.price}</span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>
</body>
</html>