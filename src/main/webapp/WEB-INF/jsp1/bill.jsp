<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn Hàng </title>
    <link rel="shortcut icon" href="<c:url value="/resources/image/logo.png"/>" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
    form{
        border: 2px solid #FFC0CB;
        border-radius: 18px;
    }
</style>
</head>
<body>
    <div class="container" style="margin-top: 2%;">
        <div class="row">
            <form action="" class=" col-sm-12 col-md-12  col-lg-12 col-xl-7 col-12 col-xxl-7 " >
                <h3 class="text-center">Bill</h3>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Tên sản phẩm</label>
                    <input type="text" class="form-control" value="${buy.productname }" id="exampleFormControlInput1"  value="meof ngu" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Tên người bán</label>
                    <input type="text" class="form-control" value="${accb.customername}" id="exampleFormControlInput1"  value="luong" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Giá</label>
                    <input type="text" class="form-control price" value="${buy.productprice}" id="exampleFormControlInput1"  value="10000" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Tên người mua</label>
                    <input type="text" class="form-control" value="${buy.cusname}" id="exampleFormControlInput1"  value="phuc" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" value="${buy.diachi}" id="exampleFormControlInput1" value="dda nang" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Số điện thoại người mua</label>
                    <input type="text" class="form-control" value="${buy.phone}" id="exampleFormControlInput1" value="001231" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Số lượng</label>
                    <input type="text" class="form-control" value="${buy.soluongmua}" id="exampleFormControlInput1" value="231" readonly>
                </div>
            </form>
            <div class=" col-sm-12 col-md-12  col-lg-12 col-xl-5 col-12 col-xxl-5 ">
                <img src="${image.img}" alt="" class="img-fluid img">
            </div>
        </div>
    </div>
   <button class="btn btn-primary" style="background-color: #FFC0CB; outline: none; border: none; margin-left: 40%; margin-top: 2%;"> <a href="listA" class="fs-3 text-decoration-none" style="color: black;">Back to home</a></button>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script>
    var x = $(".price");
    var z;
    z= x.val()*1;
    z = z.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });
    x.val(z); 
</script>
</html>