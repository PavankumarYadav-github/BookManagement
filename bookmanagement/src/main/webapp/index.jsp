<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
        }
        h1 {
            background-color: #333;
            color: #fff;
            padding: 15px;
            margin: 0;
            border-radius: 8px;
        }
        a {
            display: inline-block;
            margin: 15px;
            padding: 15px 30px;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .btn-add {
            background: linear-gradient(45deg, #28a745, #218838);
            border: 1px solid #218838;
        }
        .btn-view {
            background: linear-gradient(45deg, #007bff, #0056b3);
            border: 1px solid #0056b3;
        }
        a.btn-add:hover {
            background: linear-gradient(45deg, #218838, #28a745);
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        a.btn-view:hover {
            background: linear-gradient(45deg, #0056b3, #007bff);
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Book Management System</h1>
        <a href="addBook" class="btn-add">Add a New Book</a><br>
        <a href="listBooks" class="btn-view">View All Books</a>
    </div>
</body>
</html>
