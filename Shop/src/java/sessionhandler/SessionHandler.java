/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionhandler;

import database.DataBaseHandler;
import dto.ShoppingCart;
import dto.User;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author Ahmed labib
 */
public class SessionHandler implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("start of removing session ");
        User user = (User) se.getSession().getAttribute("user");
        ShoppingCart cart = (ShoppingCart) se.getSession().getAttribute("cart");
        if (user != null && cart != null) {
            if (cart.getNumberOfItems() > 0) {
                DataBaseHandler dataBaseHandler = DataBaseHandler.getinstance();
                dataBaseHandler.createOrder(user.getEmail(), cart.getProducts());
            }
        }
    }
}
