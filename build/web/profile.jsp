
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entiries.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entiries.Message"%>
<%@page import="com.tech.blog.entiries.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile page</title>
        <!-- css file-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- BootStrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 93%, 35% 100%, 0 93%, 0 0);
            }
             body{
                background-image: url(image/bg_img.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>

        <!--Strat Nav-Bar-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate"> </span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-bolt"> </span> Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"> </span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="https://en.wikipedia.org/wiki/Programming_language" target="_blank">Programming Language</a>
                            <a class="dropdown-item" href="https://www.masterclass.com/articles/project-implementation" target="_blank">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="https://www.geeksforgeeks.org/data-structures/" target="_blank">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"> </span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-Modal" ><span class="fa fa-bullseye"> </span> Add Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user-circle"> </span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"> </span> Logout</a>
                    </li>
                </ul>   
            </div>
        </nav>

        <!--end Nav-Bae-->

        <!--Start Show Message-->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%=m.getCssclass()%>" role="alert">
            <%= m.getContent()%>
        </div>   
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--End Of Message-->

        <!--Main Body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col!-->
                    <div class="col-md-4">
                        <!--Category--> 
                        <div class="list-group">
                            <a href="#" onclick="getPost(0, this )" class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--category-->
                            <%
                                PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = pd.getAllcategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPost(<%=cc.getCid()%> , this )" class=" c-link list-group-item list-group-item-action"><%=cc.getName()%></a>

                            <%
                                }
                            %>
                        </div>
                    </div>
                    <!--second col!-->
                    <div class="col-md-8">
                        <!--Post--> 
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-spin fa-4x"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div> 
                        <div class="container-fluid" id="post-container">
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--End the main body of the page-->

        <!--start profile-->

        <!-- Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header  primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="img/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50px; max-width: 100px;">

                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%=user.getName()%></h5>
                            <!--details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%=user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%=user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%=user.getDateTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>    

                            <!--Profile-edit-->

                            <div id="profile-edit" style="display:none;">
                                <h3 class="mt-2">Please Edit carefully</h3>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" name="user_email" class="form-control" value="<%=user.getEmail()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" name="user_name" class="form-control" value="<%=user.getName()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="password" name="user_password" class="form-control" value="<%=user.getPassword()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td><textarea rows="3" class="form-control" name="user_about"> <%=user.getAbout()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>New Profile Pic:</td>
                                            <td><input type="file" name="image" class="form-control"></td>
                                        </tr>
                                    </table> 
                                    <div class="container">
                                        <button class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-botton" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--End Profile-->
        <!--Add Post Model-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide The Post Details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="Post" enctype="multipart/form-data">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected="disabled">Select Category...</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllcategories();
                                        for (Category c : list) {
                                    %>

                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>

                                    <%
                                        }
                                    %>

                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode"class="form-control" style="height:200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic</label><br>
                                <input type="file" name="image" class="form-control"/> 
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End Post Model-->


        <!-- Java Script --> 
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/JavaScript.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                    $(document).ready(function () {
            let editStatus = false;
                    $('#edit-profile-botton').click(function () {

            if (editStatus == false)
            {
            $("#profile-details").hide()
                    $("#profile-edit").show()
                    editStatus = true;
                    $(this).text("Back")
            }
            else
            {
            $("#profile-details").show()
                    $("#profile-edit").hide()
                    editStatus = false;
                    $(this).text("Edit")
            }
        </script>
        <!--now add post js-->
        <script>
                    $(document).ready(function(e) {

            $("#add-post-form").on("submit", function(event) {
            //this code gets called when form is submitted...
            event.preventDefault();
                    console.log("you hava clicked on submit..")
                    let form = new FormData(this);
                    // now request.server

                    $.ajax({
                    url:"AddPostServlet",
                            type:"POST",
                            data:form,
                            success: function (data, textStatus, jqXHR){
                            console.log(data);
                                    if (data.trim() == 'done')
                            {
                            swal("Good Job!", "Saved Sucessfully!", "success");
                            }
                            else
                            {
                            swal("Error", "Something went wrong try again...", "error");
                            }
                            },
                            error: function (jqXHR, textStatus, errorThrown){
                            swal("Error", "Something went wrong try again...", "error");
                            },
                            processData: false,
                            contentType: false,
                    });
            })
            })
        </script>
        <!--loding post using ajax-->
        <script>
            function getPost(catId,temp){
                $('#loader').show();
                $('#post-container').hide();
                
                $(".c-link").removeClass('active')
                
                $.ajax({
                    url:"Load_posts.jsp",
                    data: {cid : catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            }
            $(document).ready(function (e){
                let allPostref=$('.c-link')[0]
               getPost(0,allPostref);
                
            })
        </script>      })
            })
        </script>
        <!--now add post js-->
        <script>
                    $(document).ready(function(e) {

            $("#add-post-form").on("submit", function(event) {
            //this code gets called when form is submitted...
            event.preventDefault();
                    console.log("you hava clicked on submit..")
                    let form = new FormData(this);
                    // now request.server

                    $.ajax({
                    url:"AddPostServlet",
                            type:"POST",
                            data:form,
                            success: function (data, textStatus, jqXHR){
                            console.log(data);
                                    if (data.trim() == 'done')
                            {
                            swal("Good Job!", "Saved Sucessfully!", "success");
                            }
                            else
                            {
                            swal("Error", "Something went wrong try again...", "error");
                            }
                            },
                            error: function (jqXHR, textStatus, errorThrown){
                            swal("Error", "Something went wrong try again...", "error");
                            },
                            processData: false,
                            contentType: false,
                    });
            })
            })
        </script>
        <!--loding post using ajax-->
        <script>
            function getPost(catId,temp){
                $('#loader').show();
                $('#post-container').hide();
                
                $(".c-link").removeClass('active')
                
                $.ajax({
                    url:"Load_posts.jsp",
                    data: {cid : catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            }
            $(document).ready(function (e){
                let allPostref=$('.c-link')[0]
               getPost(0,allPostref);
                
            })
        </script>
    </body>
</html>
