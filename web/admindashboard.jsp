<%-- 
    Document   : admindashboard
    Created on : 30-May-2020, 06:53:56
    Author     : RIFAT
--%>

<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Admin admin=(Admin)session.getAttribute("CurrentAdmin");
    if(admin==null)
    {
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
            <a class="navbar-brand" href="admindashboard.jsp">E-Shop <br>Admin Panel(<%= admin.getName() %>) </a>
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
                        
                        
        <h1><%= admin.getName() %></h1>
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
