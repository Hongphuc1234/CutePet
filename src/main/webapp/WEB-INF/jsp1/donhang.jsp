<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hàng</title>
    <link rel="shortcut icon" href="<c:url value="/resources/image/logo.png"/>" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/font/fontawesome-free-6.1.1-web/css/all.min.css">
    <style>
    .btn {
    	width: 100px;
    }
    
    .btn:hover {
    	background-color: #ff92a4 !important;
    }
    
    .info {
    border-style: solid;
    border-color: #ffb2c0;
    border-radius: 2px;
    height: auto;

    padding-left: 30px;
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #fff;
    }
    </style>
</head>
<body>
    <div class="main">
        <h2 class="text-center" style="margin-bottom: 50px;">Đơn hàng</h2>
            <div class="row">
                <div class="info col-sm-12 col-md-12  col-lg-12 col-xl-7 col-12 col-xxl-7">
                <form  class="container" >
                    <div class="mb-3">
                        <label for="exampleFormControlInput1"  class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" name="Productname" value="${buy.productname}" id="exampleFormControlInput1" readonly="readonly">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Tên người bán</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" value="${buy.customername}" placeholder="mèo ngu" readonly="readonly">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Giá</label>
                        <input type="text" class="form-control"  name="Productprice" value="${buy.gia}" id="exampleFormControlInput1" placeholder="" readonly="readonly">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Địa chỉ</label>
                        <input type="text" class="form-control" name="diachi" value="${buy.diachi}" id="exampleFormControlInput1"
                            placeholder="VD: tp đà nẵng" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Số điện thoại người mua</label>
                        <input type="text" class="form-control" name="phone" value="${buy.phone}" id="exampleFormControlInput1"
                            placeholder="VD: 1234567890">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Số lượng</label>
                        <input type="text" class="form-control" name="phone" value="${buy.phone}" id="exampleFormControlInput1"
                            placeholder="VD: 1234567890">
                    </div>
                     
                        <button class="btn btn-primary mt-4" style="background-color: #FFC0CB; color:#000; border: none;"><a href="<c:url value="listA"/>">Home</a></button>
            </form>
                </div>
                <div class=" col-sm-12 col-md-12  col-lg-12 col-xl-5 col-12 col-xxl-5 ">
                    <img src="${productbuy.img}" alt="" class="img-fluid img">
                </div>
              
            </div>
</body>
</html>