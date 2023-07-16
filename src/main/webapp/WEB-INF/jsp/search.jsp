<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ</title>
<style>
.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
	integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" href="/image/CutePet.png" sizes="" />
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

</head>

<style>
@charset "UTF-8";
.page-number li{
    margin-left: 15px;
}
.page-number li a{
    /* background-color: #f092da !important; */
    border-radius: 50%;
    color: red !important;
}
.page-number li:first-child a{
    background-color: unset !important;
    border: 0;
    margin-left: 0;
}
.page-number li:last-child a{
    background-color: unset !important;
    border: 0;



}
.page-number li a:hover{
    background-color: #f5c5e6 !important;
}
.page-active{
    background-color: #f5c5e6 !important;
}
.card-product {
    background-color: #fff !important;
    margin-top: 10% !important;
    border: 2px solid #fe8fa4 !important;
    border-radius: 5px !important;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
    transition: transform ease-in 0.1s;
    will-change: transform;
    height:380px;
}
.card-product:hover {
    transform: translateY(-1px);
    box-shadow: 0 1px 20px 0 rgba(0, 0, 0, 0.05);
    cursor: pointer;
}
.img-product {
    min-height: 200px;
    min-width: 200px;
    max-width: 500px;
    max-height: 500px;
    border-radius: unset !important;
}
.card-title-p {
    color: #666;
    text-transform: uppercase;
    font-size: 20px;
    font-weight: 500;
}

.card-description-p {
    font-size:15px;
}

.card-price {
    margin: 0;
    font-size: 18px;
    color: #fe8fa4;
    font-weight: 500;
}

.btn-detail {
    background-color: #ffb2c0 !important;
    padding: 9px 0 !important;
    font-size: 12px !important;
    color: #000 !important;
    text-transform: uppercase;
    position:fixed;
    bottom:0;
    width: 100%;
}

