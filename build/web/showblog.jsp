<%-- 
    Document   : showblog
    Created on : 29-May-2020, 15:05:20
    Author     : RIFAT
--%>


<%@page import="model.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Comment"%>
<%@page import="dao.PostDao"%>
<%@page import="model.Post"%>
<%@page import="dao.UserDao"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="helper.ConnectionProvider"%>
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
                            <a class="dropdown-item" href="#">Computer</a>
                            <a class="dropdown-item" href="#">Mobile</a>
                            <a class="dropdown-item" href="#">Books</a>
                            <a class="dropdown-item" href="#">DVD</a>

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




        <div class="container">
            <div>
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    PostDao dao = new PostDao(ConnectionProvider.conProvider());
                    Post p = dao.showPostByID(id);
                    UserDao uDao = new UserDao(ConnectionProvider.conProvider());
                    User u = uDao.getUserByID(p.getUid());
                %>   



                <div class="card" style="width: 35rem; margin:2% auto; text-align: center;">
                    <img src="data:image/jpg;base64,<%= p.getBase64Image()%>" width="240" height="300" class="card-img-top">
                    <div class="card-body" style="background-color: rgb(211,211,211);">
                        <h5 class="card-title" style="text-align: left;"><%= u.getFirstName()%> <%= u.getLastName()%></h5>
                        <p class="card-text" style="text-align: left;"><%= p.getDetails()%></p>
                        <a href="showblog.jsp?id=<%= p.getId()%>" class="btn btn-primary" >Comment</a>
                    </div>
                </div>
            </div>
                    
                    
                    


            <div>

                <div style="text-align: center; margin: 3% auto;"><h1>Add a Comment</h1></div>

            </div>
                    
                    
                    

            <div class="card" style="width: 35rem; margin: 3% auto; ">
                <div class="card-body">
                    <form action="PostComment" method="post">

                        <input type="hidden" id="custId" name="uid" value="<%= user.getId()%>">
                        <input type="hidden" id="custId" name="pid" value="<%= id%>">
                        <div class="form-group">

                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" placeholder="Write Comment here"></textarea>
                        </div>
                        <div style="text-align: center;">
                            <button type="submit" class="btn btn-primary">Post</button>
                        </div>
                    </form>

                </div>
            </div>
                        
                        
                        

            <div>
                <%
                    ArrayList<Comment> list=dao.getCommentsByPostID(id);
                    User ur=new User();
                    
                    for(Comment c: list)
                    {
                        ur=uDao.getUserByID(c.getUid());
                %>
                
                <div class="card" style="width: 35rem; margin: 1% auto; ">
                    <div class="card-body " style="border: 1px solid black">
                        <h6><%= ur.getFirstName() %></h6>
                        <p><%= c.getComment() %></p>
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
