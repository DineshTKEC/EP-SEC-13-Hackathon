<%@ page session="true" %>
<%
    // Invalidate the current session to log the user out
    session.invalidate();

    // Redirect to the login page
    response.sendRedirect("login.jsp");
%>
