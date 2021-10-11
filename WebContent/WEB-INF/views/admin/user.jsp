<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
</head>
<body>

	<div class="container-fluid">

		<!-- Page Heading -->


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Danh sách người
					dùng</h6>

			</div>
			<div class="card-body">
				<div class="table-responsive">
					${message}
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Tên đăng nhập</th>
								<th>HoTen</th>
								<th>Email</th>
								<th>Số điện thoại</th>
								<th>Role</th>
								<th>Option</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="i" items="${users}">
								<tr>
									<td>${i.id }</td>
									<td>${i.account }</td>
									<td>${i.hoTen }</td>
									<td>${i.email }</td>
									<td>${i.sdt }</td>
									<td>${i.role.role }</td>

									<td>
										<button class="btn btn-danger btn-circle btn-sm">
											<a style="color: white"
												href="<c:url value="/admin/bill/delete/${i.id}.htm"/>"><i
												class="fas fa-trash"></i></a>
										</button>
									</td>
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