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
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h3>Chi tiết đơn hàng</h3>
			<ul>
				<li>Mã số hóa đơn: ${ord.id}</li>
				<li>Người nhận: ${ord.reciever}</li>
				<li>Địa chỉ: ${ord.address}</li>
				<li>Số điện thoại: ${ord.sdt}</li>
				<li>Ngày đặt: ${ord.createDt}</li>

			</ul>

		</div>

		<div class="card-body">
			<div class="table-responsive">
				${message}
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Mã sản phẩm</th>
							<th>Tên sản phẩm</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Tổng tiền</th>

						</tr>
					</thead>

					<tbody>
						<c:forEach var="item" items="${pdo}" varStatus="i">
							<tr>
								<td>${pro[i.index].id}</td>
								<td>${pro[i.index].name}</td>
								<td>${pro[i.index].price}</td>
								<td>${item.count}</td>
								<td>${item.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p>Tổng tiền: ${ttM}</p>
			</div>
		</div>
</body>
</html>