/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import database.DataBaseHandler;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import javax.swing.text.NumberFormatter;

/**
 *
 * @author Dina Ashraf
 */
public class ShoppingCart {

    ArrayList<Product> products = new ArrayList<>();
    private double totalBill;
    private boolean allAvaliable;

    /**
     * @return the products
     */
    public ArrayList<Product> getProducts() {
        return products;
    }

    public int getQuantityOfProduct(int productID) {
        int quantity = 0;
        for (Product product : products) {
            if (productID == product.getId()) {
                quantity = product.getQuantity();
            }
        }
        return quantity;
    }

    public boolean addItem(Product product) {
        if (increaseQuantity(product.getId(), product.getQuantity())) {
            System.out.println("exists");
            return true;
        } else {
            DataBaseHandler databaseRef = DataBaseHandler.getinstance();
            Product avaliableProduct = databaseRef.getProduct(product.getId());
            if (avaliableProduct.getQuantity() >= product.getQuantity()) {
                System.out.println("new");
                return products.add(product);
            } else {
                return false;
            }
        }

    }

    public int getNumberOfItems() {
        int numberOfProducts = 0;
        for (Product product : products) {
            numberOfProducts += product.getQuantity();
            System.out.println("qunatity of product x " + product.getQuantity());
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
            price += (product.getPrice() * product.getQuantity() * ((100 - product.getDiscount()) / 100));
        }
        return price;
    }

    public double totalDiscount() {
        double discount = 0.0;
        for (Product product : products) {
            discount += (product.getPrice() * product.getQuantity() * (product.getDiscount() / 100));
        }
        return discount;
    }

    public boolean increaseQuantity(int productID, int quantity) {
        DataBaseHandler databaseRef = DataBaseHandler.getinstance();
        Product avaliableProduct = databaseRef.getProduct(productID);
        for (Product product : products) {
            if (productID == product.getId()) {
                if (avaliableProduct.getQuantity() >= (product.getQuantity() + quantity)) {
                    product.setQuantity(product.getQuantity() + quantity);
                    System.out.println("in inc " + product.getQuantity());
                    return true;
                } else {
                    return false;
                }
            }
        }
        return false;
    }

    public boolean decreaseQuantity(int productID) {
        for (Product product : products) {
            if (productID == product.getId()) {
                if (product.getQuantity() > 1) {
                    System.out.println(">1");
                    product.setQuantity(product.getQuantity() - 1);
                    return true;
                } else {
                    return products.remove(product);
                }
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

    /**
     * @return the totalBill
     */
    public double getTotalBill() {
        return totalBill;
    }

    /**
     * @param totalBill the totalBill to set
     */
    public void setTotalBill(double totalBill) {
        this.totalBill = totalBill;
    }

    /**
     * @return the allAvaliable
     */
    public boolean isAllAvaliable() {
        return allAvaliable;
    }

    /**
     * @param allAvaliable the allAvaliable to set
     */
    public void setAllAvaliable(boolean allAvaliable) {
        this.allAvaliable = allAvaliable;
    }

}
