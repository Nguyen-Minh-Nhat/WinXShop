<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="alert-flag" aType='${message.type}'
	aMessage="${message.message }"></div>
<header class="header-area header-style-1 header-height-2">
	<div class="header-top header-top-ptb-1 d-none d-lg-block">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-xl-3 col-lg-4">
					<div class="header-info">
						<ul>
							<li><i class="fa-regular fa-phone"></i> <a href="#">0865181655</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4">
					<div class="header-info header-info-right">
						<ul>
							<c:if test="${user == null}">
								<li><i class="fa-light fa-user"></i><a href="login.htm">Đăng
										nhập / Đăng ký</a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-middle header-middle-ptb-1 d-none d-lg-block">
		<div class="container">
			<div class="header-wrap">
				<div class="logo logo-width-1">
					<a href=""><img src="./resources/imgs/theme/logo.svg"
						alt="logo" /></a>
				</div>
				<div class="header-right">
					<div class="search-style-2 d-none d-lg-block">
						<form action="shop.htm">
							<select class="select-active" name="theLoai">
								<option value="2">Mọi thể Loại</option>
								<option value="0">Nữ</option>
								<option value="1">Nam</option>
							</select> <input type="text" name="searchInput"
								placeholder="Tìm kiếm sản phẩm..." />
							<button class="fs-5 text-brand" name="btnSearch"
								style="transform: translateX(-100%); cursor: pointer">
								<i class="fa-regular fa-magnifying-glass"></i>
							</button>
						</form>
					</div>
					<div class="header-action-right">
						<div class="header-action-2">
							<c:if test="${user != null}">
								<div class="header-action-icon-2 view-user">
									<a href="account.htm"> <i class="fa-regular fa-circle-user"></i>
									</a>
									<div class="cart-dropdown-wrap cart-dropdown-hm2"
										style="min-width: 240px; padding: 10px">
										<ul>
											<li class=""><a href="account.htm"> <img
													src="./resources/imgs/${user.anh}" class="rounded-circle"
													style="width: 36px; height: 36px;" alt="Avatar" />${user.taiKhoan.email}
											</a></li>
											<li><a href="account/orders.htm"><i
													class="fa-regular fa-ballot-check"></i>Đơn mua</a></li>
											<li><a href="logout.htm"> <i
													class="fa-regular fa-arrow-right-from-bracket"></i>Đăng
													xuất
											</a></li>
										</ul>
									</div>
								</div>
							</c:if>

							<div class="header-action-icon-2">
								<a class="mini-cart-icon" href="cart.htm"> <i
									class="fa-regular fa-cart-shopping"></i> <span
									class="pro-count blue">${user.dsGHSP.size() }</span>
								</a>
								<form action="checkout.htm" method="post"
									class="cart-dropdown-wrap cart-dropdown-hm2">
									<c:if test="${user.dsGHSP.size() == 0 }">Chưa có sản phẩm nào trong giỏ. Thêm ngay !!!</c:if>
									<c:if test="${user.dsGHSP.size() > 0 }">
										<ul>

											<c:forEach var="p" items="${user.dsGHSP}">
												<li><input type="text"
													class="invisible position-absolute"
													value="${p.sanPham.maSP}" name="sanPham"></input> <input
													class="invisible position-absolute" type="number"
													value="${p.soLuong}" name="soLuong"></input>
													<div class="shopping-cart-img">
														<a href="product-detail/${p.sanPham.maSP}.htm"><img
															alt="Evara" src="./resources/imgs/${p.sanPham.anh}" /></a>
													</div>
													<div class="shopping-cart-title">
														<h4>
															<a href="product-detail/${p.sanPham.maSP }.htm">${p.sanPham.tenSP}</a>
														</h4>
														<h4>
															<span>${p.soLuong} × </span>

															<fmt:formatNumber pattern="###,### đ"
																value="${p.sanPham.gia-(p.sanPham.gia*p.sanPham.dsSPKM[0].khuyenMai.giaTriKM)/100}"
																type="currency" />
														</h4>
													</div>
													<div class="shopping-cart-delete">
														<a href="cart/remove/${p.sanPham.maSP}.htm"><i
															class="fa-regular fa-xmark"></i></a>
													</div></li>

											</c:forEach>
										</ul>
										<div class="shopping-cart-footer">
											<div class="shopping-cart-total">
												<h4>
													Tổng <span> <fmt:formatNumber pattern="###,### đ"
															value="${user.dsGHSP.stream().map(p -> (p.sanPham.gia-(p.sanPham.gia*p.sanPham.dsSPKM[0].khuyenMai.giaTriKM)/100) * p.soLuong).sum()}"
															type="currency" />
													</span>
												</h4>
											</div>
											<div class="shopping-cart-button">
												<a href="cart.htm" class="outline">Giỏ hàng</a>
												<button name="btnCheckout" class="btn btnCheckout">Mua
													Ngay</button>
											</div>
										</div>
									</c:if>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-bottom header-bottom-bg-color sticky-bar">
		<div class="container">
			<div class="header-wrap header-space-between position-relative">
				<div class="logo logo-width-1 d-block d-lg-none">
					<a href=""><img src="./resources/imgs/theme/logo.svg"
						alt="logo" /></a>
				</div>
				<div class="header-nav d-none d-lg-flex">
					<div class="main-categori-wrap d-none d-lg-block">
						<a href=""> Hãy mua theo cách của bạn </a>
					</div>
					<div
						class="main-menu main-menu-padding-1 main-menu-lh-2 d-none d-lg-block">
						<nav>
							<ul>
								<li><a class="active" href="">Trang chủ</a></li>
								<li><a href="shop.htm">Shop</a></li>
								<li><a href="cart.htm">Giỏ hàng</a></li>
								<li><a href="account.htm">Tài khoản</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="hotline d-none d-lg-block">
					<p>
						<i class="fa-regular fa-phone-rotary"></i> <span>Hotline</span>
						+84 865181655
					</p>
				</div>
				<div class="header-action-icon-2 d-block d-lg-none">
					<div class="burger-icon burger-icon-white">
						<span class="burger-icon-top"></span> <span
							class="burger-icon-mid"></span> <span class="burger-icon-bottom"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- end header -->
