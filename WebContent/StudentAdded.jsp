<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Add</title>
<style>
    .message {
        padding: 15px;
        background-color: #4CAF50; 
        color: white;
        text-align: center;
        position: fixed;
        bottom: 20px;  
        left: 50%;
        transform: translateX(-50%);
        width: 80%;
        max-width: 600px;
        border-radius: 5px;
        font-size: 16px;
    }
</style>
</head>
<body>


<jsp:include page="formJSP.html"></jsp:include>

<div class="message">
    Student added successfully!
</div>

</body>
</html>
