<%-- 
    Document   : carForm
    Created on : Jun 14, 2024, 1:09:57 AM
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
            <h2>${car == null ? 'Add New Car' : 'Edit Car'}</h2>
            <form action="${car == null ? 'insert' : 'update'}" method="post">
                <c:if test="${car != null}">
                    <input type="hidden" name="car_id" value="${car.car_id}">
                </c:if>
                <div class="form-group">
                    <label>Brand</label>
                    <input type="text" name="brand" class="form-control" value="${car != null ? car.brand : ''}" required>
                </div>
                <div class="form-group">
                    <label>Model</label>
                    <input type="text" name="model" class="form-control" value="${car != null ? car.model : ''}" required>
                </div>
                <div class="form-group">
                    <label>Cyclinder</label>
                    <input type="text" name="cyclinder" class="form-control" value="${car != null ? car.cyclinder : ''}" required>
                </div>
                <div class="form-group">
                    <label>Price</label>
                    <input type="text" name="price" class="form-control" value="${car != null ? car.price : ''}" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
