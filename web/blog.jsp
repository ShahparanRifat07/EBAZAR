<%-- 
    Document   : blog.jsp
    Created on : 29-May-2020, 14:47:19
    Author     : RIFAT
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PostDao"%>
<%@page import="model.Post"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>E-Shop</title>
    </head>
    <body>

        <!--navber-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">E-Shop  </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search </button>
                    </form>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            All Products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Computer</a>
                            <a class="dropdown-item" href="#">Mobile</a>
                            <a class="dropdown-item" href="#">Books</a>
                            <a class="dropdown-item" href="#">DVD</a>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="blog.jsp">Blogs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="usersingin.jsp">Sing-In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="usersingup.jsp">Sing-Up</a>
                    </li>
                </ul>
            </div>
        </nav>




        <div class="container">
            
            <h1 style="text-align: center" >BLOGS</h1>
            <div>

                <%
                    PostDao dao = new PostDao(ConnectionProvider.conProvider());
                    ArrayList<Post> list = dao.getAllPost();
                    UserDao uDao = new UserDao(ConnectionProvider.conProvider());
                    User u = new User();
                    for (Post p : list) {
                        u = uDao.getUserByID(p.getUid());
                %>   



                <div class="card" style="width: 35rem; margin:2% auto; text-align: center;">
                    <img src="data:image/jpg;base64,<%= p.getBase64Image()%>" width="240" height="300" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: left;"><%= u.getFirstName()%> <%= u.getLastName()%></h5>
                        <p class="card-text" style="text-align: left;"><%= p.getDetails()%></p>
                        <a href="usersingin.jsp" class="btn btn-primary" >Comment</a>
                    </div>
                </div>

                <%
                    }
                %>
            </div>

        </div>           









        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
