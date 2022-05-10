<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="./head.jsp"%>
<body>
	<!-- flag -->
	<div class="page-flag" data="news"></div>
	<!-- End-flag -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<%@include file="./sidebar.jsp"%>
		<div class="page-wrapper pt-0">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-medium mb-1">
							Tin Mới</h4>
					</div>

				</div>
			</div>
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- basic table -->
				<button type="button"
					class="btn btn-secondary green-bg-color shadow-none"
					data-toggle="modal" data-target="#addproduct">
					<i class="fas fa-plus-circle"></i> Thêm
				</button>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div>
									<table id="zero_config"
										class="table table-striped table-bordered no-wrap green-color">
										<thead>
											<tr>
												<th>Mã tin ${message }</th>
												<th>Tên tin</th>
												<th>Nội dung</th>
												<th>Ngày tạo</th>
												<th>Trạng thái</th>
												<th>Option</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="n" items="${newsList }">
												<tr>
													<td>${n.maTin }</td>
													<td>${n.tenTin }</td>
													<td>${n.noiDung }</td>
													<td>${n.ngayTao }</td>
													<td>${n.trangThai }</td>
													<td><i class="fas fa-info-circle green-color"
														data-toggle="modal" data-target=#${n.maTin}></i> <i
														class="fas fa-edit green-color" data-toggle="modal"
														data-target=#${n.tenTin}></i></td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th>Name</th>
												<th>Position</th>
												<th>Office</th>
												<th>Age</th>
												<th>Start date</th>
												<th>Salary</th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
			<!-- Center modal content -->
			<div class="modal fade" id="addproduct" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myCenterModalLabel">Thêm Tin</h4>
							<button type="button" class="close v-close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<div
								class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
								<div class="row">
									<div class="col-12">
										<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
											<div class="row tm-edit-product-row">
												<div class="col-12">

													<form action="admin/news.htm" modelAttribute="news"
														method="post" class="tm-edit-product-form">
														<div class="row mb-4">

															<div class="col-xl-6 col-lg-6 col-md-12">
																<div class="form-group mb-3">
																	<label for="name">Mã tin </label> <input path="maTin"
																		id="maTin" name="maTin" type="text"
																		class="form-control validate" required />
																</div>
																<div class="form-group mb-3">
																	<label for="name">Tên tin </label> <input path="maTin"
																		id="tenTin" name="tenTin" type="text"
																		class="form-control validate" required />
																</div>
																<div class="form-group mb-3">
																	<label for="description">Mô tả</label>
																	<textarea id="noiDung" name="noiDung"
																		class="form-control validate" rows="3" required></textarea>
																</div>
															</div>
															<div class="col-xl-6 col-lg-6 col-md-12">
																<div class="tm-product-img-dummy mx-auto rounded">
																	<i class="fas fa-cloud-upload-alt tm-upload-icon"
																		onclick="document.getElementById('anh').click();"></i>
																</div>
																<div class="custom-file mt-3 mb-3">
																	<input type="file" name="anh" id="anh"
																		style="display: none" /> <input type="button"
																		class="btn btn-primary btn-block mx-auto btn-green shadow-none"
																		value="Thêm ảnh"
																		onclick="document.getElementById('anh').click();" />
																</div>
															</div>
														</div>
														<div class="col-12">
															<button type="submit"
																class="btn btn-primary btn-block text-uppercase btn-green shadow-none">
																Thêm</button>
														</div>
													</form>
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
			<!-- /.modal -->
			<!-- Center modal content -->
			<c:forEach var="n" items="${newsList }">
				<div class="modal fade" id=${n.tenTin } tabindex="-1" role="dialog"
					aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myCenterModalLabel">Chỉnh Sửa</h4>
								<button type="button" class="close v-close" data-dismiss="modal"
									aria-hidden="true">×</button>
							</div>
							<div class="modal-body">
								<div
									class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
									<div class="row">
										<div class="col-12">
											<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
												<div class="row tm-edit-product-row">
													<div class="col-12">
														<form action="admin/news/update.htm" modelAttribute="news"
															method="post" class="tm-edit-product-form">
															<div class="row mb-4">
																<div class="col-xl-6 col-lg-6 col-md-12">
																	<div class="form-group mb-3">
																		<label for="maTin">Mã tin </label> <input id="maTin"
																			name="maTin" path="maTin" type="text"
																			value=${n.maTin } class="form-control validate"
																			required />
																	</div>
																	<div class="form-group mb-3">
																		<label for="tenTin">Tên tin </label> <input
																			id="tenTin" name="tenTin" path="tenTin" type="text"
																			value=${n.tenTin } class="form-control validate"
																			required />
																	</div>
																	<div class="form-group mb-3">
																		<label for="noiDung">Mô tả</label>
																		<textarea path="noiDung" id="noiDung" name="noiDung"
																			class="form-control validate" rows="3" required>${n.noiDung }</textarea>
																	</div>
																</div>
																<div class="col-xl-6 col-lg-6 col-md-12">
																	<div class="tm-product-img-dummy mx-auto rounded">
																		<i class="fas fa-cloud-upload-alt tm-upload-icon"
																			onclick="document.getElementById('anh').click();"></i>
																	</div>
																	<div class="custom-file mt-3 mb-3">
																		<input id="anh" type="file" id="anh" name="anh"
																			style="display: none" value=${n.anh } /> <input
																			type="button"
																			class="btn btn-primary btn-block mx-auto btn-green shadow-none"
																			value="Thêm ảnh"
																			onclick="document.getElementById('anh').click();" />
																	</div>
																</div>
															</div>
															<div class="col-12">
																<button type="submit"
																	class="btn btn-primary btn-block text-uppercase btn-green shadow-none">
																	Cập nhật</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.modal-dialog -->
				</div>
			</c:forEach>
			<!-- /.modal -->
			<!-- Center modal content -->
			<c:forEach var="n" items="${newsList }">
				<div class="modal fade" id=${n.maTin } tabindex="-1" role="dialog"
					aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myCenterModalLabel">Thông tin</h4>
								<button type="button" class="close v-close" data-dismiss="modal"
									aria-hidden="true">×</button>
							</div>
							<div class="modal-body">
								<div
									class="container tm-mt-big tm-mb-big h-100 d-flex align-items-center justify-content-center">
									<div class="row">
										<div class="">
											<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
												<div class="row tm-edit-product-row">
													<form action="" class="tm-edit-product-form">
														<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
															<div class="tm-product-img-dummy mx-auto rounded">
																<i class="fas fa-cloud-upload-alt tm-upload-icon"
																	onclick="document.getElementById('fileInput').click();"></i>
															</div>
															<div class="custom-file mt-3 mb-3">
																<input id="fileInput" type="file" style="display: none" />
																<div
																	style="padding: 4px 8px; background-color: #088178; text-align: center; color: #fff;">
																	<h4 class="mt-2">${n.maTin }</h4>
																</div>
															</div>
															<div class="row mt-4">
																<div class="form-group mb-3 col-xs-12 col-sm-6">
																	<p class="m-b-10 f-w-600">Ngày sản xuất</p>
																	<h6 class="text-muted f-w-400">23/2/3</h6>
																</div>
																<div class="form-group mb-3 col-xs-12 col-sm-6">
																	<p class="m-b-10 f-w-600">Ngày hết hạn</p>
																	<h6 class="text-muted f-w-400">23/2/3</h6>
																</div>
																<div class="form-group mb-3 col-xs-12 col-sm-6">
																	<p class="m-b-10 f-w-600">Ngày thêm</p>
																	<h6 class="text-muted f-w-400">${n.ngayTao }</h6>
																</div>
															</div>
														</div>

														<div class="col-xl-6 col-lg-6 col-md-12">
															<div class="form-group mb-3">
																<p class="m-b-10 f-w-600">Mã sản phẩm</p>
																<h6 class="text-muted f-w-400">SP001</h6>
															</div>
															<div class="form-group mb-3">
																<p class="m-b-10 f-w-600">Tên sản phẩm</p>
																<h6 class="text-muted f-w-400">Nước hoa</h6>
															</div>
															<div class="row">
																<div class="form-group mb-3 col-xs-12 col-sm-6">
																	<p class="m-b-10 f-w-600">Giá</p>
																	<h6 class="text-muted f-w-400">1.230.000 VND</h6>
																</div>
																<div class="form-group mb-3 col-xs-12 col-sm-6">
																	<p class="m-b-10 f-w-600">Số lượng</p>
																	<h6 class="text-muted f-w-400">23</h6>
																</div>
															</div>
															<div class="form-group mb-3">
																<p class="m-b-10 f-w-600">Mô tả</p>
																<h6 class="text-muted f-w-400">
																	ihihsihisahfichihcfisdh</h6>
															</div>

															<div class="row">
																<div class="form-group mb-3 col-xs-12 col-sm-6">
																	<p class="m-b-10 f-w-600">Loại</p>
																	<h6 class="text-muted f-w-400">unisex</h6>
																</div>
																<div class="form-group mb-3 col-xs-12 col-sm-6">
																	<p class="m-b-10 f-w-600">Dung tích</p>
																	<h6 class="text-muted f-w-400">320ml</h6>
																</div>
															</div>

															<div class="form-group mb-3">
																<p class="m-b-10 f-w-600">Nhãn hàng</p>
																<h6 class="text-muted f-w-400">Dior</h6>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- /.modal -->
									</div>
									<!-- ============================================================== -->
									<!-- End Page wrapper  -->
									<!-- ============================================================== -->
								</div>
							</div>
						</div>
					</div>
					<!-- /.modal-dialog -->
				</div>
			</c:forEach>
			<!-- /.modal -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<%@include file="./script.jsp"%>
	<script type="text/javascript">
	 $("#zero_config_filter")
     .append(`<div class="search-bar-table d-flex align-items-stretch">
	        	    <div class="position-relative">
	                <button type="button" class="btn btn-green text-white btn-filter" data-toggle="collapse" data-target="#filter-table">
	                    <i class="fa-regular fa-filter-list"></i>
	                    <span class="text-white"></span>
	                </button>
	                <!-- filter table -->
	                <div class="card position-absolute text-start collapse shadow-lg end-100 top-0 filter-block" id="filter-table" style="z-index: 100; min-width: 24rem;">
	                    <div class="card-header p-2 fs-5 green-color" style="background-color: #c4f0d5">
	                        Bộ lọc
	                    </div>
	                    <div class="card-body">
	                        <form action="admin/sale/index.htm" method="post" class="row g-3" id="form-filter">
	                            <div class="col-12 mt-0 px-0">
	                                <label for="input-start-date" class="form-label">Ngày bắt đầu</label>
	
	                                <div class="col-12 px-0 d-flex gap-1 justify-content-around align-items-stretch">
	                                    <div class="input-group">
	                                        <input type="date" name="ngayBDLeft" class="form-control" />
	                                    </div>
	                                    <button type="button" class="btn btn-green btn-sm btn-range-filter" data-toggle="collapse" data-target="#input-start-date-right">
	                                        Đến
	                                    </button>
	
	                                    <div class="input-group collapse range-filter-right" id="input-start-date-right">
	                                        <input type="date" name="ngayBDRight" class="form-control" />
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-12 mt-0 px-0">
	                                <label for="input-start-date" class="form-label">Ngày kết thúc </label>
	
	                                <div class="col-12 px-0 d-flex gap-1 justify-content-around align-items-stretch">
	                                    <div class="input-group">
	                                        <input type="date" name="ngayKTLeft" class="form-control" />
	                                    </div>
	                                    <button type="button" class="btn btn-green btn-sm btn-range-filter" data-toggle="collapse" data-target="#input-end-date-right">
	                                        Đến
	                                    </button>
	
	                                    <div class="input-group collapse range-filter-right" id="input-end-date-right">
	                                        <input type="date" class="form-control" name="ngayKTRight" />
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-12 px-0">
	                                <label for="inputAddress" class="form-label">Trạng thái</label>
	                                <div class="col-md-12 d-flex px-0">
	                                    <div class="form-check pl-1">
	                                        <input name="trangThai" type="radio" class="form-check-input-filter invisible position-absolute" id="trangThai" value="2" checked />
	                                        <label class="py-1 px-2" for="trangThai">
	                                            Tất cả
	                                        </label>
	                                    </div>
	                                    <div class="form-check pl-1">
	                                        <input name="trangThai" type="radio" class="form-check-input-filter invisible position-absolute" id="trangThai0" value="0" />
	                                        <label class="form-check-label py-1 px-2" for="trangThai0">
	                                            <div class="d-inline">Hết hiệu lực</div>
	                                        </label>
	                                    </div>
	                                    <div class="form-check pl-1">
	                                        <input value="1" name="trangThai" type="radio" class="form-check-input-filter invisible position-absolute" id="trangThai1" />
	                                        <label class="form-check-label py-1 px-2" for="trangThai1">
	                                            <div class="d-inline">Còn hiệu lực</div>
	                                        </label>
	                                    </div>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
	                    <div class="card-footer text-end p-2">
	                        <button type="submit" form="form-filter" name="btnFilter" class="btn btn-green">
	                            Lọc
	                        </button>
	                        <button type="reset" class="btn btn-secondary mb-0">
	                            Đặt lại
	                        </button>
	                    </div>
	                </div>
	            </div>
	        </div>`);
	</script>
</body>
</html>