<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<%@include file="./common/head.jsp"%>
<body>
	<header class="header-area header-style-5 vh-5">
		<div class="header-bottom sticky-bar sticky-white-bg">
			<div class="container">
				<div class="header-wrap header-space-between position-relative">
					<div class="logo logo-width-1">
						<a href=""><img
							src="<c:url value='/resources/imgs/theme/logo.svg'/>" alt="logo" /></a>
					</div>
					<h3 class="text-brand">Đăng Nhập</h3>
				</div>
			</div>
		</div>
	</header>

	<main class="main my-background">
		<section class="">
			<div class="container">

				<div class="row vh-90">
					<div class="col-lg-10 m-auto">
						<div class="row">
							<div class="col-lg-5 align-items-center">
								<div
									class="login_wrap widget-taber-content p-30 bg-white box-shadow-outer-7 border-radius-10 mb-md-5 mb-lg-0 mb-sm-5">

									<div class="padding_eight_all bg-white">
										<div class="heading_s1">
											<h3 class="mb-30">Đăng nhập</h3>
										</div>
										<form action="login.htm" method="post">
											<div class="form-group form-floating">
												<input type="text" name="email" value="${userName}"
													class="form-control form-control-lg" placeholder="Email" />
												<label for="">Email</label>
											</div>
											<span class="text-danger">${message1}</span>
											<div class="form-floating">
												<input type="password" name="password" value="${password}"
													class="form-control" placeholder="Mật khẩu" /> <label
													for="">Password</label>
											</div>
											<span class="text-danger">${message}</span>
											<div class="login_footer form-group"></div>
											<div class="form-group">
												<button type="submit"
													class="btn btn-fill-out btn-block hover-up">Đăng
													Nhập</button>
											</div>
											<div class="text-muted text-center">
												Chưa có tài khoản? <a href="register.htm">Đăng ký
													ngay!!!</a>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="col-lg-1"></div>
							<div class="col-lg-6 align-items-center">
								<div class="text-center mb-md-5 mb-lg-0 mb-sm-5">
									<h1>
										<a href=""><img
											src="<c:url value='/resources/imgs/theme/logo.svg'/>"
											alt="logo" /></a>
									</h1>
									<h2 class="text-brand lh-sm">Shop bán nước hoa chất lượng
										hàng đầu PTIT</h2>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@include file="./common/footer.jsp"%>
	<%@include file="./common/script.jsp"%>
</body>
</html>