/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Dina Ashraf
 */
public class ImagesUrl implements Serializable {

    private ArrayList<String> imagesUrl = new ArrayList<>();

    /**
     * @return the imagesUrl
     */
    public boolean addItem(String url) {
        return imagesUrl.add(url);
    }

    public ArrayList<String> getImagesUrl() {
        return imagesUrl;
    }

    // updates
    //end of updates
}
