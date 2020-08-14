/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.servlet.http.Part;

/**
 *
 * @author RIFAT
 */
public class Product {
    
    int id;
    int cid;
    String name;
    String price;
    String details;
    Part image;
    String base64Image;

    public Product(int id, int cid, String name, String price, String details, Part image, String base64Image) {
        this.id = id;
        this.cid = cid;
        this.name = name;
        this.price = price;
        this.details = details;
        this.image = image;
        this.base64Image = base64Image;
    }

    public Product(int cid, String name, String price, String details, Part image) {
        this.cid = cid;
        this.name = name;
        this.price = price;
        this.details = details;
        this.image = image;
    }

    public Product(int id, int cid, String name, String price, String details, String base64Image) {
        this.id = id;
        this.cid = cid;
        this.name = name;
        this.price = price;
        this.details = details;
        this.base64Image = base64Image;
    }

    public Product(int id, int cid, String name, String price, String details, Part image) {
        this.id = id;
        this.cid = cid;
        this.name = name;
        this.price = price;
        this.details = details;
        this.image = image;
    }

    public Product(int id) {
        this.id = id;
    }
    
    

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Part getImage() {
        return image;
    }

    public void setImage(Part image) {
        this.image = image;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
    
    
    
}
