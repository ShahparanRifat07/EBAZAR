
package dao;

import helper.GetImage;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.Part;
import model.Cart;
import model.Category;
import model.Comment;
import model.Product;

/**
 *
 * @author RIFAT
 */
public class ProductDao {
    
    Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }
    
    public boolean addCategory(Category cat)
    {
        boolean f=false;
        
        try{
            
            String quary="insert into category(name,details) values(?,?)";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ps.setString(1, cat.getName());
            ps.setString(2, cat.getDetails());
            
            ps.executeUpdate();
            
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
        
    }
    
    public ArrayList<Category> getAllCategory()
    {
        ArrayList<Category> list=new ArrayList<>();
        
        try{
            
            String quary="select * from category";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String details=rs.getString("details");
                
                Category c=new Category(id,name,details);
                
                list.add(c);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
            
        return list;
    }
    
    
    public boolean saveProduct(Product p) {
        boolean f = false;

        try {
            String quary = "insert into product (cid,name,price,details,image) values (?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(quary);

            ps.setInt(1, p.getCid());
            ps.setString(2, p.getName());
            ps.setString(3, p.getPrice());
            ps.setString(4, p.getDetails());

            
            
            InputStream inputStream = null;

            Part image =null;
            image=p.getImage();

             if (image != null) {
                 
                 System.out.println(""+image.getSize());
                 inputStream = image.getInputStream();
             }
            
             if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                ps.setBlob(5, inputStream);
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
    
    
    public ArrayList<Product> getAllProduct()
    {
        ArrayList<Product> list=new ArrayList<>();
        
        try{
            
            String quary="select * from product";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String price=rs.getString("price");
                String details=rs.getString("details");
                
                Blob blob=rs.getBlob("image");

                String img=GetImage.getImage(blob);
                
                Product p=new Product(id,cid,name,price,details,img);
                
                list.add(p);

            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Category findCategoryByID(int id)
    {
        Category c=null;
        
        try{
            
            String quary="select * from category where id="+id;
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                c=new Category();
                
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDetails(rs.getString("details"));
            }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return c;
    }
    
    public Product findProductByID(int id)
    {
        Product p=null;
        
        try{
            
            String quary="select * from product where id="+id;
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                p=new Product();
                
                p.setId(rs.getInt("id"));
                p.setCid(rs.getInt("cid"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getString("price"));
                p.setDetails(rs.getString("details"));
                
                Blob blob=rs.getBlob("image");

                String img=GetImage.getImage(blob);
                
                p.setBase64Image(img);
            }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return p;
    }
    
    public boolean updateProduct(Product p)
    {
        boolean f=false;
        
        try{
            
            String quary="update product set cid=?,name=?,price=?,details=?,image=? where id="+p.getId();
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ps.setInt(1, p.getCid());
            ps.setString(2, p.getName());
            ps.setString(3, p.getPrice());
            ps.setString(4, p.getDetails());
            
            InputStream inputStream = null;

            Part image =null;
            image=p.getImage();

             if (image != null) {
                 
                 System.out.println(""+image.getSize());
                 inputStream = image.getInputStream();
             }
            
             if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                ps.setBlob(5, inputStream);
            }
            int row = ps.executeUpdate();
            if (row > 0) {
                String message = "File uploaded and saved into database";
            }
            f=true;
            
        }catch(Exception e)
        {
            
        }
        
        return f;
    }
    
    public boolean deleteProduct(Product p)
    {
        boolean f=false;
        
        try{
            
            String quary="delete from product where id="+p.getId();
            PreparedStatement ps=this.con.prepareStatement(quary);
            ps.executeUpdate();
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return f;
        
    }
    
    
        public ArrayList<Product> getAllProductByCategory(int catid)
    {
        ArrayList<Product> list=new ArrayList<>();
        
        try{
            
            String quary="select * from product where cid="+catid;
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String price=rs.getString("price");
                String details=rs.getString("details");
                
                Blob blob=rs.getBlob("image");

                String img=GetImage.getImage(blob);
                
                Product p=new Product(id,cid,name,price,details,img);
                
                list.add(p);

            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public ArrayList<Comment> getCommentsByProductID(int proid)
    {
        ArrayList<Comment> list=new ArrayList<>();
        
        try{
            
            String quary="select * from productcomments where pid="+proid;
            
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
    
    public boolean addCommentToProduct(Comment comment)
    {
        boolean f=false;
        
        try{
            
            String quary="insert into productcomments (pid,uid,comment) values(?,?,?)";
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
    
    
    public boolean addCart(Cart cart)
    {
        boolean f=false;
        
        try{
            
            String quary="insert into cart(pid,uid) values(?,?)";
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ps.setInt(1, cart.getPid() );
            ps.setInt(2, cart.getUid() );
            
            ps.executeUpdate();
            
            f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
        
    }
    
    
    
    public ArrayList<Cart> getCartByUserID(int userid)
    {
        ArrayList<Cart> list=new ArrayList<>();
        
        try{
            
            String quary="select * from cart where uid="+userid;
            
            PreparedStatement ps=this.con.prepareStatement(quary);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                int id=rs.getInt("id");
                int pid=rs.getInt("pid");
                int uid=rs.getInt("uid");
                
                Cart c=new Cart(id,uid,pid);
                
                list.add(c);
            }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
}
