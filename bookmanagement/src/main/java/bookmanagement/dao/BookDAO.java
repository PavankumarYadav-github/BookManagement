package bookmanagement.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import bookmanagement.model.Book;

public class BookDAO {

    private EntityManagerFactory factory;

    public BookDAO() {
        factory = Persistence.createEntityManagerFactory("hibernate1");
    }

    // Save a new book
    public void saveBook(Book book) {
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(book);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            entityManager.close();
        }
    }

    // Update an existing book
    public void updateBook(Book book) {
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(book);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            entityManager.close();
        }
    }

    // Delete a book by ID
    public void deleteBook(int id) {
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Book book = entityManager.find(Book.class, id);
            if (book != null) {
                entityManager.remove(book);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            entityManager.close();
        }
    }

    // Retrieve a book by ID
    public Book getBookById(int id) {
        EntityManager entityManager = factory.createEntityManager();
        Book book = null;
        try {
            book = entityManager.find(Book.class, id);
        } catch (Exception e) {
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            entityManager.close();
        }
        return book;
    }

    // Retrieve all books
    public List<Book> getAllBooks() {
        EntityManager entityManager = factory.createEntityManager();
        List<Book> books = null;
        try {
            TypedQuery<Book> query = entityManager.createQuery("SELECT b FROM Book b", Book.class);
            books = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            entityManager.close();
        }
        return books;
    }

    // Close the factory
    public void close() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}
