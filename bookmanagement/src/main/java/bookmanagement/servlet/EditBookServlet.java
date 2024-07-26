package bookmanagement.servlet;

import bookmanagement.dao.BookDAO;
import bookmanagement.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editBook")
public class EditBookServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.getBookById(id);

        if (book != null) {
            request.setAttribute("book", book);
            request.getRequestDispatcher("edit-book.jsp").forward(request, response);
        } else {
            response.sendRedirect("listBooks");
        }
    }

    @Override
    public void destroy() {
        bookDAO.close();
    }
}
