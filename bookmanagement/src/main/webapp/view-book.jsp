<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bookmanagement.model.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e9ecef;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            background-color: #007bff;
            color: #ffffff;
            padding: 15px;
            border-radius: 8px 8px 0 0;
            text-align: center;
            margin: 0;
        }
        p {
            margin: 12px 0;
            font-size: 18px;
        }
        strong {
            color: #333333;
        }
        a {
            display: inline-block;
            color: #007bff;
            text-decoration: none;
            padding: 10px;
            border: 1px solid #007bff;
            border-radius: 4px;
            background-color: #ffffff;
            margin-top: 10px;
        }
        a:hover {
            background-color: #007bff;
            color: #ffffff;
            border-color: #007bff;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .button-group a {
            flex: 1;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Book Details</h1>
        <%
            Book book = (Book) request.getAttribute("book");
            if (book != null) {
        %>
        <p><strong>Title:</strong> <%= book.getTitle() %></p>
        <p><strong>Author:</strong> <%= book.getAuthor() %></p>
        <p><strong>Publication Year:</strong> <%= book.getPublicationYear() %></p>
        <p><strong>ISBN:</strong> <%= book.getIsbn() %></p>
        <%
            } else {
        %>
        <p class="not-found">Book not found.</p>
        <%
            }
        %>
        <div class="button-group">
            <a href="index.jsp">Back to Home</a>
            <a href="listBooks">Back to List of Books</a>
        </div>
    </div>
</body>
</html>
