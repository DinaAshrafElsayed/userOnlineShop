package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        HttpSession session = request.getSession(false);
        for (int i = 0; i < cookies.length; i++) {
            Cookie cooky = cookies[i];
            if (cooky.getName().equals("user")) {
                cooky.setMaxAge(0);
                response.addCookie(cooky);
                System.out.println("cookie deleted");
                break;
            }
        }
        session.removeAttribute("user");
        session.invalidate();
        System.out.println("session deleted");
        //request.getRequestDispatcher("index.jsp").forward(request, response);
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    // updates
    
    //end of updates
}
