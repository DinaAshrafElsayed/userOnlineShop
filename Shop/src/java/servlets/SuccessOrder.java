/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.DataBaseHandler;
import dto.Product;
import dto.ShoppingCart;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dina Ashraf
 */
@WebServlet(name = "SuccessOrder", urlPatterns = {"/SuccessOrder"})
public class SuccessOrder extends HttpServlet {

    DataBaseHandler dataBaseHandler;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        this.dataBaseHandler = DataBaseHandler.getinstance();

    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ////checkout
            HttpSession session = request.getSession(true);
            ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
            User user = (User) session.getAttribute("user");
            if (shoppingCart != null) {
                //check avaliable quantity in database if it matches required
                boolean allAvaliable = true;
                for (Product product : shoppingCart.getProducts()) {
                    int avaliable = dataBaseHandler.getProduct(product.getId()).getQuantity();
                    if (product.getQuantity() > avaliable) {
                        allAvaliable = false;
                        break;
                    }
                }
                // if order is still avaliable
                if (allAvaliable) {
                    System.out.println("avaliable!");
                    ////create order and make status 1  (update order status)  
                    dataBaseHandler.createOrder(user.getEmail(), shoppingCart.getProducts());
                    dataBaseHandler.updateOrderStatus(user.getEmail(), 1);
                    //// update products quantity
                    for (Product product : shoppingCart.getProducts()) {
                         Product updatedProduct = dataBaseHandler.getProduct(product.getId());
                         updatedProduct.setQuantity(updatedProduct.getQuantity()-product.getQuantity());
                        dataBaseHandler.editQuantity(updatedProduct.getId(),updatedProduct.getQuantity());
                    }
                    //// update user balance
                    dataBaseHandler.updateUserBalance(user, (-1*shoppingCart.getTotalBill()));
                    //update products in session!
                    session.removeAttribute("products");
                    session.removeAttribute("cart");
                    //redirect to page with div that has this out successful order and back button!
                    response.sendRedirect("successOrder.jsp");
                }

                //else
                //// redirect to checkout servlet
                else
                {
                    System.out.println("not avaliable!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout");
                    dispatcher.forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
