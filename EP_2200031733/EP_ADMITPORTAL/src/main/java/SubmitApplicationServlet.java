import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/submitApplication.jsp")
public class SubmitApplicationServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/admission_form";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Chinni@44";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        // Save form data to the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String insertQuery = "INSERT INTO application_form (name, email, course) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(insertQuery);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, course);
            statement.executeUpdate();

            response.sendRedirect("success.jsp"); // Redirect to a success page after form submission
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if an exception occurs
        }
    }
}
