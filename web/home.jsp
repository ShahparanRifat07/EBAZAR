<%-- 
    Document   : home
    Created on : 29-May-2020, 07:11:41
    Author     : RIFAT
--%>


<%@page import="model.Category"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {
        response.sendRedirect("usersingin.jsp");
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
            <a class="navbar-brand" href="home.jsp">E-Shop  </a>
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
                            <%
                                ProductDao dao = new ProductDao(ConnectionProvider.conProvider());
                                ArrayList<Category> list = dao.getAllCategory();
                                for (Category c : list) {
                            %>
                            <a class="dropdown-item" href="usershowproduct.jsp?cid=<%= c.getId()%>"><%= c.getName()%></a>
                            <%
                                }
                            %>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="blogs.jsp">Blogs</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= user.getLastName()%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Profile</a>
                            <a class="dropdown-item" href="#">Edit Profile</a>
                            <a class="dropdown-item" href="showMyCart.jsp">Cart</a>
                            <a class="dropdown-item" href="#">Posts</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserLogOut">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>









        <div style="margin-left: 2%; margin-right: 2%; margin-top: 2%;" >

            <div>
                <div class="row mt-4">


                    <div class="col-md-3">
                        <div class="list-group">
                            <a href="home.jsp" class="list-group-item list-group-item-action active selected disabled py-2">
                                All Product
                            </a>
                            <a href="#" class="list-group-item list-group-item-action  py-2">Latest Product</a>
                            <a href="" class="list-group-item list-group-item-action  py-2">Low to High</a>
                            <a href="#" class="list-group-item list-group-item-action  py-2">High to Low</a>
                        </div>

                    </div>




                    <div class="col-md-8">

                        <div class="row">


                            <%
                                ArrayList<Product> plist = dao.getAllProduct();

                                for (Product p : plist) {
                            %>

                            <div class="col-md-4">

                                <div class="card" style="width: 18rem; margin:2% auto; text-align: center;">
                                    <img src="data:image/jpg;base64,<%= p.getBase64Image()%>" width="150" height="200" class="card-img-top">
                                    <div class="card-body" style="background-color: rgb(211,211,211);">
                                        <h5 class="card-title" style="text-align: left;"><%= p.getName()%></h5>
                                        <p class="card-text" style="text-align: left;"><%= p.getPrice()%></p>
                                        <a href="showProductDetails.jsp?pid=<%= p.getId()%>" class="btn btn-primary" >Details</a>
                                        <a href="showProductDetails.jsp?pid=<%= p.getId()%>" class="btn btn-success" style="margin-left: 5%;">Cart</a>

                                    </div>
                                </div>

                            </div>

                            <%
                                }
                            %>

                        </div>


                    </div>

                </div>
            </div>

        </div>




        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        

    </body>
</html>
