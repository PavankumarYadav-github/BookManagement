<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bookmanagement.model.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
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
            flex-direction: column;
        }
        h1 {
            background-color: #333;
            color: #fff;
            padding: 15px;
            text-align: center;
            margin: 20px 0;
            border-radius: 8px;
            width: 100%;
            max-width: 800px;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #555;
        }
        a {
            color: #333;
            text-decoration: none;
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .back-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .home-button {
            background-color: #007bff;
            color: #fff;
        }
        .list-button {
            background-color: #28a745;
            color: #fff;
        }
        .home-button:hover {
            background-color: #0056b3;
        }
        .list-button:hover {
            background-color: #218838;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Book</h1>
        <%
            Book book = (Book) request.getAttribute("book");
            if (book != null) {
        %>
        <form action="updateBook" method="post">
            <input type="hidden" name="id" value="<%= book.getId() %>">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<%= book.getTitle() %>" required><br>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" value="<%= book.getAuthor() %>" required><br>
            <label for="publicationYear">Publication Year:</label>
            <input type="number" id="publicationYear" name="publicationYear" value="<%= book.getPublicationYear() %>" required><br>
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" value="<%= book.getIsbn() %>" required><br>
            <input type="submit" value="Update Book">
        </form>
        <%
            } else {
        %>
        <p>Book not found.</p>
        <%
            }
        %>
        <div class="back-buttons">
            <a href="index.jsp" class="home-button">Back to Home</a>
            <a href="listBooks" class="list-button">Back to List of Books</a>
        </div>
    </div>
</body>
</html>
