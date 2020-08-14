/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Comment {
    
    int id;
    int uid;
    int pid;
    String comment;

    public Comment(int id, int uid, int pid, String comment) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.comment = comment;
    }

    public Comment(int uid, int pid, String comment) {
        this.uid = uid;
        this.pid = pid;
        this.comment = comment;
    }
    
    

    public Comment() {
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
    
}
