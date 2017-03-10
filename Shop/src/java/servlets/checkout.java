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
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

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
            //get shopping cart
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
                //if yes
                if (allAvaliable) {
                    shoppingCart.setAllAvaliable(true);
                    ////get total bill to see if he need to recharge
                    double total = shoppingCart.totalPriceWithDiscount();
                    shoppingCart.setTotalBill(total);
                    // all these steps in jsp we would use if as in product summary
                    ////show recharge as in product summary if balance not enough that he needs to recharge
                    //// after the balance is enough 2 options check out or cancel

                } else if (!allAvaliable) {
                    shoppingCart.setAllAvaliable(false);
                    //if quantity not enough show avaliable of each
                    // update the shopping cart
                    for (Product product : shoppingCart.getProducts()) {
                        int avaliable = dataBaseHandler.getProduct(product.getId()).getQuantity();
                        if (product.getQuantity() > avaliable) {
                            // Supposedly should show that some of his ordered products wasnt avaliable as required
                            // using allAvaliable attribute in shopping cart
                            if (avaliable > 0) {
                                product.setQuantity(avaliable);
                            } else {
                                shoppingCart.removeProduct(product.getId());
                            }
                        }
                    }
                    ////get total bill to see if he need to recharge
                    double total = shoppingCart.totalPriceWithDiscount();
                    shoppingCart.setTotalBill(total);
                    // all in jsp 
                    ////show recharge as in product summary if balance not enough that he needs to recharge
                    //// after the balance is enough 2 options check out or cancel
                }
                System.out.println(shoppingCart.getTotalBill());
                session.setAttribute("cart", shoppingCart);
                response.sendRedirect("checkout.jsp");
                ////checkout
                ////create order and make status 1  (update order)   
                //// update products quantity
                //// update user balance
                ////cancel --> go back to index 
                
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
