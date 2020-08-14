/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author RIFAT
 */
public class Cart {

    int id;
    int uid;
    int pid;

    public Cart(int id, int uid, int pid) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
    }

    public Cart(int uid, int pid) {
        this.uid = uid;
        this.pid = pid;
    }
    
    
    
    public Cart() {
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

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
    
    
}
