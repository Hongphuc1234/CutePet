<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fa.demomvc.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Product Admin</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
    crossorigin="anonymous">
    <link rel="shortcut icon" href="<c:url value="/resources/image/logo.png"/>" />
<link href="<c:url value="/resources/font/fontawesome-free-6.1.1-web/css/all.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/manage-user.css" />"
    rel="stylesheet">
<link href="<c:url value="/resources/css/footer.css" />"
    rel="stylesheet">
<link href="<c:url value="/resources/css/header.css" />"
    rel="stylesheet">
<link href="<c:url value="/resources/css/reponsive.css" />"
    rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/drop_down.css" />">
</head>
<body>
<% List<Product> products = (List<Product>) request.getAttribute("products"); %>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #FFC0CB; margin-bottom: 5%;">
        <div class="container">
            <a href="<c:url value="listA" />" class="navbar-brand">
                <img src="<c:url value="/resources/image/logo.png" />" alt="" style="width: 50px; height: 46px;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarNavDropdown">
                <ul class="navbar-nav mx-5">
                    <li class="nav-item" style="margin-right: 30px;">
                        <a class="nav-link fs-2 text-dark" href="<c:url value="adminpage" />">Duyệt bài đăng</a>
                    </li>
                    <li class="nav-item" style="margin-right: 30px;">
                        <a class="nav-link fs-2 text-dark" href="<c:url value="manager-topic" />">Quản lí bài đăng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fs-2 text-dark" href="<c:url value="manager-user" />">Quản lí account</a>
                    </li>
                </ul>
            </div>
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" style="display: flex;">
                <input type="search" class="form-control form-control-dark form-search"
                    placeholder="Nhập để tìm kiếm sản phẩm" aria-label="Search">
                <button class="nav_btn-search">
                    <i class="nav_btn-search-icon fas fa-search"></i>
                </button>
            </form>
            <c:if test="${sessionScope.acc != null || sessionScope.accA != null}">
				<div class="btn-group dropstart text-end">

					<a class="btn btn-secondary dropdown-toggle btn-icon-nav" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa-solid fa-user"></i>

					</a>

					<ul class="dropdown-menu text-small drop_menu2"
						aria-labelledby="dropdownUser1">

						<h3>
							<i class="fa-solid fa-user"></i> ${sessionScope.accA.customername}
						</h3>

						<li><a class="dropdown-item drop_menu-item" href="<c:url value="profile?AccountID=${sessionScope.accA.accountID}"/>"><i
								class="fa-solid fa-id-badge"></i> Hồ sơ</a></li>

						<li>

							<hr class="dropdown-divider">

						</li>

						<li><a class="dropdown-item drop_menu-item"
							href="<c:url value="logout"/>"><i
								class="fa-solid fa-arrow-right-from-bracket"></i>Đăng xuất</a></li>

					</ul>

				</div>
				</c:if>
        </div>
    </nav>
    <div class="container reponsive" style="font-size: 1.6rem;">
        <div class="row">
            <div
                class="col-sm-12 col-md-12  col-lg-12 col-xl-4 col-12 col-xxl-4 left"
                style="margin-bottom: 3%;">
                <div class="left-header">
                    <i class="fa-solid fa-circle-user"></i>
                    <div>
                        <div class="fs-3 fw-bold">admin</div>
                        <div class="fs-5" style="color: black;">Quản trị viên</div>
                    </div>
                </div>
                <div class="left-content">
                    <div style="display: flex;">
                        <i class="fa-solid fa-users-line"></i> <a
                            href="<c:url value="manager-user" />"
                            style="text-decoration: none; color: unset;">
                            <div style="margin-left: 10px;">Quản lí người dùng</div>
                        </a>
                    </div>
                    <div style="display: flex; margin-top: 5%;">
                        <i class="fa-solid fa-note-sticky"></i> <a href="<c:url value="manager-topic" />"
                            style="text-decoration: none; color: unset;">
                            <div style="margin-left: 16px;" class="fw-bold">Quản lí bài
                                đăng</div>
                        </a>
                    </div>
                </div>
            </div>
            <div
                class="col-sm-12 col-md-12 col-lg-12 col-xl-8 col-xxl-8 col-12 right">
                <h1>Danh sách bài đăng</h1>
                <div style="display: flex; justify-content: space-between;">
                    <div style="display: flex; width: auto;">
                        <i class="fa-solid fa-magnifying-glass"
                            style="margin-top: 6px; margin-right: 5px;"></i> <input
                            type="text" placeholder="Tim kiem">
                    </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Loại sản phẩm</th>
                            <th scope="col">Người đăng</th>
                            <th scope="col">View</th>
                        </tr>
                    </thead>
                    <tbody>
                     <% for(Product product : products) { %>
                        <tr>
                            <td><input type="checkbox" name="foo" onclick="upcount()"><%=product.getProductID() %></td>
                            <td><%=product.getProductname() %></td>
                            <td><%=product.getCategoryID() %></td>
                            <td><%=product.getAccountID() %></td>
                            <td><a href="detail?pid=<%=product.getProductID() %>"" style="color: #000000;"><i
                                    class="fa-solid fa-eye"></i></a></td>
                        </tr>
                          <% } %>
                    </tbody>
                </table>
                <input type="checkbox" onClick="toggle(this)" /> All<br />
                <div id="count1">Đã chọn:</div>
                <nav aria-label="Page navigation example" style="margin-top: 2%;">
                    <ul class="pagination justify-content-center page-number">
                        <li class="page-item"><c:if test="${currentPage > 1}">
                                <a class="page-link" href="manager-topic?page=${currentPage-1}"
                                    aria-label="Previous"> <i class="fa-solid fa-angles-left"></i>
                                </a>
                            </c:if></li>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <c:choose>
                                <c:when test="${currentPage eq i}">
                                    <li class="page-item "><a class="page-link page-active">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link"
                                        href="manager-topic?page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <li class="page-item"><c:if
                                test="${currentPage lt totalPages}">
                                <a class="page-link" href="manager-topic?page=${currentPage+1}"
                                    aria-label="Next"> <i class="fa-solid fa-angles-right"></i>
                                </a>
                            </c:if></li>
                    </ul>
                </nav>
                <div style="margin-bottom: 2%;">
                    <div role="button" class="trash" onclick="deleteCol()">
                        <i class="fa-solid fa-trash-can"></i> Xóa
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer" style="margin-top: 30px">
        Copyright © by HeloTeam. Design by HeloTeam
    </div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/js/all.min.js"></script>
    <script text="javascript">
        function upcount() {
            var inputElems = document.getElementsByName("foo"), count = 0;
            var text = "Đã chọn: ";
            for (var i = 0; i < inputElems.length; i++) {
                if (inputElems[i].type === "checkbox"
                        && inputElems[i].checked === true) {
                    count++;
                }
            }
            document.getElementById("count1").innerText = text + count;
        }
        function toggle(source) {
            var text = "Đã chọn: ";
            var inputElems = document.getElementsByName("foo"), count = 0;
            checkboxes = document.getElementsByName('foo');
            for (var i = 0, n = checkboxes.length; i < n; i++) {
                checkboxes[i].checked = source.checked;
            }
            checkboxes = 0;
            for (var i = 0; i < inputElems.length; i++) {
                if (inputElems[i].type === "checkbox"
                        && inputElems[i].checked === true) {
                    count++;
                }
            }
            document.getElementById("count1").innerText = text + count;
        }
        function deleteCol() {
            var inputElems = document.getElementsByName("foo");
            var checkboxes = document.getElementsByName('foo');
            var deleteColl = new Array();
            const z = inputElems.length;
            for (var i = 0; i < z; i++) {
                if (inputElems[i].type === "checkbox"
                        && inputElems[i].checked === true) {
                    deleteColl[i] = $(inputElems[i]).parent().text();
                    var x = $(inputElems[i]).parent().parent().hide();
                    checkboxes[i].checked = false;
                }
            }
            deleteColl=deleteColl.filter(Number);
            $.ajax({
                method: "DELETE",
                url: "http://localhost:8080/spring-demo/api/admin/topic",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(deleteColl),
                success: function () {
                    alert('record has been deleted');
                },
                error: function (error) {
                    alert(error);
                }
            });
        }
    </script>
</body>
</html>