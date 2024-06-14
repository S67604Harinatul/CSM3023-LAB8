<%-- 
    Document   : EmployeeForm
    Created on : Jun 7, 2024, 1:34:10 AM
    Author     : User
--%>


<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
        <div>
            <a href="" class="navbar-brand"> Employee Management App </a>
        </div>
            
        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a></li>
        </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${employee != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${employee == null}">
                    <form action="insert" method="post"> 
                </c:if>
                        
                <h2>
                    <c:if test="${employee != null}">
                        Edit Employee
                    </c:if>
                    <c:if test="${employee == null}"> 
                        Add New Employee
                    </c:if>
                </h2>

                <c:if test="${employee != null}">
                    <input type="hidden" name="id" value="<c:out value='${employee.id}' />" /> 
                </c:if>
                
                <fieldset class="form-group">
                        <label>Employee Name</label><input type="text" value="<c:out value='${employee.name}' />" 
                                                           class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                        <label>Employee Email</label><input type="text" value="<c:out value='${employee.email}' />" 
                                                           class="form-control" name="email">
                </fieldset>       
              
                <fieldset class="form-group">
                        <label>Employee Position</label>
                        <input type="text" id="displayPosition" value="<c:out value='${employee.position}' />" class="form-control" readonly>
                        <input list="positionList" id="position" class="form-control" name="position" onchange="updatePosition()" >
                        <datalist id="positionList">
                            <option value="Manager">
                            <option value="Head of Dept">
                            <option value="Supervisor">
                            <option value="Director">
                        </datalist>
                </fieldset>
                
                <button type="submit" class="btn btn-success">Save</button>
                    </form>
            </div>
        </div>
    </div>
</body>
</html>     