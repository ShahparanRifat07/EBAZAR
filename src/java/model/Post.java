/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;



/**
 *
 * @author RIFAT
 */
@MultipartConfig
public class Post {
    
    int id;
    int uid;
    int pid;
    String details;
    Part image;
    String base64Image;

    public Post(int id, int uid, String details, Part image, String base64Image) {
        this.id = id;
        this.uid = uid;
        this.details = details;
        this.image = image;
        this.base64Image = base64Image;
    }

    public Post(int uid, String details, Part image) {
        this.uid = uid;
        this.details = details;
        this.image = image;
    }

    public Post(int id, int uid, String details, String base64Image) {
        this.id = id;
        this.uid = uid;
        this.details = details;
        this.base64Image = base64Image;
    }

    public Post(int id) {
        this.id = id;
    }
    
    
    
    

    public Post() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
    
    
    
}
