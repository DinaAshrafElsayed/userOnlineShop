package servlets;

import database.DataBaseHandler;
import dto.ShoppingCart;
import dto.User;
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
            if (cooky.getName().equals("shoppingCookie")) {
                cooky.setMaxAge(0);
                response.addCookie(cooky);
                System.out.println("cookie deleted");
                break;
            }
        }
        User user=(User) request.getSession(false).getAttribute("user");
        ShoppingCart cart=(ShoppingCart) request.getSession(false).getAttribute("cart");
        if(user!= null && cart!=null){
            if(cart.getNumberOfItems()>0){
                DataBaseHandler dataBaseHandler=DataBaseHandler.getinstance();
                dataBaseHandler.createOrder(user.getEmail(), cart.getProducts());
            }
        }
        session.removeAttribute("user");
        System.out.println("user deleted");
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