.btn-detail:hover {
    background-color: #fe8fa4 !important;
    outline: none;
    border: none;
}
</style>
<body>


	<div class="main"
		style="background-image: url(<c:url value="/resources/image/background.png"/> )">

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
						<li class="nav-item"><a class="nav-link fs-2 text-dark"
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
				<div class="btn-group dropstart text-end">

					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa-solid fa-bell"></i>

					</a>
					
					<ul class="dropdown-menu text-small drop_menu"
						aria-labelledby="dropdownUser1">
						<c:forEach var="no" items="${sessionScope.noti}">
						<li><a class="dropdown-item drop_menu-item" href="<c:url value="detail?pid=${no.productID}"/>"><i
								class="fa-solid fa-id-badge"></i> ${no.productname} ${no.content}</a></li>
						<li>

							<hr class="dropdown-divider">

						</li>
						</c:forEach>
					</ul>
					
				</div>
				</c:if>
				<c:if test="${sessionScope.acc != null || sessionScope.accA != null}">
				<div class="btn-group dropstart text-end">

					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"><i class="fa-solid fa-shop"></i>

					</a>
					
					<ul class="dropdown-menu text-small drop_menu"
						aria-labelledby="dropdownUser1">
						<c:forEach var="li" items="${sessionScope.listbuy}">
						<li><a class="dropdown-item drop_menu-item" href="<c:url value="detail?pid=${li.productID}"/>"><i
								class="fa-solid fa-id-badge"></i> ${li.productname} đã được bán</a></li>
						<li>

							<hr class="dropdown-divider">

						</li>
						</c:forEach>
					</ul>
					
				</div>
				</c:if>
				<c:if test="${sessionScope.acc != null || sessionScope.accA != null}">
				<div class="btn-group dropstart text-end">

					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"><i class="fa-solid fa-cart-shopping"></i>

					</a>
					
					<ul class="dropdown-menu text-small drop_menu"
						aria-labelledby="dropdownUser1">
						<c:forEach var="cu" items="${sessionScope.listcus}">
						<li><a class="dropdown-item drop_menu-item" href="<c:url value="detail?pid=${cu.productID}"/>"><i
								class="fa-solid fa-id-badge"></i>bạn đã mua ${cu.productname}</a></li>
						<li>

							<hr class="dropdown-divider">

						</li>
						</c:forEach>
					</ul>
					
				</div>
				</c:if>
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

		<!-- Thẻ Chứa Slideshow -->
	
		<div class="container reponsive"
            style="border: 2px solid #FFC0CB; border-radius: 18px; padding-bottom: 20px; background-color: white; font-size: 1.6rem">
            <div class="row">
                <h2 style="text-align: center;">Tin đăng mới</h2>
                <c:forEach var="pron" items="${newp}">
                <div class="col-xl-3 col-xxl-3 col-lg-4 col-md-8 col-sm-8 col-12" >
                    <div class="card text-center card-product" >
                        <img src="${pron.img}" class="card-img-top img-product" style="height:200px" alt="">
                        <div style="padding: 4px;">
                            <p class="text-decoration-none card-description-p" style="color:gold ;font-style: italic;">${pron.productname}</p>
                            <p class="card-price"  style="font-weight:500; font-size: 15px;color: red ">${pron.price}</p>
                        </div>
                        <button class="btn btn-detail" style="border: solid gold; border-radius:none; background-color: white !important">
                            <a href="<c:url value="detail?pid=${pron.productID}"/>" style="text-decoration: none ; color: gold ; font-weight:700; ">Xem chi tiết</a>
                        </button>
                    </div>
                    
                </div>
                </c:forEach>
                
            </div>
        </div>
        <div class="container"
            style="border: 2px solid #FFC0CB; border-radius: 18px; margin-top: 30px; padding-bottom: 20px; background-color:#fe8fa4;">
            <h2 style="text-align: center;">Sản Phẩm</h2>
            <div class="row">
                <c:forEach var="pro" items="${product}">
                    <div class="col-xl-3 col-xxl-3 col-lg-4 col-md-8 col-sm-8 col-12" style="border: solid gold; border-radius: 12px ">
                        <div class="card text-center card-product">
                            <img src="${pro.img}"
                                class="card-img-top img-product" style="height:200px" alt="">
                            <div style="padding: 4px;">
                                <p class="text-decoration-none card-description-p" style="color:gold ;font-style: italic;">${pro.productname}</p>
                                <p class="card-price"  style="font-weight:500; font-size: 15px;color: red ">${pro.price}</p>
                                <p class="text-decoration-none card-description-p" style="color: opacity(0.8) "> ngày đăng : ${pro.datatime}</p>
                            </div>
                            <button class="btn btn-detail">
                                <a href="<c:url value="detail?pid=${pro.productID}"/>" style="text-decoration: none ; color: gold ; font-weight:700">Xem
                                    chi tiết</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <nav aria-label="Page navigation example" style="margin-top: 2%;">
                    <ul class="pagination justify-content-center page-number">
                        <li class="page-item"><c:if test="${currentPage > 1}">
                                <a class="page-link" href="listA?page=${currentPage-1}"
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
                                        href="search?page=${i}&keyword=${sessionScope.keyword}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <li class="page-item"><c:if
                                test="${currentPage lt totalPages}">
                                <a class="page-link" href="listA?page=${currentPage+1}"
                                    aria-label="Next"> <i class="fa-solid fa-angles-right"></i>
                                </a>
                            </c:if></li>
                    </ul>
                </nav>
        </div>
				</div>
			</div>

		</div>
		<div class="footer">Copyright © by HeloTeam. Design by HeloTeam
		</div>
	</div>
	<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script>
	window.onload=changeMoney();
		function changeMoney(){
			var result = [];
            $(".card-price").each(function () {
                    result.push($(this));
                });
            
                var z;
                for(var i =0;i < result.length; i++){
                    z= result[i].text()*1;
                    z = z.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });
                    result[i].text(z);
                    
                }
        }
	</script>
</body>

</html>