<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thông Tin Chi Tiết</title>
<link rel="shortcut icon" href="<c:url value="/resources/image/logo.png"/>" />
<link rel="stylesheet"
    href="<c:url value="/resources/css/product.css" />">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
    crossorigin="anonymous">
<link
    href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
    rel="stylesheet">
<link href="/font/fontawesome-free-6.1.1-web/css/all.min.css"
    rel="stylesheet">
<link rel="stylesheet" href="/src/css/manage-user.css">
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700'
    rel='stylesheet' type='text/css'>
<link href="<c:url value="/resources/css/header.css" />" />
<link rel="stylesheet"
    href="<c:url value="/resources/css/reponsive.css" />">
<link rel="stylesheet"
    href="<c:url value="/resources/font/fontawesome-free-6.1.1-web/css/all.min.css" />" />
<link rel="stylesheet"
    href="<c:url value="/resources/css/footer.css" />">
<script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
</head>
<body>
<%
    String datas = (String) request.getAttribute("comDto");
    %>
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

					<a class="btn btn-secondary dropdown-toggle btn-icon-nav" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa-solid fa-bell"></i>

					</a>
					
					<ul class="dropdown-menu text-small drop_menu"
						aria-labelledby="dropdownUser1">
						<c:forEach var="no" items="${sessionScope.noti}">
						<li><a class="dropdown-item drop_menu-item" href="<c:url value="detail?pid=${no.productID}"/>"><i
								class="fa-solid fa-id-badge"></i>${no.content} ${no.productname} </a></li>
						<li>

							<hr class="dropdown-divider">

						</li>
						</c:forEach>
					</ul>
					
				</div>
				</c:if>
				<c:if test="${sessionScope.acc != null || sessionScope.accA != null}">
				<div class="btn-group dropstart text-end">

					<a class="btn btn-secondary dropdown-toggle btn-icon-nav" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"><i class="fa-solid fa-shop"></i>

					</a>
					
					<ul class="dropdown-menu text-small drop_menu"
						aria-labelledby="dropdownUser1">
						<c:forEach var="li" items="${sessionScope.listbuy}">
						<li><a class="dropdown-item drop_menu-item" href="<c:url value="donhang?bid=${li.buyID}"/>"><i
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

					<a class="btn btn-secondary dropdown-toggle btn-icon-nav" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"><i class="fa-solid fa-cart-shopping"></i>

					</a>
					
					<ul class="dropdown-menu text-small drop_menu"
						aria-labelledby="dropdownUser1">
						<c:forEach var="cu" items="${sessionScope.listcus}">
						<li><a class="dropdown-item drop_menu-item" href="<c:url value="donhang?bid=${cu.buyID}"/>"><i
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

					<a class="btn btn-secondary dropdown-toggle btn-icon-nav" href="#" role="button"
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
    <nav aria-label="breadcrumb" class="reponsive"
        style="font-size: 1.6rem;">
        <ol class="breadcrumb breadcrumb-main">
            <li class="breadcrumb-item "><a href="#"
                class="text-decoration-none text-secondary fs-3 breadcrumb-link">Trang
                    chủ</a></li>
            <li class="breadcrumb-item "><a href="#"
                class="text-decoration-none text-secondary fs-3 breadcrumb-link">Thú
                    cưng</a></li>
            <li class="breadcrumb-item active fs-3 breadcrumb-item-main"
                aria-current="page">Mèo</li>
        </ol>
    </nav>
    <div class="container text-center container-main"
        style="font-size: 1.6rem;background-image:linear-gradient(0, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)), url(<c:url value="/resources/image/background.png"/> ); background-repeat: no-repeat;
    background-size: 100%;
    background-attachment: fixed;
    background-position: center;">
        <div class="row">
            <div class="col-12 col-md-12 col-sm-12 col-xxl-6 col-lg-12">
                <div class="container">
                    <div>
                        <img class="mySlides" src="${product.img}"
                            style="width: 100%;">
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-12 col-sm-12 col-xxl-6 col-lg-12 content">
                <h2 class="content-heading" style=" color: gold ; font-style: italic;">${product.productname}</h2>
                <p class="content-separator" style="height:2px "></p>
                <p class="content-price" style=" color:red">${product.price}</p>
                <p class="content-description">Mô tả : ${product.description}</p>
                <p class="content-description" style="color:green;">Số lượng còn lại: ${product.status}</p>
                <div class="contact">
                    <span class="contact-phone"><a class="contact-phone-link"
                        href="tel:${accountD.phone}"><i class="fa-solid fa-phone"></i>${accountD.phone}</a></span>
                    <span class="contact-chat"><a href="<c:url value="buy?pid=${product.productID}"/>"><i
                            class="fa-solid fa-comment"></i>Đặt hàng</a></span>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="margin-top: 50px;">
        <div class="col-md-12" id="fbcomment">
            <div class="header_comment">
                <div class="row">
                    <div class="col-12 text-left">
                        <span class="count_comment">264235 Comments</span>
                    </div>
                </div>
            </div>
            <div class="body_comment" style="font-size: 1.6rem;">
                <div class="row">
                    <div class="avatar_comment  col-md-1 col-sm-1 col-xl-1 col-xxl-1">
                        <img src="/image/logo.png" alt="avatar" />
                    </div>
                    <div class="box_comment  col-md-11 col-sm-11 col-xl-11 col-xxl-11">
                        <textarea rows="1" cols="70" class="commentar " id="mainComment"
                            placeholder="Add a comment..."></textarea>
                        <div class="box_post">
                            <div class="pull-right">
                                <button onclick="isReply = false;" class="btn btn-primary"
                                    id="addComment">Comment</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div id="" class="col-md-12 list_comment">
                        <!--list comment -->
                        <%=datas%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row replyRow"
        style="display: none; font-size: 1.6rem; width: 100%;">
        <div class="col-md-12">
            <textarea class="form-control" id="replyComment"
                placeholder="Add Public Comment" cols="30" rows="2"></textarea>
            <br>
            <button style="float: right" class="btn-primary btn"
                onclick="isReply = true;" id="addReply">Add Reply</button>
            <button style="float: right" class="btn-default btn"
                onclick="$('.replyRow').hide(); ">Close</button>
        </div>
    </div>
    <div class="footer">Copyright © by HeloTeam. Design by HeloTeam</div>

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
    <script type="text/javascript">
        window.onload= changeMoneyy();
        window.onload = admin();
        var isReply = false;
        let badwords = /ngu|lon|cac|buoi/gi;
        function reply(caller) {
            $(".replyRow").insertAfter($(caller));
            $('.replyRow').show();
        }
        function edit(caller) {
            $(caller).parent().parent().hide();
            $(caller).parent().parent().prev().prev(".userComment").hide();
            var x = $(caller).parent().parent().prev().prev(".userComment").text();
            $(caller).parent().parent().before($(
                `<div class="col-md-12" >
            <textarea class="form-control" id="editComment" placeholder="Add Public Comment" cols="30"
                rows="2">`+ x + `</textarea><br>
            <button style="float:right" class="btn-primary btn" onclick="editDone(this)" id="editCom">Sửa</button>
            <button style="float:right" class="btn-default btn" onclick=" $('.userComment').show(); $(this).parent().remove(); dong(this)">Đóng</button>
        </div>`
            ));
        }
        function dong(caller) {
            $(".1234").show();
        }
        function editDone(caller) {
            var x = $(caller).prev().prev().val();
            var y = $(caller).parent().prev().prev().prev().prev().text();
            const data = {content : x};
            if (x.length > 1) {
                $.ajax({
                    method: "PUT",
                    contentType: 'application/json; charset=utf-8',
                    url: "http://localhost:8080/spring-demo/api/" +y,
                    data: JSON.stringify(data),
                    success: function () {
                        alert('update success');
                        $(caller).parent().prev().prev().text(x).show();
                        $(".1234").show();
                        $(caller).parent().remove();
                    },
                    error: function (error) {
                        alert(error);
                    }
                });
               
            }
            else {
                alert('Please Check Your Inputs');
            }
        }
        function deleteCmt(caller) {
            var x = $(caller).parent().parent().prev().prev().prev().prev().text();
            bootbox.confirm({
                title: "Delete Comment?",
                message: "Bạn có chắc muốn xóa comment.",
                buttons: {
                    cancel: {
                        label: '<i class="fa fa-times"></i> không'
                    },
                    confirm: {
                        label: '<i class="fa fa-check"></i> xóa'
                    }
                },
                callback: function (result) {
                    if(result==true){
                        $.ajax({
                            method: "DELETE",
                            url: "http://localhost:8080/spring-demo/api/" +x,
                            success: function (data) {
                                alert(data);
                            },
                            error: function (error) {
                                alert(error);
                            }
                        });
                        $(caller).parent().parent().parent().parent().remove();
                    }
                }
            });
        }
        $(document).ready(function () {
            $("#addComment, #addReply").on('click', function () {
                var comment;
                var parent = 0;
                var datetime = moment().format('yyyy-MM-DD');
                var proid = ${ product.productID };
                var accId = "${sessionScope.accA.accountID}";
                var cusname = "${sessionScope.accA.customername}";
                if (accId != "") {
                    if (!isReply) {
                        comment = $("#mainComment").val();
                        comment = comment.replace(badwords, '<3');
                        parent = 0;
                    }
                    else {
                        comment = $("#replyComment").val();
                        comment = comment.replace(badwords, '<3');
                        parent = $("#replyComment").parent().parent().parent().prev().prev().prev().prev().prev().text();
                    }
                    const json123 = {
                        content: comment,
                        accountID: accId,
                        customername: cusname,
                        productID: proid,
                        parentID: parent,
                        create_Date: datetime
                    }
                if (comment != "") {
                    $.ajax({
                        method: "POST",
                        url: "http://localhost:8080/spring-demo/api",
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: JSON.stringify(json123),
                        success: function (data) {
                            var idComment = data;
                            if (idComment == 0) {
                                alert("vui lòng đăng nhập để comment")
                            } else {
                                var data = `<div class="box_result comment row">
                                <div class="avatar_comment col-md-1">
                                  <img src="<c:url value="/resources/image/logo.png"/>" alt="avatar" />
                                </div>
                                <div class="result_comment col-md-11">
                                <div id="idComment" style="display: none;">`+ idComment + `</div>
                                  <h4>`+ cusname + `</h4>`
                                    + '<p class="userComment">' + comment + '</p>' +
                                    `<i>` + moment().format('yyyy-MM-DD') + `</i>
                                   <div style="display: flex;" class="1234">    
                                  <div style="margin-right: 10px;" ><a href="javascript:void(0)" onclick="edit(this)">  Chỉnh sửa</a></div>
                                  <div class="delete"><a href="javascript:void(0)" onclick="deleteCmt(this)"> Xóa </a></div>
                                </div>
                                 <div class="reply"><a href="javascript:void(0)" onclick="reply(this)">REPLY</a></div>
                                  <div class="replies">
                                  </div>
                                </div>
                              </div>`
                                if (!isReply) {
                                    $(".list_comment").prepend(data);
                                    $("#mainComment").val("");
                                } else {
                                    $("#replyComment").val("");
                                    $(".replyRow").hide();
                                    $('.replyRow').parent().next().append(data);
                                }
                            }
                        },
                        error: function (error) {
                            alert(error);
                        }
                    });
                } else{
                    alert('Please Check Your Inputs');}
            }else{
                alert("vui lòng đăng nhập");
            }
            });
        })
        function handleKeyPress(e) {
            e = e || window.event;
            //13 is thhe  enter key
            if (e.keyCode == 13) {
            }
        }
       
        function admin() {
            var x = [];
            var idUser="${sessionScope.accA.accountID}";
            var idUserPost=${product.accountID};
            var isAdmin = "${sessionScope.accA.isAdmin}";
            var result = [];
            var data = `<div style="margin-right: 10px;" class="sua"><a href="javascript:void(0)" onclick="edit(this)">
                                            Chỉnh sửa</a></div>`;
            var data2 =`<div style="margin-right: 10px;" class="sua"><a href="javascript:void(0)"
                                            onclick="edit(this)">
                                            Chỉnh sửa</a></div>
                                    <div class="delete"><a href="javascript:void(0)" onclick="deleteCmt(this)"> Xóa </a>`;
            $(".idUser").each(function () {
                result.push($(this).text());
            });
            $(".1234").each(function () {
                x.push($(this));
            });
            for (var i = 0; i < x.length; i++) {
                if (isAdmin == 0) {
                    if (idUserPost == idUser) {
                        x[i].children(".sua").remove();
                        if ((result[i] == idUser)) {
                            x[i].prepend(data);
                        }
                    }else{
                        x[i].children(".sua").remove();
                        x[i].children(".delete").remove();
                        if((result[i] == idUser)){
                            x[i].prepend(data2);
                        }
                    }
                } else{
                if(idUser==""){
                    x[i].remove();
                }
                }
            }
        }
        function changeMoneyy(){
        	var x = $(".content-price").text();
            var z=x*1;
    		z = z.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
   			$(".content-price").text(z);
        }
    </script>
</body>

</html>