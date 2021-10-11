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
	<c:url value="/admin/product/update.htm" var="update" />
	<div class="col-lg-7">
		<div class="p-5">
			<div class="text-center">
				<h1 class="h4 text-gray-900 mb-4">Chỉnh sửa sản phẩm!</h1>
			</div>
			<form:form action="${update}" method="POST" modelAttribute="products"  enctype="multipart/form-data"
				class="user">
				<div style="color: red;">
					<form:errors path="*"></form:errors>
				</div>
				<div class="form-group">
					<label>Mã sản phẩm</label>
					<form:input path="id" disabled="true" />
					<form:hidden path="id" />
				</div>
				<div class="form-group">
					<label>Danh mục</label>
					<form:select path="category.id" items="${categorys}" itemValue="id"
						itemLabel="name">
					</form:select>
				</div>

				<div class="form-group">
					<label>Ngày tạo</label>
					<form:input path="createDt" disabled="true" />
					<form:hidden path="createDt" />
				</div>

				<div class="form-group">
					<label>Ngày sửa</label>
					<form:input path="updateDt" disabled="true" />
					<form:hidden path="updateDt" />
				</div>

				<div class="form-group">
					<form:input path="name" class="form-control form-control-user"
						placeholder="Tên sản phẩm" />
				</div>
				<div class="form-group">
					<form:input path="price" class="form-control form-control-user"
						placeholder="Giá" />
				</div>
				<div class="form-group">
					<form:input path="discount" class="form-control form-control-user"
						placeholder="Giảm giá" />
				</div>
				<div class="form-group">
					<form:input path="count" class="form-control form-control-user"
						placeholder="Số lượng" />
				</div>
				<div class="form-group">
					<form:textarea path="content"
						class="form-control form-control-user" placeholder="Mô tả" />
				</div>
				<div class="form-group">
					<label>Hình ảnh</label>
					<form:input path="image" disabled="true" />
					<form:hidden path="image" />
				</div>
				<div class="form-group">
					<label>Thêm hình ảnh</label> <input type="file" id="img" name="img">
				</div>

				<button class="btn btn-primary btn-user btn-block">Cập nhật</button>
				<a
					href="<c:url value = "/admin/product/update/${products.id}.htm"/>"
					class="btn btn-primary btn-user btn-block"> Làm mới </a>
				<a href="<c:url value = "/admin/product/home.htm"/>"
					class="btn btn-primary btn-user btn-block"> Thoát </a>
			</form:form>

			<hr>
		</div>
</body>
</html>