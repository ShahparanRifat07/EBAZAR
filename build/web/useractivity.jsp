<%-- 
    Document   : useractivity
    Created on : 02-Jun-2020, 20:28:43
    Author     : RIFAT
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="model.Post"%>
<%@page import="dao.PostDao"%>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Admin admin = (Admin) session.getAttribute("CurrentAdmin");
    if (admin == null) {
        response.sendRedirect("eadmin.jsp");
    }
%>
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
            <a class="navbar-brand" href="admindashboard.jsp">E-Shop <br>Admin Panel(<%= admin.getName()%>) </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="createadmin.jsp">Create Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addcategory.jsp">Add Category </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addproduct.jsp">Add Product </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageproduct.jsp">Manage Product </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageuser.jsp">Manage User </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AdminLogOut">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>



        <div class="container">


            <div class="row mt-4">
                <div class="col-md-4">

                    <div>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                        %>
                        
                        <div class="list-group">
                            <a href="" class="list-group-item list-group-item-action active selected disabled py-2">
                                All Posts
                            </a>
                            <a href="viewallcomment.jsp?id=<%= id %>" class="list-group-item list-group-item-action  py-2">All Comments</a>
                            <a href="#" class="list-group-item list-group-item-action  py-2">All Carts</a>
                            <a href="#" class="list-group-item list-group-item-action  py-2">Send Message</a>
                        </div>
                    </div>


                </div>







                <div class="col-md-8">
                    <div>

                        <%
                            
                            PostDao dao = new PostDao(ConnectionProvider.conProvider());
                            ArrayList<Post> list = dao.getAllPostByUserID(id);
                            UserDao uDao = new UserDao(ConnectionProvider.conProvider());
                            User u = new User();
                            for (Post p : list) {
                                u = uDao.getUserByID(p.getUid());
                        %>   



                       
                        <div class="card" style="width: 27rem; margin:2% auto; text-align: center;">
                            
                            <img src="data:image/jpg;base64,<%= p.getBase64Image()%>" width="200" height="250" class="card-img-top">
                            <div class="card-body" style="background-color: rgb(211,211,211);" >
                                <h5 class="card-title" style="text-align: left;"><%= u.getFirstName()%> <%= u.getLastName()%></h5>
                                <p class="card-text" style="text-align: left;"><%= p.getDetails()%></p>
                                
                                <a href="DeletePost?pid=<%= p.getId()%>&uid=<%= id %>" class="btn btn-danger" >Delete</a>
                            </div>
                        </div>
                        

                        <%
                            }
                        %>

                    </div>
                </div>


            </div>



        </div>





        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <style>
            .clsScroll{
                height: 300px;
                width: 300px;
                background: yellow;
                overflow-x: hidden;
                overflow-y: auto;
            }
        </style>

    </body>
</html>
