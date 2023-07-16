<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<button onclick="test()">send</button>
</body>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function test(){
		var x=$("abc").val();
		const data = {
				ProductIDA: 1,
				ProductnameA: "abc",
		CategoryID :1,
		DescriptionA : "adasd",
		imgA : "ádasd",
		priceA : 123,
		AccountID : 1
		}
		$.ajax({
            method: "POST",
            contentType: 'application/json; charset=utf-8',
            url: "http://localhost:8080/spring-demo/addproduct",
            data: JSON.stringify(data),
            success: function () {
                alert('update thanh cong');
            },
            error: function (error) {
                alert(error);
            }
        });
	}
</script>
</html>