<!-- header mobile -->
<div class="mobile-header-active mobile-header-wrapper-style">
	<div class="mobile-header-wrapper-inner">
		<div class="mobile-header-top">
			<div class="mobile-header-logo">
				<a href="index.html"><img src="./resources/imgs/theme/logo.svg"
					alt="logo" /></a>
			</div>
			<div
				class="mobile-menu-close close-style-wrap close-style-position-inherit">
				<button class="close-style search-close">
					<i class="icon-top"></i> <i class="icon-bottom"></i>
				</button>
			</div>
		</div>
		<div class="mobile-header-content-area">
			<div class="mobile-search search-style-3 mobile-header-border">
				<form action="#">
					<input type="text" placeholder="Search for items…" />
					<button type="submit" class="btn">
						<i class="fa-regular fa-magnifying-glass"></i>
					</button>
				</form>
			</div>
			<div class="mobile-menu-wrap mobile-header-border">
				<!-- mobile menu start -->
				<nav>
					<ul class="mobile-menu">
						<li><a class="active" href="/">Home </a></li>
						<li><a href="page-about.html">About</a></li>
						<li><a href="shop.htm">Shop </a></li>

						<li><a href="page-contact.html">Contact</a></li>
					</ul>
				</nav>
				<!-- mobile menu end -->
			</div>
			<div class="mobile-header-info-wrap mobile-header-border">
				<div class="single-mobile-header-info">
					<a href="login.htm">Đăng nhập / Đăng ký </a>
				</div>
				<div class="single-mobile-header-info">
					<a href="#">0865181650</a>
				</div>
			</div>
		</div>
	</div>
</div>