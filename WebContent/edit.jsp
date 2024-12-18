<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Student</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }
        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 600px;
            margin: auto;
        }
        .form-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-primary {
            width: 100%;
            font-size: 1rem;
            padding: 10px;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<%@page import='com.omarpackage.Student'%>
<%@page import='com.omarpackage.StudentDao'%>
<%
String id = request.getParameter("id");
Student s = StudentDao.getRecordById(Integer.parseInt(id));
%>

<div class="form-container">
    <h2 class="form-title">Edit Student Information</h2>
    <form action='editStudent.jsp' method='post'>
        <!-- ID Field -->
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" name="id" id="id" class="form-control" value="<%= s.getId() %>" readonly>
        </div>

        <!-- Name Field -->
        <div class="form-group">
            <label for="name">First Name:</label>
            <input type="text" name="name" id="name" class="form-control" value="<%= s.getName() %>">
        </div>

        <!-- Password Field -->
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" class="form-control" value="<%= s.getPassword() %>">
        </div>

        <!-- Email Field -->
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" class="form-control" value="<%= s.getEmail() %>">
        </div>

        <!-- Gender Field -->
        <label>Gender:</label>
        <div class="form-group">
            <div class="form-check">
                <input type="radio" name="gender" id="male" value="male" class="form-check-input" <%= s.getGender().equals("male") ? "checked" : "" %>>
                <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check">
                <input type="radio" name="gender" id="female" value="female" class="form-check-input" <%= s.getGender().equals("female") ? "checked" : "" %>>
                <label class="form-check-label" for="female">Female</label>
            </div>
        </div>

        <!-- Country Field -->
        <div class="form-group">
            <label for="country">Country:</label>
            <select name="country" id="country" class="form-control">
                <option value="egypt" <%= s.getCountry().equals("egypt") ? "selected" : "" %>>Egypt</option>
                <option value="saudi_arabia" <%= s.getCountry().equals("saudi_arabia") ? "selected" : "" %>>Saudi Arabia</option>
                <option value="usa" <%= s.getCountry().equals("usa") ? "selected" : "" %>>USA</option>
                <option value="uk" <%= s.getCountry().equals("uk") ? "selected" : "" %>>UK</option>
                <option value="uae" <%= s.getCountry().equals("uae") ? "selected" : "" %>>UAE</option>
            </select>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">Edit</button>
    </form>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
