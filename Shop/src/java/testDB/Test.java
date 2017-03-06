/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testDB;

import database.DataBaseHandler;
import dto.CreditCard;
import dto.ImagesUrl;
import dto.Product;
import dto.User;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author Ahmed labib
 */
public class Test {

    public static void main(String args[]) {
        DataBaseHandler db = DataBaseHandler.getinstance();
        CreditCard card = new CreditCard(1234, LocalDate.now(), 10000);
        User u = new User("ahmed@gmail.com", "images/profile.jpg", "male", "ahmed", "labib", LocalDate.now(), "123", "012345678", "alex", "user", card);
        if (db.login("dina@gmail.com","123")!=null) 
        {
//            ImagesUrl otherimages = new ImagesUrl();
//            otherimages.addItem("image1");
//            ImagesUrl otherimages2 = new ImagesUrl();
//            otherimages2.addItem("image1");
//            otherimages2.addItem("image2");
//            otherimages2.addItem("image3");
//            ImagesUrl otherimages3 = new ImagesUrl();
//            otherimages3.addItem("image1");
//            otherimages3.addItem("image2");
//            otherimages3.addItem("image3");
//            ImagesUrl otherimages4 = new ImagesUrl();
//            otherimages4.addItem("image1");
//            otherimages4.addItem("image2");
//            otherimages4.addItem("image3");
//
//            Product newproduct = new Product("iphone", "themes/images/products/5.jpg", otherimages, 5, 10, "mobioe", 20, "phasdaone");
//            Product newproduct2 = new Product("samsung", "themes/images/products/6.jpg", otherimages2, 5, 20, "mobioe", 20, "phasdaone");
//            Product newproduct3 = new Product("hp", "themes/images/products/6.jpg", otherimages3, 5, 3, "mobioe", 20, "phasdaone");
//            Product newproduct4 = new Product("lenovo", "themes/images/products/5.jpg", otherimages4, 5, 2, "mobioe", 20, "phasdaone");
//            
//            Product newproduct5 = new Product("camera", "themes/images/products/5.jpg", otherimages4, 5, 2, "mobioe", 0, "COMPUTER");
//            
//            db.addProduct(newproduct5);
            ArrayList<Product> disproductArray = db.getAllproducts();
//            System.out.println(disproductArray.size());
            System.out.println(db.createOrder("dina@gmail.com", disproductArray));
            
        }
    }
}
