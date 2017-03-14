/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlet;

import database.DataBaseHandler;
import dto.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BOSHA
 */
@WebServlet(name = "GetProducts2", urlPatterns = {"/GetProducts2"})
public class GetProducts2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataBaseHandler instance = DataBaseHandler.getinstance();
        ArrayList<Product> products = instance.getProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("AllProduct.jsp").forward(request, response);

    }

}
