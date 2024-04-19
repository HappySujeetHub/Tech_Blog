<%@page import="com.tech.blog.entiries.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entiries.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<div class="row">
    <%
        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<Post> post = null;
        if (cid == 0) {
            post = d.getAllPosts();
        } else {
            post = d.getPostCatId(cid);

        }

        if (post.size() == 0) {
            out.println("<h3 class='display-3 text-center text-white'>No Post in this category...</h3>");
        }
        for (Post p : post) {

    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blogs_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getpTitle()%></b>
                <p><%=p.getpContent()%></p>
            </div>
        </div>
        <div class="card-footer text-center" id="primary-background1">
            <%
                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
            %>
            <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter" ><%=ld.counLikeOnPost(p.getPid())%></span></i></a> 
            <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read more...</a> 
            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a> 
        </div>
    </div>
    <%
        }
    %>
</div>
