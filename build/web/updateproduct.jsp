<%-- 
    Document   : updateproduct
    Created on : 31-May-2020, 08:56:47
    Author     : RIFAT
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.ConnectionProvider"%>
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
                        <a class="nav-link" href="#">Manage User </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AdminLogOut">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>



        <div class="container">
            <div class="card" style="width: 30rem; text-align: center; margin: 3% auto;">

                <div class="card-header">
                    <h2>Add Product</h2>
                </div>
                <div class="card-body">

                    <form action="UpdateProduct" method="post" enctype="multipart/form-data" >

                        <div class="form-group">
                            <select class="form-control" name="cid" >
                                <option selected disabled >*--Select Category--</option>
                                <%
                                    ProductDao dao = new ProductDao(ConnectionProvider.conProvider());
                                    ArrayList<Category> list = dao.getAllCategory();
                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getId()%>"><%= c.getName()%></option>
                                <%
                                    }
                                %>

                            </select>
                        </div>
                                
                                
                        <%
                            int id=Integer.parseInt(request.getParameter("id"));
                            Product p=dao.findProductByID(id);
                        %>

                        <input type="hidden" id="custId" name="id" value="<%= id %>">
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputEmail1" name="name" value="<%= p.getName() %>" >
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputEmail1" name="price" value="<%= p.getPrice() %>" >
                        </div>
                        <div class="form-group">

                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="details" placeholder="<%= p.getDetails() %>" ></textarea>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlFile1">* Reupload Your Image: </label>
                            <input type="file" class="form-control-file" name="image" id="exampleFormControlFile1">
                        </div>

                        <div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
