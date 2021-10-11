<%@page import="ptithcm.bean.SessionCart"%>
<%@page import="ptithcm.bean.SessionUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/common/taglib.jsp"%>
<div class="py-1 bg-primary">
	<div class="container">
		<div
			class="row no-gutters d-flex align-items-start align-items-center px-md-0">
			<div class="col-lg-12 d-block">
				<div class="row d-flex">
					<div class="col-md pr-4 d-flex topper align-items-center">
						<div
							class="icon mr-2 d-flex justify-content-center align-items-center">
							<span class="icon-phone2"></span>
						</div>
						<span class="text">+84 915 064 803</span>
					</div>
					<div class="col-md pr-4 d-flex topper align-items-center">
						<div
							class="icon mr-2 d-flex justify-content-center align-items-center">
							<span class="icon-paper-plane"></span>
						</div>
						<span class="text">sutydl@gmail.com</span>
					</div>
					<div
						class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						<span class="text">3-5 Business days delivery &amp; Free
							Returns</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href='<c:url value = "/home.htm"></c:url>'><img
			src="<c:url value="/template/images/logo-header.png" />"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a
					href='<c:url value = "/home.htm"></c:url>' class="nav-link">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown04"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<c:forEach items="${menucategory}" var="i">
							<a class="dropdown-item"
								href='<c:url value = "/category/${i.id}.htm" > </c:url>'>${i.name}</a>
						</c:forEach>
					</div></li>
				<li class="nav-item"><a
					href='<c:url value = "/about.htm"></c:url>' class="nav-link">About</a></li>
				<%if(request.getSession().getAttribute("SessionCart") != null) {%>
				
				<li class="nav-item cta cta-colored"><a
					href='<c:url value ="/cart.htm" ></c:url>' class="nav-link"><span
						class="icon-shopping_cart"></span>[<%=((SessionCart) request.getSession().getAttribute("SessionCart")).getItem()%>]</a></li>
				<%
					} else {
				%>
				<li class="nav-item cta cta-colored"><a
					href='<c:url value ="/cart.htm" ></c:url>' class="nav-link"><span
						class="icon-shopping_cart"></span>[0]</a></li>
				<%
					}
				%>
				<%
					if (request.getSession().getAttribute("sessionUser") != null) {
				%>
				
				<li class="nav-item"><a class="nav-link"><%=((SessionUser) request.getSession().getAttribute("sessionUser")).getHoTen()%></a></li>
				<li class="nav-item cta cta-colored"><a
					href='<c:url value = "/logout.htm"> </c:url>' class="nav-link"><span
						class="icon-angle-right"></span></a></li>

				<%
					} else {
				%>
				
				<li class="nav-item cta cta-colored"><a
					href='<c:url value = "/login.htm"> </c:url>' class="nav-link"><span
						class="icon-person_add"></span></a></li>

				<%
					}
				%>
			</ul>
		</div>
	</div>
</nav>