<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>

<%@include file="./head.jsp"%>
<body style="max-width: 100vw; transform: none; overflow-x: hidden;">
	<%@include file="./header.jsp"%>
	<main class="main bg-white pt-50 pb-50"
		style="width: 100vw; overflow-x: scroll"
		style="background: #04696312 !important;">
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="shop.htm" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>

		<section class="mb-50">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<div class="shop-product-fillter">
							<div class="totall-product">

								<div class="pagination-area  mb-sm-5 mb-lg-0">
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-start">
											<tg:paging pagedListHolder="${pagedListHolder}"
												pagedLink="${pagedLink}" />
										</ul>
									</nav>
								</div>

							</div>
							<div class="sort-by-product-area">
								<div class="sort-by-cover mr-10">
									<div class="sort-by-product-wrap shadow">
										<div class="sort-by">
											<span><i class="fa-regular fa-grid-2"></i>Hiện:</span>
										</div>
										<div class="sort-by-dropdown-wrap">
											<span> 50 <i class="fa-solid fa-angle-down"></i></span>
										</div>
									</div>
									<div class="sort-by-dropdown">
										<ul>
											<li><a class="active" href="#">10</a></li>
											<li><a href="#">20</a></li>
											<li><a href="#">50</a></li>
											<li><a href="#">All</a></li>
										</ul>
									</div>
								</div>
								<div class="sort-by-cover">
									<div class="sort-by-product-wrap shadow">
										<div class="sort-by">
											<span><i class="fa-regular fa-arrow-down-arrow-up"></i>Sắp
												xếp theo:</span>
										</div>
										<div class="sort-by-dropdown-wrap">
											<span> Tên <i class="fa-solid fa-angle-down"></i></span>
										</div>
									</div>
									<div class="sort-by-dropdown">
										<ul>
											<li><a class="active" href="#">Tên</a></li>
											<li><a href="#">Giá: Thấp đến Cao</a></li>
											<li><a href="#">Giá: Cao xuống Thấp</a></li>
											<li><a href="#">Ngày bán</a></li>
											<li><a href="#">Đánh giá</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row product-grid-3">
							<c:forEach var="p" items="${pagedListHolder.pageList}">
								<form id="checkout${p.maSP }"
									class="invisible position-absolute" action="checkout.htm"
									method="post">
									<input class="invisible position-absolute" type="number"
										name="soLuong" min="1" step="1" value="1" style="width: 76px">
									<input type="text" name="sanPham"
										class="invisible position-absolute" value="${p.maSP}">
								</form>
								<div data-name="${p.tenSP }" data-brand="${p.nhanHang.tenNH}"
									data-review="${p.diemDG==0?'chưa có đáng giá
									nào': p.diemDG }"
									data-price="${p.gia - p.gia * p.dsSPKM[0].khuyenMai.giaTriKM/100}"
									data-old-price="${p.gia }" data-ml="${p.dungTich }"
									data-id="${p.maSP }" data-quantity="${p.slt }"
									data-type="${p.loai}" data-description="${p.moTa }"
									data-img="${p.anh }"
									class="col-lg-4 col-md-4 col-12 col-sm-6 product-cart product">
									<div class="product-cart-wrap mb-30">
										<div class="product-img-action-wrap">
											<div class="product-img product-img-zoom">
												<a href="product-detail/${p.maSP }.htm"
													style="min-height: 160px"> <img
													style="min-height: 250px" class=" default-img"
													src="./resources/imgs/${p.anh}" alt="" />

												</a>
											</div>
											<div class="product-action-1">
												<a aria-label="Quick view" class="action-btn hover-up"
													data-bs-toggle="modal" onclick="handleQuickView(this)"
													data-bs-target="#quickViewModal"><i
													class="fa-regular fa-eye"></i></a> <a aria-label="Add To Card"
													class="action-btn hover-up" href="cart/add/${p.maSP}.htm">
													<i class="fa-regular fa-cart-plus"></i>
												</a>
											</div>
											<div
												class="product-badges product-badges-position product-badges-mrg">
												<span class="hot">Hot</span>
											</div>
										</div>
										<div class="product-content-wrap">
											<div class="product-category">
												<a href="shop-grid-right.html"><c:if
														test="${p.loai  == 0 }">Nữ</c:if> <c:if
														test="${p.loai  == 1 }">Nam</c:if> <c:if
														test="${p.loai  == 2 }">Unisex</c:if>, ${p.nhanHang.tenNH}</a>
											</div>
											<h2>
												<a href="shop-product-right.html">${p.tenSP}</a>
											</h2>
											<div class="rating-result" title="90%">
												<span> <span> ${p.diemDG == 0? "chưa có đáng giá nào" : p.diemDG }</span>
												</span>
											</div>
											<div class="product-price">
												<span>${p.gia - p.gia * p.dsSPKM[0].khuyenMai.giaTriKM/100}
												</span> <span class="old-price">${p.gia }</span>
											</div>
											<div class="product-action-1 show">
												<button aria-label="Mua ngay" type="submit" title="Mua ngay"
													form="checkout${p.maSP }" name="btnCheckout"
													class="action-btn hover-up hover-white">
													<i class="fa-regular text-brand fa-credit-card hover-white"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>



						</div>
						<!--pagination-->

					</div>
					<div class="col-lg-3 primary-sidebar sticky-sidebar">
						<!-- my filter -->
						<form action="shop.htm"
							class="row d-flex justify-content-center filter-shop">
							<div class="col-md-12">
								<div class="card">
									<article class="filter-group">
										<header class="card-header">
											<a href="#" data-bs-toggle="collapse"
												data-bs-target="#collapse_aside1" data-abc="true"
												aria-expanded="false" class="collapsed"> <i
												class="icon-control fa fa-chevron-down"></i>
												<h4 class="title text-brand-dark">Nhãn hàng</h4>
											</a>
										</header>
										<div class="filter-content collapse" id="collapse_aside1">
											<div class="card-body">
												<div class="pl-10 pr-10">
													<c:forEach var="nh" items="${DSNH}">
														<div class="checkbox-btn d-inline">
															<input type="checkbox" id="${nh.maNH }" name="nhanHang"
																value="${nh.maNH}" /> <label for="${nh.maNH }"
																class="btn btn-primary btn-light">${nh.tenNH} </label>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</article>

									<article class="filter-group">
										<header class="card-header">
											<a href="#" data-bs-toggle="collapse"
												data-bs-target="#collapse_aside3" data-bs-abc="true"
												aria-expanded="false" class="collapsed"> <i
												class="icon-control fa fa-chevron-down"></i>
												<h4 class="title text-brand-dark">Dung tích</h4>
											</a>
										</header>
										<div class="filter-content collapse" id="collapse_aside3">
											<div class="card-body">
												<div class="pl-10 pr-10">
													<div class="checkbox-btn d-inline">
														<input type="checkbox" id="300" name="dungTich"
															value="300" /> <label for="300"
															class="btn btn-primary btn-light">300 ml </label>
													</div>
													<div class="checkbox-btn d-inline">
														<input type="checkbox" id="400" name="dungTich"
															value="400" /> <label for="400"
															class="btn btn-primary btn-light">400 ml </label>
													</div>
													<div class="checkbox-btn d-inline">
														<input type="checkbox" id="500" name="dungTich"
															value="500" /> <label for="500"
															class="btn btn-primary btn-light">500ml </label>
													</div>

												</div>
											</div>
										</div>
									</article>
									<article class="filter-group">
										<header class="card-header">
											<a href="#" data-bs-toggle="collapse"
												data-bs-target="#collapse_aside4" data-bs-abc="true"
												class="collapsed" aria-expanded="false"> <i
												class="icon-control fa fa-chevron-down"></i>
												<h4 class="title text-brand-dark">Đánh giá</h4>
											</a>
										</header>
										<div class="filter-content collapse" id="collapse_aside4">
											<div class="card-body">
												<div class="row">
													<div class="col-12 price_range range">
														<div class="price-filter p-10 mt-0">
															<div class="price-filter-inner">
																<div class="pl-10">
																	<div id="review-range" class=""></div>
																</div>
																<div class="price_slider_amount">
																	<div class="label-input">
																		<span>Khoản điểm:</span>
																		<div class="row">
																			<div class="input-group input-group-sm w-50">
																				<input type="text" name="diemBD"
																					class="form-control text-center" id="review-start" />
																				<div class="input-group-text">
																					<i class="fa-solid fa-star text-warning"></i>
																				</div>
																			</div>

																			<div class="input-group input-group-sm w-50">
																				<input type="text" name="diemKT"
																					class="form-control text-center" id="review-end" />
																				<div class="input-group-text">
																					<i class="fa-solid fa-star text-warning"></i>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>

														</div>

													</div>

												</div>
											</div>
										</div>

									</article>
									<article class="filter-group">
										<header class="card-header">
											<a href="#" data-bs-toggle="collapse"
												data-bs-target="#collapse_aside2" data-bs-abc="true"
												aria-expanded="false" class="collapsed"> <i
												class="icon-control fa fa-chevron-down"></i>
												<h4 class="title text-brand-dark">Giá</h4>
											</a>
										</header>
										<div class="filter-content collapse show" id="collapse_aside2">
											<div class="card-body">
												<div class="row">
													<div class="col-12 price_range range">
														<div class="price-filter pl-10 pr-10 mt-0">
															<div class="price-filter-inner">
																<div class="pl-10">
																	<div id="slider-range" class=""></div>
																</div>
																<div class="price_slider_amount">
																	<div class="label-input">
																		<span>Khoản giá:</span>
																		<div class="row">
																			<div class="input-group input-group-sm w-50">
																				<input type="text" name="giaBD"
																					class="form-control text-center" id="price-start" />
																				<div class="input-group-text">000đ</div>
																			</div>

																			<div class="input-group input-group-sm w-50">
																				<input type="text" name="giaKT"
																					class="form-control text-center" id="price-end" />
																				<div class="input-group-text">000đ</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="list-group">
																<div class="list-group-item mb-10 mt-10">
																	<label class="fw-900 mt-15">Loại</label>
																	<div class="custome-checkbox">
																		<input class="form-check-input" name="loai"
																			type="checkbox" id="nu" value="0" /> <label
																			class="form-check-label" for="nu"><span>Nữ
																		</span></label> <br /> <input name="loai" class="form-check-input"
																			type="checkbox" id="nam" value="1" /> <label
																			class="form-check-label" for="nam"><span>Nam
																		</span></label> <br /> <input name="loai" class="form-check-input"
																			type="checkbox" id="unisex" value="2" /> <label
																			class="form-check-label" for="unisex"><span>Unisex</span></label>
																	</div>
																</div>
															</div>
															<button type="submit" name="btnFilter"
																class="btn btn-outline hover-up col-12 mt-20">
																Lọc</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</article>
								</div>
							</div>
						</form>

						<!-- end my filter -->

						<!-- Product sidebar Widget -->
						<div
							class="sidebar-widget product-sidebar mb-30 p-30 bg-white border-radius-10">
							<div class="widget-header position-relative mb-20 pb-10 bg-white">
								<h5 class="widget-title mb-10">Bán Chạy</h5>
								<div class="bt-1 border-color-1"></div>
							</div>
							<div class="single-post clearfix">
								<div class="image">
									<img src="assets/imgs/shop/product-16-2.jpg" alt="#" />
								</div>
								<div class="content pt-10">
									<h5>
										<a href="shop-product-detail.html">Chen Cardigan</a>
									</h5>
									<p class="price mb-0 mt-5">$99.50</p>
								</div>
							</div>
							<div class="single-post clearfix">
								<div class="image">
									<img src="assets/imgs/shop/product-7-1.jpg" alt="#" />
								</div>
								<div class="content pt-10">
									<h6>
										<a href="shop-product-detail.html">Chen Sweater</a>
									</h6>
									<p class="price mb-0 mt-5">$89.50</p>
									<div class="product-rate">
										<div class="product-rating" style="width: 80%"></div>
									</div>
								</div>
							</div>
							<div class="single-post clearfix">
								<div class="image">
									<img src="assets/imgs/shop/product-7-1.jpg" alt="#" />
								</div>
								<div class="content pt-10">
									<h6>
										<a href="shop-product-detail.html">Colorful Jacket</a>
									</h6>
									<p class="price mb-0 mt-5">$25</p>
									<div class="product-rate">
										<div class="product-rating" style="width: 60%"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<div class="modal fade custom-modal" id="quickViewModal" tabindex="-1"
		aria-labelledby="quickViewModalLabel" aria-hidden="true">
		<div class="modal-dialog rounded">
			<div class="modal-content rounded">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
				<div class="modal-body" style="background: #00800014;">
					<div class="row">
						<div class="col-md-6 col-sm-12 col-xs-12">
							<img
								src="https://upload.wikimedia.org/wikipedia/commons/9/90/Spiderman.JPG"
								class="rounded float-left image-detail" alt="..." />
						</div>
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="detail-info">
								<h3 class="title-detail mt-30">Colorful Pattern Shirts
									HD450</h3>
								<div class="product-detail-rating">
									<div class="pro-details-brand">
										<span> Brands: <a href="shop-grid-right.html"
											class="brand-detail">Bootstrap</a></span>
									</div>
									<div class="product-rate-cover text-end">
										<div class="rating-result" title="90%">
											<span> <span class="review-score">9</span>/10
											</span> <span class="font-small ml-5 text-muted"> (25
												reviews)</span>
										</div>
									</div>
								</div>
								<div class="clearfix product-price-cover">
									<div class="product-price primary-color float-left">
										<ins>
											<span class="text-brand price-detail">$120.00</span>
										</ins>
										<ins>
											<span class="old-price font-md ml-15 old-price-detail">$200.00</span>
										</ins>
										<span class="save-price font-md color3 ml-15">25% Off</span>
									</div>
								</div>
								<div class="bt-1 border-color-1 mt-15 mb-15"></div>
								<div class="short-desc mb-30">
									<p class="font-sm">Lorem ipsum dolor, sit amet consectetur
										adipisicing elit. Aliquam rem officia, corrupti reiciendis
										minima nisi modi,!</p>
								</div>


							</div>
							<div class="attr-detail attr-size">
								<strong class="mr-10">Dung tích</strong>
								<ul class="list-filter size-filter font-small text-lowercase">

									<li class="active "><a href="#"> <span
											class="capacity-detail">400</span> <span
											class="text-lowercase">ml</span>
									</a></li>

								</ul>
							</div>
							<div class="bt-1 border-color-1 mt-30 mb-30"></div>
							<div class="detail-extralink">

								<form>
									<div class="quantity">
										<input type="number" min="1" max="5" step="1" value="1">
									</div>

								</form>

								<div class="product-extra-link2 ms-2">
									<button type="submit" class="button button-add-to-cart">
										Mua Ngay</button>
									<a aria-label="Add To Card"
										class="action-btn hover-up add-to-cart" href="cart.htm"><i
										class="fa-regular fa-cart-plus"></i></a> <a aria-label="Compare"
										class="action-btn hover-up" href="shop-compare.html"><i
										class="fa-regular fa-bags-shopping"></i></a>
								</div>
							</div>
							<ul class="product-meta font-xs color-grey mt-50">
								<li class="mb-5">Mã: <a href="#" class="id-detail">SP0000001</a></li>
								<li class="mb-5">Tags: <a href="#" rel="tag"
									class="type-detail">Cloth</a>
								</li>
								<li>Sẵn hàng:<span class="in-stock text-success ml-5"><span
										class="quantity-detail">8</span> sản phẩm có sẵn</span>
								</li>
							</ul>
						</div>
						<!-- Detail Info -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="./footer.jsp"%>
	<%@include file="./script.jsp"%>
</body>
</html>