<%-- 
    Document   : carList
    Created on : Jun 14, 2024, 1:15:35 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Shop Management Application</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h2>Car List</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Cyclinder</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${listCar}">
                        <tr>
                            <td>${car.car_id}</td>
                            <td>${car.brand}</td>
                            <td>${car.model}</td>
                            <td>${car.cyclinder}</td>
                            <td>${car.price}</td>
                            <td>
                                <a href="edit?car_id=${car.car_id}" class="btn btn-info">Edit</a>
                                <a href="delete?car_id=${car.car_id}" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="new" class="btn btn-primary">Add New Car</a>
        </div>
    </body>
</html>
