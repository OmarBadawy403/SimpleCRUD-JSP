<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>View Students</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .btn {
            transition: all 0.3s ease;
            border-radius: 8px;
            font-size: 0.9rem;
            padding: 10px 15px;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn:hover {
            transform: scale(1.1);
            opacity: 0.9;
        }

        .btn-edit {
            background-color: #0790eb; /* Light blue */
            color: white;
        }

        .btn-edit i {
            margin-left: 0;
        }

        .btn-delete {
            background-color: #dc3545; /* Red */
            color: white;
        }

        .btn-delete i {
            transition: transform 0.3s ease;
        }

        .btn-delete:hover i {
            transform: rotate(20deg) scale(1.2);
        }

        .btn-add {
            background-color: #28a745; /* Green */
            color: white;
            font-size: 1rem;
            font-weight: bold;
        }

        table {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #343a40;
            color: white;
        }

        th, td {
            text-align: center;
            padding: 12px;
        }

        td {
            font-size: 0.9rem;
        }

        .container {
            max-width: 900px;
        }
    </style>
</head>
<body>

<%@page import='com.omarpackage.Student'%>
<%@page import='com.omarpackage.StudentDao'%>
<%@page import='java.util.*'%>
<%@ page import='java.io.*,java.util.*,java.sql.*'%>
<%@ page import='javax.servlet.http.*,javax.servlet.*'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
List<Student> list = StudentDao.getAllRecord();
request.setAttribute("list", list);
%>

<div class="container mt-5">
    <h2 class="text-center mb-4">Student Information</h2>
    <p class="text-muted text-center mb-4">Manage your students easily</p>

    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Name</th>
            <th>Password</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Country</th>
            <th>ID</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var='s' items='${list}'>
            <tr>
                <td>${s.name}</td>
                <td>${s.password}</td>
                <td>${s.email}</td>
                <td>${s.gender}</td>
                <td>${s.country}</td>
                <td>${s.id}</td>
                <td>
                    <a href='delete.jsp?id=${s.id}' class="btn btn-delete">
                        <i class="fas fa-trash"></i>
                        <span>Delete</span>
                    </a>
                </td>
                <td>
                    <a href='edit.jsp?id=${s.id}' class="btn btn-edit">
                        <i class="fas fa-edit"></i>
                        <span>Edit</span>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a class="btn btn-add" href="addStudent.jsp">
            <i class="fas fa-user-plus"></i>
            <span>Add Student</span>
        </a>
    </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
