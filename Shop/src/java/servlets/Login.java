/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.DataBaseHandler;
import dto.User;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BOSHA
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    DataBaseHandler instance;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        instance = DataBaseHandler.getinstance();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("dopost");
        String username = request.getParameter("userEmail");
        String password = request.getParameter("userPassword");
        String remember = request.getParameter("remember");
        System.out.println(remember);
        System.out.println("before select");
        User user = instance.login(username, password);
        System.out.println("after select");
        if (user != null) {
            if (remember != null) {
                if (remember.equals("remember")) {
                    Cookie cookie = new Cookie("shoppingCookie", user.getFirstName());
                    cookie.setMaxAge(24 * 60 * 60);
                    response.addCookie(cookie);
                    System.out.println("cookie created");
                    
                }
            }
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            System.out.println("session created");
            response.sendRedirect("index.jsp");
        } else {
            System.out.println("user not found ");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }

    }
    // updates

    //end of updates
}
