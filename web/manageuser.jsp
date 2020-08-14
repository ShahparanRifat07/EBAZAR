<%-- 
    Document   : manageuser
    Created on : 02-Jun-2020, 19:34:06
    Author     : RIFAT
--%>

<%@page import="model.User"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="dao.UserDao"%>
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
                        <a class="nav-link" href="manageuser.jsp">Manage User </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AdminLogOut">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>




        <div style="margin-top: 2%; margin-left: 2%; margin-right: 2%;">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Address</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Oparetions</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        UserDao dao = new UserDao(ConnectionProvider.conProvider());
                        ArrayList<User> list = dao.getAllUsers() ;
                        Category c = new Category();
                        for (User u : list) {
                            
                    %>
                    <tr>
                        <th scope="row"><%= u.getId()%></th>
                        <td><%= u.getFirstName() %> <%= u.getLastName() %></td>
                        
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getGender() %></td>
                        <td><%= u.getAddress() %></td>
                        <td><%= u.getPhone() %></td>
                        
                        <td>
                            <a class="btn btn-warning" href="<%=request.getContextPath()%>/useractivity.jsp?id=<%= u.getId()%>" role="button">Activity</a>
                            <a class="btn btn-danger" href="DeleteUser?id=<%= u.getId()%>" name="<%= u.getId()%>" role="button" style="margin-left: 10%;" >Delete</a>
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





    </body>
</html>
