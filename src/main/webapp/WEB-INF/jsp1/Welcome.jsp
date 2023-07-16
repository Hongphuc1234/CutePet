<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv = "refresh" content = "0.001; url = listA" />
<title>Welcome</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
	integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" href="<c:url value="/resources/image/logo.png"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/header.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/home-page.css" />">
	<link rel="stylesheet"
	href="<c:url value="/resources/css/reponsive.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/font/fontawesome-free-6.1.1-web/css/all.min.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/footer.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/drop_down.css" />">
</head>
<style>
.content1 {

  text-align: center;

  margin: 3% ;

}

.content1 .content-name {

  font-size: 36px;

}

.content1 .content-des {

  font-size: 26px;

  margin: 0 30%;
  
  color: #666;

}

.content-link:hover {
	color: #FFC0CB !important;
}

.drop_menu {
    border: 2px solid var(--primary-color) !important;
    margin-top: -3px !important;
    box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);
    width: 150px;
}
</style>
<body>
 <div class="main" style="background-image:linear-gradient(0, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)), url(<c:url value="/resources/image/background.png"/> ); background-repeat: no-repeat;
    background-size: 100%;
    background-attachment: fixed;
    background-position: center;">

		<nav class="navbar navbar-expand-lg navbar-light fixed-top"
			style="background-color: #FFC0CB; margin-bottom: 5%;">
			<div class="container">
				<a href="<c:url value="listA"/>" class="navbar-brand"> <img
					src="<c:url value="/resources/image/logo.png"/>" alt=""
					style="width: 50px; height: 46px;"> <!-- mẫu--> 
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse " id="navbarNavDropdown">
					<ul class="navbar-nav mx-5">
						<li class="nav-item dropdown fs-2" style="margin-right: 30px;">
							<a class="nav-link dropdown-toggle text-dark hover" href="#"
							id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Thú cưng </a>
							<ul class="dropdown-menu drop_menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item drop_menu-item"
									href="<c:url value="searchByCat?cid=1"/>">Chó</a></li>
								<li><a class="dropdown-item drop_menu-item"
									href="<c:url value="searchByCat?cid=2"/>">Mèo</a></li>
								<li><a class="dropdown-item drop_menu-item"
									href="<c:url value="searchByCat?cid=6"/>">Chim</a></li>
								<li><a class="dropdown-item drop_menu-item"
									href="<c:url value="searchByCat?cid=3"/>">Cá</a></li>
							</ul>
						</li>
						<li class="nav-item" style="margin-right: 30px;"><a
							class="nav-link fs-2 text-dark"
							href="<c:url value="searchByCat?cid=4"/>">Thức ăn</a></li>
						<li class="nav-item" style="margin-right: 30px;"><a class="nav-link fs-2 text-dark"
							href="<c:url value="searchByCat?cid=5"/>">Phụ kiện</a></li>
							<c:if test="${sessionScope.acc !=null || sessionScope.accA != null}">
							<li class="nav-item" style="margin-right: 30px;"><a
							class="nav-link fs-2 text-dark"
							href="<c:url value="add"/>">Thêm sản phẩm</a></li>
							</c:if>	
							<c:if test="${sessionScope.accA.isAdmin==1}">
							<li class="nav-item" style="margin-right: 30px;"><a
							class="nav-link fs-2 text-dark"
							href="<c:url value="adminpage"/>">Quản Lí</a></li>
							</c:if>	
					</ul>
				</div>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3"
					style="display: flex;" action="<c:url value="search"/>">
					<input name="keyword" type="search"
						class="form-control form-control-dark form-search"
						placeholder="Nhập để tìm kiếm" aria-label="Search">
					<button class="nav_btn-search">
						<i class="nav_btn-search-icon fas fa-search"></i>
					</button>
				</form>

	
				<div class="text-end">
				<c:if test="${sessionScope.acc==null && sessionScope.accA==null}">
					<button type="button" class="btn btn-outline-light me-2 btn-login">
						<a href="<c:url value="login"/>"
						
							style="text-decoration: none; text-transform: none; color: black">Đăng
							nhập </a>
					</button>
					</c:if>
					<c:if test="${sessionScope.acc==null && sessionScope.accA==null}">
					<button type="button" class="btn btn-register">
						<a href="<c:url value="Register"/>"
							style="text-decoration: none; text-transform: none; color: black">Đăng
							kí</a>
					</button>
					</c:if>
				</div>
				<c:if test="${sessionScope.acc != null || sessionScope.accA != null}">
				<div class="dropdown text-end">

					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa-solid fa-user"></i>

					</a>

					<ul class="dropdown-menu text-small drop_menu"
						aria-labelledby="dropdownUser1">

						<h3>
							<i class="fa-solid fa-user"></i> ${sessionScope.acc.customername}
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
        <!-- Thẻ Chứa Slideshow -->
        <div class="slideshow-container">
            <!-- Kết hợp hình ảnh và nội dung cho mội phần tử trong slideshow-->
            <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <img class="pic-bor" src="<c:url value="/resources/image/wp2544022.jpg"/>" style="width:100%">
                <div class="text">Thú cưng</div>
            </div>
            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <img class="pic-bor" src="<c:url value="/resources/image/do-choi-cho-thu-cung.jpg"/>" style="width:100%">
                <div class="text">Phụ kiện</div>
            </div>
            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <img class="pic-bor" src="<c:url value="/resources/image/thuc-an-cho-thu-cung-4.jpg"/>" style="width:100%">
                <div class="text">Thức ăn</div>
            </div>

            <!-- Nút điều khiển mũi tên-->
        </div>
        <br>
        <!-- Nút tròn điều khiển slideshow-->
        <div style="text-align:center; margin-top: 40px;">
            <span class="dot" onclick="currentSlide(0)"></span>
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
        </div>
			<div class="content1">

                <div style="text-align:center;height:46px ; margin:0 0">
        <button class="content-btn" style="background-color:transparent ;width: 200px; height:46px; font-size:16px; font-weight:500; border:2px solid #FFC0CB; border-radius: 10px "><a class="content-link" href="<c:url value="listA"/>" style="text-decoration: none; color:#666;">Tới Trang Chủ   <i class="fa-solid fa-forward"></i></a></button>
    	</div>
          <p class="content-des" style="margin:20px 10% 0 ; color: #fe8fa4">Bạn là người yêu quý động vật, hãy đến CutePet nơi cung cấp thông tin các loại thú nuôi. Với đa dạng vật nuôi khác nhau, rất mong các bạn ghé thăm và  tìm kiếm được các con vật bạn yêu thích</p>
        </div>
        
        <div class="footer">
            Copyright © by HeloTeam. Design by HeloTeam
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
    <script>
        // let slideIndex = 0;
        // showSlides();
        // function showSlides() {
        //     let i;
        //     let slides = document.getElementsByClassName("mySlides");
        //     let dots = document.getElementsByClassName("dot");
        //     for (i = 0; i < slides.length; i++) {
        //         slides[i].style.display = "none";  
        //     }
        //     slideIndex++;
        //     if (slideIndex > slides.length) {
        //         slideIndex = 1
        //     }    
        //     for (i = 0; i < dots.length; i++) {
        //         dots[i].className = dots[i].className.replace(" active", "");
        //     }
        //     slides[slideIndex-1].style.display = "block";  
        //     dots[slideIndex-1].className += " active";
        //     setTimeout(showSlides, 3000);
        // }
        //khai báo biến slideIndex đại diện cho slide hiện tại
        var slideIndex;
        // KHai bào hàm hiển thị slide
        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }

            slides[slideIndex].style.display = "block";
            dots[slideIndex].className += " active";
            //chuyển đến slide tiếp theo
            slideIndex++;
            //nếu đang ở slide cuối cùng thì chuyển về slide đầu
            if (slideIndex > slides.length - 1) {
                slideIndex = 0
            }
            //tự động chuyển đổi slide sau 8s
            setTimeout(showSlides, 1500);
        }
        //mặc định hiển thị slide đầu tiên 
        showSlides(slideIndex = 0);
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }
    </script>
</body>
</html>