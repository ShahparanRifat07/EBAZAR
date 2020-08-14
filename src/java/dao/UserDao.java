
package dao;

import helper.GetImage;
import java.sql.*;
import java.util.ArrayList;
import model.Product;
import model.User;


public class UserDao {
    
    Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user)
    {
        boolean f=false;
        
        try{
            
            String quary="insert into user(fname,lname,email,address,phone,gender,password) values (?,?,?,?,?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getPassword());
            
            ps.executeUpdate();
            
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public User findUserByEmailAndPassword(String email, String password)
    {
     
        User user=null;
        
        try{
            
            String quary="select * from user where email=? and password=?";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                user=new User();
                
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("fname"));
                user.setLastName(rs.getString("lname"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setPassword(rs.getString("password"));
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
        
    }
    
    public User getUserByID(int uid)
    {
        User user=null;
        
        try{
            
            String quary="select * from user where id="+uid;
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                user=new User();
                
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("fname"));
                user.setLastName(rs.getString("lname"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setPassword(rs.getString("password"));
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    public ArrayList<User> getAllUsers()
    {
        ArrayList<User> list=new ArrayList<>();
        
        try{
            
            String quary="select * from user";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                String fname=rs.getString("fname");
                String lname=rs.getString("lname");
                String email=rs.getString("email");
                String address=rs.getString("address");
                String phone=rs.getString("phone");
                String gender=rs.getString("gender");
                String password=rs.getString("password");
                
                
                User u=new User(id,fname,lname,email,address,phone,gender,password);
                
                list.add(u);

            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean deleteUser(User u)
    {
        boolean f=false;
        
        try{
            
            String quary="delete from user where id="+u.getId();
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
