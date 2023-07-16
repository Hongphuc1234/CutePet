<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/pet.css" />">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value="/resources/font/fontawesome-free-6.1.1-web/css/all.min.css" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/header.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/reponsive.css" />">
</head>

<body>


  <div class="main">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #FFC0CB; margin-bottom: 5%;">
      <div class="container">
        <a href="#" class="navbar-brand">
          <img src="<c:url value="/resources/image/logo.png"/>" alt="" style="width: 50px; height: 46px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
          aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarNavDropdown">
          <ul class="navbar-nav mx-5">
            <li class="nav-item dropdown fs-2" style="margin-right: 30px;">
              <a class="nav-link dropdown-toggle text-dark hover" href="#" id="navbarDropdownMenuLink" role="button"
                data-bs-toggle="dropdown" aria-expanded="false">
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
            <li><a class="dropdown-item" href="#"><i class="fa-solid fa-arrow-right-from-bracket"></i>Đăng xuất</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <nav aria-label="breadcrumb" class="reponsive" style="font-size: 1.6rem;">
      <ol class="breadcrumb breadcrumb-main">
        <li class="breadcrumb-item "><a href="#" class="text-decoration-none text-secondary fs-3 breadcrumb-link">Trang chủ</a></li>
        <li class="breadcrumb-item "><a href="#" class="text-decoration-none text-secondary fs-3 breadcrumb-link">Thú cưng</a></li>
        <li class="breadcrumb-item active fs-3 breadcrumb-item-main" aria-current="page">Mèo</li>
      </ol>
    </nav>
    <div class="dropdown text-end filter" style="font-size: 1.6rem;">
      <a href="" class="d-block  text-decoration-none dropdown-toggle filter-a" id="dropdownUser1"
        data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-filter"></i> Bộ lọc</a>
      <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="font-size: 1.6rem;">
        <li><a class="dropdown-item text-center" href="#">Thứ tự mặc định</a> </li>
        <li><a class="dropdown-item text-center" href="#"> Sản phẩm mới</a></li>
        <li><a class="dropdown-item text-center" href="#">Giá từ cao tới thấp</a></li>
        <li><a class="dropdown-item text-center " href="#">Giá từ thấp tới cao</a></li>
      </ul>
    </div>
    <div class="container" style="font-size: 1.6rem;">
      <div class="row">
        <div class="col-md-2 col-12">
          <ul class="list-group  text-white text-uppercase category_block list-gr">
            <div class="list-group-item active text-center"> Category</div>
            <li class="list-group-item text-center"> <a href="#" class="text-decoration-none">Chó</a></li>
            <li class="list-group-item text-center"> <a href="#" class="text-decoration-none">Chó</a></li>
            <li class="list-group-item text-center"> <a href="#" class="text-decoration-none">Chó</a></li>
            <li class="list-group-item text-center"> <a href="#" class="text-decoration-none">Chó</a></li>

          </ul>
        </div>
        <div class="col-md-10 col-12">
          <div class="row">
            <div class="col-12 col-md-6 col-lg-4 ">
              <div class="card text-center card-product">
                <img src="/image/3-2.jpg" class="card-img-top img-product" alt="">
                <div style="padding: 4px;">
                  <p class="text-decoration-none card-title-p"> Mèo</p>
                  <p class="text-decoration-none card-description-p">Mèo anh lông dài- BritishLonghair</p>
                  <p class=" card-price">5,769,999đ</p>
                </div>
                <button class="btn btn-detail">Xem chi tiết</button>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 ">
              <div class="card text-center card-product">
                <img src="/image/3-2.jpg" class="card-img-top img-product" alt="">
                <div style="padding: 4px;">
                  <p class="text-decoration-none card-title-p"> Mèo</p>
                  <p class="text-decoration-none card-description-p">Mèo anh lông dài- BritishLonghair</p>
                  <p class=" card-price">5,769,999đ</p>
                </div>
                <button class="btn btn-detail">Xem chi tiết</button>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 ">
              <div class="card text-center card-product">
                <img src="/image/3-2.jpg" class="card-img-top img-product" alt="">
                <div style="padding: 4px;">
                  <p class="text-decoration-none card-title-p"> Mèo</p>
                  <p class="text-decoration-none card-description-p">Mèo anh lông dài- BritishLonghair</p>
                  <p class=" card-price">5,769,999đ</p>
                </div>
                <button class="btn btn-detail">Xem chi tiết</button>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 ">
              <div class="card text-center card-product">
                <img src="/image/3-2.jpg" class="card-img-top img-product" alt="">
                <div style="padding: 4px;">
                  <p class="text-decoration-none card-title-p"> Mèo</p>
                  <p class="text-decoration-none card-description-p">Mèo anh lông dài- BritishLonghair</p>
                  <p class=" card-price">5,769,999đ</p>
                </div>
                <button class="btn btn-detail">Xem chi tiết</button>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 ">
              <div class="card text-center card-product">
                <img src="/image/3-2.jpg" class="card-img-top img-product" alt="">
                <div style="padding: 4px;">
                  <p class="text-decoration-none card-title-p"> Mèo</p>
                  <p class="text-decoration-none card-description-p">Mèo anh lông dài- BritishLonghair</p>
                  <p class=" card-price">5,769,999đ</p>
                </div>
                <button class="btn btn-detail">Xem chi tiết</button>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 ">
              <div class="card text-center card-product">
                <img src="/image/3-2.jpg" class="card-img-top img-product" alt="">
                <div style="padding: 4px;">
                  <p class="text-decoration-none card-title-p"> Mèo</p>
                  <p class="text-decoration-none card-description-p">Mèo anh lông dài- BritishLonghair</p>
                  <p class=" card-price">5,769,999đ</p>
                </div>
                <button class="btn btn-detail">Xem chi tiết</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <nav aria-label="Page navigation example" style=" margin-top: 2%;margin-bottom: 2%;font-size: 1.6rem;">
      <ul class="pagination justify-content-center page-number">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <i class="fa-solid fa-angles-left"></i>
          </a>
        </li>
        <li class="page-item "><a class="page-link page-active" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <i class="fa-solid fa-angles-right"></i>
          </a>
        </li>
      </ul>
    </nav>
    <div class="footer">
      Copyright © by HeloTeam. Design by HeloTeam
    </div>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>




</body>

</html>