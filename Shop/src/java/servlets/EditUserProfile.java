/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.DataBaseHandler;
import dto.CreditCard;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed labib
 */
@WebServlet(name = "EditUserProfile", urlPatterns = {"/EditUserProfile"})
public class EditUserProfile extends HttpServlet {

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
            User oldUser = (User) request.getSession(false).getAttribute("user");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            //String email = request.getParameter("email");
            String DateOfBirth = request.getParameter("DateOfBirth");
            System.out.println("register " + DateOfBirth);
            LocalDate localDate = LocalDate.parse(DateOfBirth);
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            long creditCardNumber = Long.parseLong(request.getParameter("creditCardNumber"));
            String creditCardExpireDate = request.getParameter("creditCardExpireDate");
            LocalDate creditCardExpireDate1 = LocalDate.parse(creditCardExpireDate);
            CreditCard creditCard = new CreditCard(creditCardNumber, creditCardExpireDate1, 1000);
            // set the value in the editeduser object 
            //oldUser.setEmail(email);
            oldUser.setFirstName(firstName);
            oldUser.setLastName(lastName);
            oldUser.setGender(gender);
            oldUser.setPhone(mobile);
            oldUser.setbDate(localDate);
            oldUser.setCreditCard(creditCard);
            oldUser.setAddress(address);
            if (dataBaseHandler.editUserDetials(oldUser)) {
                User editedUser = dataBaseHandler.getUser(oldUser.getEmail());
                request.getSession(false).setAttribute("user", editedUser);
            }
            response.sendRedirect("FullUserProfile.jsp");
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
