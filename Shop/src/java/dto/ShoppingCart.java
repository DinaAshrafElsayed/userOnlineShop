/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;

/**
 *
 * @author Dina Ashraf
 */
public class ShoppingCart {

    ArrayList<Product> products = new ArrayList<>();

    /**
     * @return the products
     */
    public ArrayList<Product> getProducts() {
        return products;
    }

    public boolean addItem(Product product) {
        if (increaseQuantity(product.getId(), product.getQuantity())) {
            System.out.println("exists");
            return true;
        } else {
            System.out.println("new");
            return products.add(product);
        }
    }

    public int getNumberOfItems() {
        int numberOfProducts = 0;
        for (Product product : products) {
            numberOfProducts += product.getQuantity();
            System.out.println("qunatity of product x "+product.getQuantity());
        }
        return numberOfProducts;
    }

    public double totalPrice() {
        double price = 0.0;
        for (Product product : products) {
            price += (product.getPrice() * product.getQuantity());
        }
        return price;
    }
    public double totalPriceWithDiscount() {
        double price = 0.0;
        for (Product product : products) {
            price += (product.getPrice() * product.getQuantity() * ((100 - product.getDiscount())/100));
        }
        return price;
    }
    public double totalDiscount() {
        double discount = 0.0;
        for (Product product : products) {
            discount += (product.getPrice() * product.getQuantity() * (product.getDiscount()/100));
        }
        return discount;
    }
    public boolean increaseQuantity(int productID,int quantity) {
        for (Product product : products) {
            if (productID == product.getId()) {
                product.setQuantity(product.getQuantity() + quantity);
                System.out.println("in inc "+product.getQuantity());
                return true;
            }
        }
        return false;
    }

    public boolean decreaseQuantity(int productID) {
        for (Product product : products) {
            if (productID == product.getId()) {
                product.setQuantity(product.getQuantity() - 1);
                return true;
            }
        }
        return false;
    }

    public boolean removeProduct(int productID) {
        for (Product product : products) {
            if (productID == product.getId()) {
                return products.remove(product);
            }
        }
        return false;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" + "products=" + products + '}';
    }
    
}
