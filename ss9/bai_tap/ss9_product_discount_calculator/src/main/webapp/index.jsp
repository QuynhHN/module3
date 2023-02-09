<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2/9/2023
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css\bootstrap.css">
</head>
<body>
<h1 class="text-center">Product Discount Calculator</h1>
<form action="/calculatorServlet" method="get">
  <div class="text-center">
    <div>
      <label for="productDescription">Product Description : </label>
      <input type="text" name="productDescription" id="productDescription" placeholder="Nhập sản phẩm"> <br>
    </div>
    <div class="pt-3">
      <label for="listPrice">List Price : </label>
      <input type="text" name="listPrice" id="listPrice" placeholder="Nhập giá sản phẩm"> <br>
    </div>
    <div class="pt-3">
      <label for="discountPercent">Discount Percent : </label>
      <input type="text" name="discountPercent" id="discountPercent" placeholder="Nhập phần trăm giảm giá">
    </div>
  </div>
  <div class="text-center pt-3">
    <input class="btn btn-primary" type="submit" value="Discount Product">
  </div>
</form>

<script scr="js/bootstrap.js">
</script>
</body>
</html>
