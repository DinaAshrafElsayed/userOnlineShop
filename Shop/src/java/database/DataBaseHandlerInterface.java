/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import dto.Orders;
import dto.Product;
import dto.ShoppingCart;
import dto.User;
import java.util.ArrayList;

/**
 *
 * @author Dina Ashraf
 */
public interface DataBaseHandlerInterface {

    public boolean checkEmailExistance(String email); // done 

    public boolean signup(User user); //done

    public User login(String email, String password);//done

    public ArrayList<Product> searchProducts(String category, String productName, double productPrice);

    public ArrayList<Product> getAllproducts();//done

    public boolean editUserDetials(User user);//done

    public double getUserBalance(String email);//done

    public boolean updateUserBalance(User user, double addedBalance);//done

    public boolean createOrder(String email, ArrayList<Product> products);

    //inside the class that implements that interface
    //private boolean addProductsToOrder(int orderID, ArrayList<Product> products);
    public boolean checkProductNameExistance(String productName);//done
    //we delete or update the order status which status == 0
    //in destruction of session event save shopping cart(order) if items!=0

    public boolean updateOrderStatus(String email, int status);

    public boolean DeleteOrder(String email);

    public Product getProduct(int productID);//done

    public ArrayList<Product> getDiscountedProducts();//done

    public boolean CheckCreditCardNumberExistance(long number);//done

    // updates
    public ArrayList<Orders> GetUserOrders(String email);

    public ArrayList<String> getUserThatHasOrders();

    public boolean CheckRechargeNumberExistance(int rechargeCardNumber);
    //end of updates 

    // dina update
    public ShoppingCart getUnboughtOrder(String email);
    // end dina update
}
