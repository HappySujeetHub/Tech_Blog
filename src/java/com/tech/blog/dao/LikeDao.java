package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertlike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into liketab(postId,userId) values(?,?)";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int counLikeOnPost(int pid) {
        int count = 0;
        try {
            String q = " select count(*) from liketab where postId=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet rst = p.executeQuery();
            if (rst.next()) {
                count = rst.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean isLikeByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = con.prepareStatement("SELECT * FROM liketab WHERE postId=? AND userId=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet rst = p.executeQuery();
            if (rst.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
        }
    
    public boolean deleteLike(int pid,int uid){
        boolean f=false;
        try
        {
          PreparedStatement p=con.prepareStatement("delete from liketab where postId=? and userId=?");
          p.setInt(1, pid);
          p.setInt(2, uid);
          p.executeUpdate();
          f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
        
    }

}
