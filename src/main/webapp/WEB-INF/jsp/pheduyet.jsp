<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/font/fontawesome-free-6.1.1-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/duyetbai.css" />">
  <link rel="stylesheet" href="<c:url value="/resources/css/header.css" />" />
        <link rel="stylesheet"
    href="<c:url value="/resources/css/reponsive.css" />">
</head>
<body>
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
                        <a class="nav-link fs-2 text-dark" href="#">Duyệt bài đăng</a>
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

					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa-solid fa-user"></i>

					</a>

					<ul class="dropdown-menu text-small drop_menu"
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
    <h3 class="reponsive"><a href="<c:url value="listA" />">Back to Home</a></h3>
    <div class="container" style="font-size: 1.6rem;  border-radius: 18px;">
        <div class="row">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Loại</th>
                        <th scope="col" style="width: 350px;">Mô tả</th>
                        <th scope="col">Ảnh</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Người đăng</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="pro" items="${productA}">
                    <tr>
                        <td>${pro.productIDA}</td>
                        <td>${pro.productnameA}</td>
                        <td>${pro.categoryID}</td>
                        <td style="width: 350px;">${pro.descriptionA}</td>
                        <td><img src="<c:url value="${pro.imgA}"/>" alt=""></td>
                        <td class="money">${pro.priceA}</td>
                        <td>${pro.accountID}</td>
                        <td>${pro.soluong}</td>
                        <td>
                            <div style="display: flex;">
                                <a href="javascript:void(0)" onclick="dongy(this)"> <i
                                        class="fa-solid fa-circle-check"></i></a>
                                <a href="javascript:void(0)" onclick="khongdongy(this)"><i
                                        class="fa-regular fa-circle-xmark"></i></a>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
 <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.3/bootbox.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/js/all.min.js"></script>
    <script text="javascript">
        function dongy(caller) {
            var id =  $(caller).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
            var nameProduct = $(caller).parent().parent().prev().prev().prev().prev().prev().prev().prev().text();
            var cate = $(caller).parent().parent().prev().prev().prev().prev().prev().prev().text();
            var des = $(caller).parent().parent().prev().prev().prev().prev().prev().text();
            var img = $(caller).parent().parent().prev().prev().prev().prev().children().attr('src');
            var price = $(caller).parent().parent().prev().prev().prev().text();
            var user = $(caller).parent().parent().prev().prev().text();
            var soluong = $(caller).parent().parent().prev().text();
            const data1 = {
                productnameA : nameProduct,
                categoryID : cate,
                descriptionA : des,
                imgA : img,
                priceA: price,
                accountID : user,
                soluong:soluong
            }
            $.ajax({
                method: "POST",
                contentType: 'application/json; charset=utf-8',
                url: "http://localhost:8080/spring-demo/addproduct",
                data: JSON.stringify(data1),
                success: function () {
                    alert('update thanh cong');
                    $(caller).parent().parent().parent().remove();
                },
                error: function (error) {
                    alert(error);
                }
            });
            $.ajax({
                method: "DELETE",
                url: "http://localhost:8080/spring-demo/delAddProduct/" +id,
                success: function () {
                   
                },
                error: function (error) {
                    alert(error);
                }
            });
           
        }
        function khongdongy(caller) {
            var id =  $(caller).parent().parent().prev().prev().prev().prev().prev().prev().prev().text();
            $.ajax({
                method: "DELETE",
                url: "http://localhost:8080/spring-demo/deleteAddProduct/" +id,
                success: function () {
                    alert('record has been deleted');
                    $(caller).parent().parent().parent().remove();
                },
                error: function (error) {
                    alert(error);
                }
            });
           
        }
    </script>
</body>
</html>