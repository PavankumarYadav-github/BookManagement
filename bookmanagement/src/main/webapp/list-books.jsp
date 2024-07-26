<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bookmanagement.model.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            justify-content: center;
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
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        a {
            color: #007bff;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            display: inline-block;
            transition: background-color 0.3s, color 0.3s;
        }
        a.view {
            background-color: #28a745;
            color: #fff;
        }
        a.edit {
            background-color: #ffc107;
            color: #333;
        }
        a.delete {
            background-color: #dc3545;
            color: #fff;
        }
        a:hover {
            background-color: #0056b3;
            color: #fff;
        }
        .view:hover {
            background-color: #218838;
        }
        .edit:hover {
            background-color: #e0a800;
        }
        .delete:hover {
            background-color: #c82333;
        }
        .no-books {
            text-align: center;
            font-style: italic;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>List of Books</h1>
    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Publication Year</th>
                <th>ISBN</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Book> books = (List<Book>) request.getAttribute("books");
                if (books != null && !books.isEmpty()) {
                    for (Book book : books) {
            %>
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getPublicationYear() %></td>
                <td><%= book.getIsbn() %></td>
                <td>
                    <a href="viewBook?id=<%= book.getId() %>" class="view">View</a>
                    <a href="editBook?id=<%= book.getId() %>" class="edit">Edit</a>
                    <a href="deleteBook?id=<%= book.getId() %>" class="delete">Delete</a>
                </td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="5" class="no-books">No books found.</td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
    <a href="index.jsp" class="back-link">Back to Home</a>
</body>
</html>
