
package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entiries.User;



public class UserDao {
    
   private Connection con;

    public UserDao(Connection con)
    {
        this.con=con;
    }

    //method to insert to data base
    
    public boolean saveUser(User user)
    {
        boolean f= false;
        try
        {
            String quary="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
          PreparedStatement pstmt=this.con.prepareStatement(quary);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            pstmt.setString(5,user.getAbout());
            
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
       return f;
    }
   
    // get user by useremail and password
    public User getUserByEmailAndPassword(String email,String password){
    User user=null;
    
    try
    {
        String quary="select * from user where email=? and password=?";
        PreparedStatement pstmt=con.prepareStatement(quary);
        pstmt.setString(1,email);
        pstmt.setString(2,password);
        ResultSet rst=pstmt.executeQuery();
        if(rst.next())
        {
            user=new User();
            // data from db
            String name=rst.getString("name");
            //set the user object
            user.setName(name);
            
           
           user.setId(rst.getInt("id"));
           user.setEmail(rst.getString("email"));
           user.setPassword(rst.getString("password"));
           user.setGender(rst.getString("gender"));
           user.setAbout(rst.getString("about"));
          user.setDateTime(rst.getTimestamp("rdate").toString());
          user.setProfile(rst.getString("profile"));
        }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
        
        return user;
    }

    // Code for UpdateUser
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        try
        {
            String quary="update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
            PreparedStatement pstmt=con.prepareStatement(quary);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            pstmt.setString(5,user.getAbout());
            pstmt.setString(6,user.getProfile());
            pstmt.setInt(7,user.getId());
            
            pstmt.executeUpdate();
            f=true;
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
       return f;
                
    }
    
    public  User getUserByUserId(int userId)
    {
        User user=null;
        try
        {
         String q="select * from user where id=?";
         PreparedStatement p=con.prepareStatement(q);
         p.setInt(1, userId);
         ResultSet rst=p.executeQuery();
         if(rst.next())
         {
            user=new User();
            // data from db
            String name=rst.getString("name");
            //set the user object
            user.setName(name);
            
           
           user.setId(rst.getInt("id"));
           user.setEmail(rst.getString("email"));
           user.setPassword(rst.getString("password"));
           user.setGender(rst.getString("gender"));
           user.setAbout(rst.getString("about"));
          user.setDateTime(rst.getTimestamp("rdate").toString());
          user.setProfile(rst.getString("profile"));
         
         }
         
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
       return user;   
    }
}
