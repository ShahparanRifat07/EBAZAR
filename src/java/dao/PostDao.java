/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import helper.GetImage;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import model.Comment;
import model.Post;

/**
 *
 * @author RIFAT
 */
@MultipartConfig
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public boolean savePost(Post post) {
        boolean f = false;

        try {
            String quary = "insert into post (uid, details, image) values (?, ?, ?)";
            PreparedStatement ps = this.con.prepareStatement(quary);

            ps.setInt(1, post.getUid());
            ps.setString(2, post.getDetails());

            
            
            InputStream inputStream = null;

            Part image =null;
            image=post.getImage();

             if (image != null) {
                 
                 System.out.println(""+image.getSize());
                 inputStream = image.getInputStream();
             }
            
             if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                ps.setBlob(3, inputStream);
            }
            int row = ps.executeUpdate();
            if (row > 0) {
                String message = "File uploaded and saved into database";
            }
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public ArrayList<Post> getAllPost()
    {
        ArrayList<Post> list=new ArrayList<>();
        
        try{
            
            String quary="select * from post order by id desc";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                int uid=rs.getInt("uid");
                String details=rs.getString("details");
                
                Blob blob=rs.getBlob("image");

                String img=GetImage.getImage(blob);
                
                Post post=new Post(id,uid,details,img);
                
                list.add(post);

            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Post showPostByID(int id)
    {
        Post post=null;
        
        try{
            
            String  quary="select * from post where id="+id;
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                post=new Post();
                
                post.setId(rs.getInt("id"));
                post.setUid(rs.getInt("uid"));
                post.setDetails(rs.getString("details"));
                
                Blob blob=rs.getBlob("image");

                String img=GetImage.getImage(blob);
                
                post.setBase64Image(img);
                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return post;
    }
    
    public boolean addCommentToPost(Comment comment)
    {
        boolean f=false;
        
        try{
            
            String quary="insert into postcomment(pid,uid,comment) values(?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ps.setInt(1, comment.getPid());
            ps.setInt(2, comment.getUid());
            ps.setString(3, comment.getComment());
            
            ps.executeUpdate();
            
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
        
    }
    
    public ArrayList<Comment> getCommentsByPostID(int postid)
    {
        ArrayList<Comment> list=new ArrayList<>();
        
        try{
            
            String quary="select * from postcomment where pid="+postid;
            
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                int pid=rs.getInt("pid");
                int uid=rs.getInt("uid");
                String comment=rs.getString("comment");
                
                Comment c=new Comment(id,uid,pid,comment);
                
                list.add(c);
            }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    
    public ArrayList<Post> getAllPostByUserID(int userid)
    {
        ArrayList<Post> list=new ArrayList<>();
        
        try{
            
            String quary="select * from post where uid="+userid;
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                int uid=rs.getInt("uid");
                String details=rs.getString("details");
                
                Blob blob=rs.getBlob("image");

                String img=GetImage.getImage(blob);
                
                Post post=new Post(id,uid,details,img);
                
                list.add(post);

            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean deletePost(Post p)
    {
        boolean f=false;
        
        try{
            
            String quary="delete from post where id="+p.getId();
            PreparedStatement ps=this.con.prepareStatement(quary);
            ps.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return f;
        
    }
    
    
    
}
