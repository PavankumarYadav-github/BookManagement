package bookmanagement.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bookmanagement.dao.BookDAO;
import bookmanagement.model.Book;
import java.io.IOException;
import java.util.List;

@WebServlet("/listBooks")
public class ListBooksServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = bookDAO.getAllBooks();
        request.setAttribute("books", books);
        request.getRequestDispatcher("list-books.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        bookDAO.close();
    }
}

