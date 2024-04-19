package com.tech.blog.dao;

import com.tech.blog.entiries.Category;
import com.tech.blog.entiries.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllcategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "select * from category";
            Statement stmt = this.con.createStatement();
            ResultSet rst = stmt.executeQuery(q);
            while (rst.next()) {
                int cid = rst.getInt("cid");
                String name = rst.getString("name");
                String description = rst.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//   Get all the Post
    public ArrayList<Post> getAllPosts() {

        ArrayList<Post> list = new ArrayList<>();
        //Featch all the post 
        try {

            PreparedStatement p = con.prepareStatement("SELECT * FROM post order by pid desc");
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public ArrayList<Post> getPostCatId(int catId) {
        ArrayList<Post> list = new ArrayList<>();
        //Fetch all post by id
        try {
            PreparedStatement p = con.prepareStatement("select * from post where catId=?");
            p.setInt(1, catId);
            ResultSet rst = p.executeQuery();
            while (rst.next()) {
                int pid = rst.getInt("pid");
                String pTitle = rst.getString("pTitle");
                String pContent = rst.getString("pContent");
                String pCode = rst.getString("pCode");
                String pPic = rst.getString("pPic");
                Timestamp date = rst.getTimestamp("pDate");

                int userId = rst.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        try {
            String q = "select * from post where pid=?";
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet r = p.executeQuery();

            if (r.next()) {
                int pid = r.getInt("pid");
                String pTitle = r.getString("pTitle");
                String pContent = r.getString("pContent");
                String pCode = r.getString("pCode");
                String pPic = r.getString("pPic");
                Timestamp date = r.getTimestamp("pDate");

                int catId = r.getInt("catId");
                int userId = r.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;

    }
}
