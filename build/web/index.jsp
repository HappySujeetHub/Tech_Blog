
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <!--Banner-->
        <div class="container-fluid p-0 m-0 ">

            <div class="jumbotron text-white banner-background" id="primary-background1">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog </h3>
                    <p>Welcome to technical blog world of technology ,
                        A programming language is a system of notation for writing computer programs.</p>
                    <p>Programming languages are described in terms of their syntax (form) and semantics (meaning),usually defined by a formal language. Languages usually provide features such as a type system, variables and mechanisms for error handling.</p>
                    <p>Computer architecture has strongly influenced the design of programming languages, with the most common type (imperative languages—which implement operations in a specified order) developed to perform well on the popular von Neumann architecture. While early programming languages were closely tied to the hardware, over time, they have developed more abstraction to hide implementation details for greater simplicity.</p>

                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"> </span>  sp stars ! its free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"> </span> login</a>
                </div>
            </div>
        </div>

        <!--Card-->
        <div class="container">

            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Oracle Java is the #1 programming language and development platform. It reduces costs, shortens development timeframes, drives innovation, and improves application services. With millions of developers running more than 60 billion Java Virtual Machines worldwide, Java continues to be the development platform of choice for enterprises and developers.</p>
                            <a href="https://www.oracle.com/in/java/" class="btn primary-background text-white" target="_blank">read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. Its high-level built in data structures, combined with dynamic typing and dynamic binding, make it very attractive for Rapid Application Development, as well as for use as a scripting or glue language to connect existing components together. </p>
                            <a href="https://www.python.org/doc/essays/blurb/" class="btn primary-background text-white" target="_blank">read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">C++ Programming</h5>
                            <p class="card-text">C++ is a general purpose, case-sensitive, free-form programming language that supports object-oriented, procedural and generic programming.C++ is a middle-level language, as it encapsulates both high and low level language features.</p>
                            <a href="https://www.javatpoint.com/cpp-tutorial" class="btn primary-background text-white" target="_blank">read more</a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Data Structure</h5>
                            <p class="card-text">A data structure is a particular way of organising data in a computer so that it can be used effectively. The idea is to reduce the space and time complexities of different tasks. </p>
                            <a href="https://www.geeksforgeeks.org/introduction-to-data-structures/" class="btn primary-background text-white" target="_blank">read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">MySQL</h5>
                            <p class="card-text">MySQL is the world’s most popular open source database. According to DB-Engines, MySQL ranks as the second-most-popular database, behind Oracle Database. MySQL powers many of the most accessed applications, including Facebook, Twitter, Netflix, Uber, Airbnb, Shopify, and Booking.com.</p>
                            <a href="https://www.oracle.com/in/mysql/what-is-mysql/" class="btn primary-background text-white" target="_blank">read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Cloud Computing</h5>
                            <p class="card-text">Cloud computing and associated solutions provide access through the web to computing resources and products, including development tools, business applications, compute services, data storage, and networking solutions. These cloud services are hosted at a software vendor’s data center and managed by the cloud services provider or onsite at a customer's data center.</p>
                            <a href="https://www.oracle.com/in/cloud/what-is-cloud-computing/" class="btn primary-background text-white" target="_blank">read more</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- Java Script --> 
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--        <script src="js/myjs.js" type="text/javascript"></script>-->
        <script src="js/JavaScript.js" type="text/javascript"></script>
    </body>
</html>
