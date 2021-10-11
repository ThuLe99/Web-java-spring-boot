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

	<div class="container-fluid">

		<!-- Page Heading -->


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Danh sách sản
					phẩm</h6>
				<span style="float: right; border: 1px solid green">
					<button class="btn btn-success btn-icon-split">
						<a style="text-decoration: none; color: white"
							href="<c:url value="/admin/product/insert.htm"/>">Thêm sản
							phẩm</a>
					</button>
					</style>
				</span>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					${message}
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Ngày</th>
								<th>Tên sản phẩm</th>
								<th>Giá</th>
								<th>Số lượng</th>
								<th>Danh mục</th>
								<th>Option</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="i" items="${products}">
								<tr>
									<td>${i.id }</td>
									<td>${i.updateDt }</td>
									<td>${i.name }</td>
									<td>${i.price }</td>
									<td>${i.count }</td>
									<td>${i.category.name }</td>
									<td><button class="btn btn-info btn-circle btn-sm">
											<a style="color: white"
												href="<c:url value="/admin/product/update/${i.id}.htm"/>">
												<i class="fas fa-info-circle"></i>
											</a>
										</button>&nbsp;&nbsp;
										<button class="btn btn-danger btn-circle btn-sm">
											<a style="color: white"
												href="<c:url value="/admin/product/delete/${i.id}.htm"/>"><i
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