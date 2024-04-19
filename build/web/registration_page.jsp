

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration page</title>
        <!-- css file-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- BootStrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 93%, 35% 100%, 0 93%, 0 0);
            }
        </style> 
    </head>
    <body>

        <!--NavBar-->
        <%@include file="Nav_Bar.jsp" %>

        <!--Form Tag-->
        <main class="banner-background" id="primary-background1" style="padding-bottom:50px;">
            <div class="container">

                <div class="col-md-4 offset-md-4">

                    <div class="card">

                        <div class="card-header text-center text-white" id="primary-background1">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <p>Register Hear</p>
                        </div>

                        <div class="card-body">

                            <form id="reg-form" action="Singup" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Name</label>
                                    <input type="user_name" name="user_name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter user name">                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="pswd" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label><br>
                                    <input type="radio" id="gender" name="gender" value="Male">Male
                                    <input type="radio" id="gender" name="gender" value="Female">Female
                                </div>

                                <div class="from-group">
                                    <input type="textarea" name="about" class="form-control" id="" rows="5" placeholder="Enter something about your self"><br> 
                                </div>

                                <div class="form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and condition</label>
                                </div><br>
                                <div class="container text-center" id="loder" style="display:none">
                                <span class="fa fa-refresh fa-spin fa-3x"></span>
                                <h4>Please wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </main>


        <!-- Java Script --> 
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/JavaScript.js" type="text/javascript"></script>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                
                 console.log("loding...");
                 $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    let form=new FormData(this);
                    
                    $("#submit-btn").hide();
                    $("#loder").show();
                // Send to servlet
                    
                    $.ajax({
                        url:"Singup",
                        type:"POST",
                        data:form,
                        success: function (data,textStatus,jqXHR){
                          console.log(data); 
                          $("#submit-btn").show();
                           $("#loder").hide();
                          
                          if(data.trim()=== 'done')
                          {
                              swal("Registration Sucessfully", "You clicked the button!", "success")
                                   .then((value)=>{
                                       window.location="login_page.jsp";
                                   });
                           }
                         else
                         {
                           swal(data);
                         }
                        },
                        error: function (jqXHR,textStatus,errorThrown){
                          console.log(jqXHR); 
                          $("#submit-btn").show();
                           $("#loder").hide();
                           swal("Something went wrong", "Try again!", "success");
                        },
                        processData: false,  
                        contentType: false,
    
                       
                    });
                    
                    
                })
                
              })
        </script>

    </body>
</html>
