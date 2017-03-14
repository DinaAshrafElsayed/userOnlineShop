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
@WebServlet(name = "GetCustomProduct", urlPatterns = {"/GetCustomProduct"})
public class GetCustomProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("q");
        DataBaseHandler instance = DataBaseHandler.getinstance();
        ArrayList<Product> rs = instance.getProducts(productName);
        request.setAttribute("name", rs);
        request.getRequestDispatcher("/CustomProduct.jsp").forward(request, response);

    }

}
