<%-- 
    Document   : showMyCart
    Created on : 03-Jun-2020, 23:02:10
    Author     : RIFAT
--%>

<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDao"%>
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








        <div style="margin-top: 2%; margin-left: 2%; margin-right: 2%;">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Product ID</th>
                        <th scope="col">Image</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Shipping Address</th>
                        <th scope="col">Operations</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        
                        ArrayList<Cart> list1 = dao.getCartByUserID(user.getId()) ;
                        Product p=new Product();
                        for (Cart c : list1) {
                            
                            p=dao.findProductByID(c.getPid());
                            
                    %>
                    <tr>
                        <th scope="row"><%= p.getId()%></th>
                        <td><img src="data:image/jpg;base64,<%= p.getBase64Image()%>" width="50" height="50"></td>
                        <td><%= p.getName()%></td>
                        <td>Book</td>
                        <td><%= p.getPrice()%></td>
                        <td><%= user.getAddress() %></td>
                        <td>
                            <a class="btn btn-warning" href="#" role="button">Update</a>
                            <a class="btn btn-danger" href="#" name="<%= p.getId() %>" role="button" style="margin-left: 10%;" >Delete</a>
                        </td>

                    </tr>
                    <%
                        }
                    %>
                </tbody>

            </table>

        </div>






        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    </body>
</html>
