<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa bài đăng</title>
    <link rel="stylesheet" href="/font/fontawesome-free-6.1.1-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/resources/css/header.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/reponsive.css" />">
   <link href="<c:url value="/resources/css/edit.css" />" rel="stylesheet" >
    <link rel="stylesheet" href="<c:url value="/resources/css/footer.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/drop_down.css" />">
</head>

<body>

	<c:forEach var="item" items="${products}">
	<p>${item.username}</p>
	 
	</c:forEach>


    <div class="main">
        <nav class="navbar navbar-expand-lg navbar-light fixed-top"
            style="background-color: #FFC0CB; margin-bottom: 5%;">
            <div class="container">
                <a href="#" class="navbar-brand">
                    <img src="/image/logo.png" alt="" style="width: 50px; height: 46px;">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarNavDropdown">
                    <ul class="navbar-nav mx-5">
                        <li class="nav-item dropdown fs-2" style="margin-right: 30px;">
                            <a class="nav-link dropdown-toggle text-dark hover" href="#" id="navbarDropdownMenuLink"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Thú cưng
                            </a>
                            <ul class="dropdown-menu drop_menu" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item drop_menu-item" href="#">Chó</a></li>
                                <li><a class="dropdown-item drop_menu-item" href="#">Mèo</a></li>
                                <li><a class="dropdown-item drop_menu-item" href="#">Chim</a></li>
                                <li><a class="dropdown-item drop_menu-item" href="#">Cá</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" style="margin-right: 30px;">
                            <a class="nav-link fs-2 text-dark" href="#">Thức ăn</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fs-2 text-dark" href="#">Phụ kiện</a>
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


                <div class="text-end">
                    <button type="button" class="btn btn-outline-light me-2 btn-login">Đăng nhập</button>
                    <button type="button" class="btn btn-register">Đăng ký</button>
                </div>
                <div class="dropdown text-end">

                    <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1"
                        style="border: 2px solid #5fc2c9; word-wrap: break-word;">
                        <li><a class="dropdown-item" href="#"> <i class="fa-solid fa-user"></i> Tên user</a> </li>
                        <li><a class="dropdown-item" href="#"><i class="fa-solid fa-id-badge"></i> Hồ sơ</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#"><i class="fa-solid fa-arrow-right-from-bracket"></i>Đăng
                                xuất</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content container reponsive" style="font-size: 1.6rem;">
            <div class="row">
                <div class="profile col-sm-12 col-md-12  col-lg-12 col-xl-4 col-12 col-xxl-4">
                    <div class="profile-name">
                        <i class="fa-solid fa-user-tie"></i>
                        <div class="name">
                            <p class="name-text">HeloTeam</p>
                            <li class="edit-profile">
                                <a href=""><i class="fa-solid fa-pen"></i> Sửa hồ sơ</a>
                            </li>
                        </div>
                    </div>
                    <li class="account"><a href="./MyProfile.html">
                            <i class="fa-solid fa-user"></i> Hồ sơ của tôi</a>
                    </li>
                    <li class="post"><a href="./Manager.html">
                            <i class="fa-solid fa-file-pen"></i> Quản lý bài đăng</a>
                    </li>
                </div>
                <div class="info col-sm-12 col-md-12  col-lg-12 col-xl-8 col-12 col-xxl-8">
                    <h2>Đăng bài</h2>
                    <form action="">
                        <div class="txt-field">
                            <p class="field-name">Tên: </p>
                            <input type="text" placeholder="Nhập tên" required>
                        </div>
                        <div class="txt-option">
                            <p class="field-name">Thể loại: </p>
                            <select name="" id="" class="option-category" required>
                                <option selected disabled>Chọn thể loại</option>
                                <option value="1">Thú cưng</option>
                                <option value="2">Phụ kiện</option>
                                <option value="3">Thức ăn</option>
                            </select>
                            <select name="" id="" class="option-pet" required>
                                <option selected disabled>Chọn thú cưng</option>
                                <option value="1">Chó</option>
                                <option value="2">Mèo</option>
                                <option value="3">Chim cảnh</option>
                                <option value="4">Khác</option>
                            </select>
                        </div>
                        <div class="txt-field">
                            <p class="field-name">Giá:</p>
                            <input type="text" placeholder="Nhập giá" required>
                        </div>
                        <div class="txt-field">
                            <p class="field-name-image">Thêm ảnh:</p>
                            <div class="add-image">
                                <img src="/image/editpostimage.png" alt="">
                                <img src="/image/editpostimage.png" alt="">
                                <img src="/image/editpostimage.png" alt="">
                            </div>
                        </div>
                        <div class="txt-field">
                            <p class="field-name-description">Mô tả:</p>
                            <input type="text" placeholder="Mô tả" required>
                        </div>

                        <input type="submit" value="Lưu">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        Copyright © by HeloTeam. Design by HeloTeam
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
</body>

</html>