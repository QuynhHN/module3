<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2/10/2023
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        tr {
            border: 3px solid black;
        }
    </style>
    <title>Danh sách khách hàng</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table class="table" style="border: 1px solid black">
    <thead>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="client" items="${customerList}">
        <tr>
            <td scope="row">${client.name}</td>
            <td>${client.birthday}</td>
            <td>${client.address}</td>
            <td><img src="${client.picture}" alt="" width="30px" height="30px"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
