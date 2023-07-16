<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <link rel="stylesheet" href="<c:url value="/resources/css/login_re.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/font/fontawesome-free-6.1.1-web/css/all.min.css" />">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <div class="main">
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

        <div class="main_container" style="background-image: linear-gradient(0, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),url(<c:url value="/resources/image/background.png" />)">
            <form action="${pageContext.request.contextPath}/saveupdate" method="POST" class="form" id="form-1" modelAttribute="RigisterForm">
                <div class="form-header">
                    <h3 class="form-heading">Chỉnh Sửa Thông Tin</h3>
                    <h3 style="color:red">${message}</h3>
                </div>
						
						
						
						<div class="form-group">
                    <label for="fullname" class="form-label">AccountID</label>
                    <input id="fullname" name="AccountID" value="${upAcc.accountID}"type="text" placeholder="VD: Nguyễn Hữu Phước"
                        class="form-control1" readonly>
                    <i class="fa-solid fa-user form-user"></i>
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <label for="fullname" class="form-label">Họ và tên</label>
                    <input id="fullname" name="Customername" value="${upAcc.customername } ${param.customername}" type="text" placeholder="VD: Nguyễn Hữu Phước"
                        class="form-control1">
                    <i class="fa-solid fa-user form-user"></i>
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="username" class="form-label">Tên đăng nhập</label>
                    <input id="username" name="Username" value="${upAcc.username} ${param.username}" type="text" placeholder="VD: phuocfsoft2001"
                        class="form-control1" readonly>
                    <i class="fa-solid fa-user form-user"></i>
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input id="phone" name="Phone" value="${upAcc.phone}" type="text" placeholder="VD: 0702738234" class="form-control1">
                    <i class="fa-solid fa-user form-user"></i>
                    <span class="form-message"></span>
                </div>
					
					  <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu cũ</label>
                    <input id="password" name="oldPass" type="password" placeholder="Nhập mật khẩu cũ"
                        class="form-control1">
                    <i class="fa-solid fa-user-lock form-lock"></i>
                    <span class="form-message"></span>
                    <i class="fa-solid fa-eye-slash form-eye-slash"></i>
                </div>
					
                <div class="form-group">
                    <label for="password" class="form-label">Mật khẩu mới</label>
                    <input id="password" name="Pass"  type="password" placeholder="Nhập mật khẩu"
                        class="form-control1">
                    <i class="fa-solid fa-user-lock form-lock"></i>
                    <span class="form-message"></span>
                    <i class="fa-solid fa-eye-slash form-eye-slash"></i>
                </div>

                <div class="form-group">
                    <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
                    <input id="password_confirmation" name="Re-Pass"  placeholder="Nhập lại mật khẩu"
                        type="password" class="form-control1">
                    <i class="fa-solid fa-user-lock form-lock"></i>
                    <span class="form-message"></span>
                    <i class="fa-solid fa-eye-slash form-eye-slash"></i>
                </div>
                <button class="form-submit">Đăng ký</button>
            </form>
            
            
            
            
          
            <div class="icon">
                <img src="<c:url value="/resources/image/logo.png" />" alt="">
            </div>
        </div>
        <div class="footer">
            Copyright © by HeloTeam. Design by HeloTeam
        </div>
    </div>

    <script src=""></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
    <script>

        Validator({
            form: '#form-1',
            formGroupSelector: '.form-group',
            errorSelector: '.form-message',
            rules: [
                Validator.isRequired('#fullname', 'Vui lòng nhập tên đầy đủ của bạn'),
                Validator.isRequired('#email'),
                Validator.isEmail('#email'),
                Validator.isRequired('#username'),
                Validator.isRequired('#avatar'),
                Validator.minLength('#password', 8),
                Validator.minLength('#phone', 10),
                Validator.isRequired('#password_confirmation'),
                Validator.isRequired('#province'),
                Validator.isConfirmed('#password_confirmation', function () {
                    return document.querySelector('#form-1 #password').value;
                }, 'Mật khẩu nhập lại không chính xác'),
                Validator.isRequired('input[name="gender"]'),
            ],
            onSubmit: function (data) {
                // Call API
                console.log(data);
            }
        });

    </script>
</body>

</html>