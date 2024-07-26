package bookmanagement.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookmanagement.dao.BookDAO;
import bookmanagement.model.Book;

import java.io.IOException;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward the request to add-book.jsp
        req.getRequestDispatcher("add-book.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int publicationYear = Integer.parseInt(request.getParameter("publicationYear"));
        String isbn = request.getParameter("isbn");

        // Create a new book object
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setPublicationYear(publicationYear);
        book.setIsbn(isbn);

        // Save the book to the database
        bookDAO.saveBook(book);

        // Redirect to a success or book list page
        response.sendRedirect("listBooks");  // Make sure you have a servlet mapped to listBooks to handle book listing
    }
}
