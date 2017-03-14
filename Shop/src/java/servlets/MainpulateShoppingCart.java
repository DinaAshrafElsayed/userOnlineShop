/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dto.Product;
import dto.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "MainpulateShoppingCart", urlPatterns = {"/MainpulateShoppingCart"})
public class MainpulateShoppingCart extends HttpServlet {

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
            int productID = Integer.parseInt(request.getParameter("productID"));
            String requestedFunction = request.getParameter("method");
            System.out.println(requestedFunction);
            HttpSession session = request.getSession(true);
            ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
            int quantity = 0;
            if (requestedFunction.equals("increase")) {
                System.out.println("inc : " + productID);
                boolean added = shoppingCart.increaseQuantity(productID, 1);
                out.print(added);
                if (added) {
                    quantity = 1;
                }
            } else if (requestedFunction.equals("decrease")) {
                System.out.println("dec : " + productID);
                boolean removed = shoppingCart.decreaseQuantity(productID);
                out.print(removed);
                if (removed) {
                    quantity = -1;
                }
            } else {
                System.out.println("rem : " + productID);
                int quantityOfProduct = shoppingCart.getQuantityOfProduct(productID);
                boolean removed = shoppingCart.removeProduct(productID);
                out.print(removed);
                if (removed) {
                    quantity = -1 * quantityOfProduct;
                }
                System.out.println("removed " + quantity + " items ");
            }
            ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
            for (Product product1 : products) {
                if (product1.getId() == productID) {
                    product1.setQuantity(product1.getQuantity() - quantity);
                }
            }
            session.setAttribute("products", products);
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
