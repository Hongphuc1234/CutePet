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
    <link rel="stylesheet"
	href="<c:url value="/resources/font/fontawesome-free-6.1.1-web/css/all.min.css" />" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="<c:url value="/resources/css/header.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/profile.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/reponsive.css" />">
   <link href="<c:url value="/resources/css/edit.css" />" rel="stylesheet" >
    <link rel="stylesheet" href="<c:url value="/resources/css/footer.css" />">
</head>
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
								class="fa-solid fa-id-badge"></i> ${li.productname} đã đưuọc bán</a></li>
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

        <div class="content reponsive container" style="font-size: 1.6rem;">
            <div class="row row_content">
                <div class="profile col-sm-12 col-md-12  col-lg-12 col-xl-4 col-12 col-xxl-4">
                    <div class="profile-name">
                        <i class="fa-solid fa-user-tie"></i>
                        <div class="name">
                            <p class="name-text">HeloTeam</p>
                            <li class="edit-profile">
                                <a href="<c:url value="updateAccount?AccountID=${sessionScope.accA.accountID}"/>"><i class="fa-solid fa-pen"></i> Sửa hồ sơ</a>
                            </li>
                        </div>
                    </div>
                    <li class="account"><a href="">
                            <i class="fa-solid fa-user"></i> Hồ sơ của tôi</a>
                    </li>
                    <li class="post"><a href="<c:url value="baidang?AccountID=${sessionScope.accA.accountID}"/>">
                            <i class="fa-solid fa-file-pen"></i> Bài đăng</a>
                    </li>
                </div>
                <div class="info col-sm-12 col-md-12  col-lg-12 col-xl-8 col-12 col-xxl-8">
                    <h2>Hồ Sơ Của Tôi</h2>
                    <p class="des">Quản lý thông tin hồ sơ để bảo mật</p>
                    <table class="table table-borderless">

                        <tbody class="table-element">
                            <tr>
                                <th scope="row">Tên đăng nhập:</th>
                                <td>${upAcc.username}</td>

                            </tr>
                            <tr>
                                <th scope="row">Tên:</th>
                                <td id="1">${upAcc.customername}</td>
                             
                            </tr>
                            <tr>
                                <th scope="row">Số điện thoại:</th>
                                <td id="2">${upAcc.phone}</td>
                               
                            </tr>
                            <tr>
                                <th scope="row">Số lượng bài đăng:</th>
                                <td id="3">${accp}</td>
                                
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="footer">
            Copyright © by HeloTeam. Design by HeloTeam
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script>
        function save() {
            var x = document.getElementsByClassName("abc").value;
            console.log(x)
        }
        function cancel() {

        }
        function change(x, y) {
            var data2 = document.getElementById(x);
            var data = '<input class="abc" type="text" value="' + data2.innerText + '" >';
            document.getElementById(x).innerHTML = data;
            document.getElementById(y).style.display = "none";
            document.getElementById("save").style.display = "block";
            document.getElementById("cancel").style.display = "block";
        }
        function changePass() {
            x = document.getElementsByClassName("passnew");
            var dataPass = '<input type="password" name=""">';
            y = document.getElementsByClassName("inPass");
            for (i = 0; i < y.length; i++) {
                y[i].innerHTML = dataPass;
            }
            document.getElementById("4").innerHTML = dataPass;
            document.getElementById("pass").innerText = "Nhập mật khẩu mới: ";
            document.getElementById("passAgain").innerText = "Nhập lại mật khẩu mới: ";
            document.getElementById("passAcc").innerText = "Mật khẩu hiện tại:";
            document.getElementById("save").style.display = "block";
            document.getElementById("cancel").style.display = "block";
            document.getElementById("d").style.display = "none";
        }
    </script>
</body>

</html>