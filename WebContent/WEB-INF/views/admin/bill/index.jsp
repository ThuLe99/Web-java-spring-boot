<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HoaDon</title>
</head>
<body>

	<div class="container-fluid">

		<!-- Page Heading -->


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Danh sách order</h6>
				
			</div>
			<div class="card-body">
				<div class="table-responsive">
					${message}
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Địa chỉ</th>
								<th>Người nhận</th>
								<th>SDT</th>
								<th>Tổng tiền</th>
								<th>Mô tả</th>
								<th>Option</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="i" items="${orders}">
								<tr>
									<td>${i.id }</td>
									<td>${i.address }</td>
									<td>${i.reciever }</td>
									<td>${i.sdt }</td>
									<td>${i.total_money }</td>
									<td>${i.content }</td>
									
									<td><button class="btn btn-info btn-circle btn-sm">
											<a style="color: white"
												href="<c:url value="/admin/bill/detail/${i.id}.htm"/>">
												<i class="fas fa-info-circle"></i>
											</a>
										</button>&nbsp;&nbsp;
										<button class="btn btn-danger btn-circle btn-sm">
											<a style="color: white"
												href="<c:url value="/admin/bill/delete/${i.id}.htm"/>"><i
												class="fas fa-trash"></i></a>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</body>
</html>