<%-- 
    Document   : eadmin.jsp
    Created on : 30-May-2020, 04:31:21
    Author     : RIFAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>E-Shop</title>
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">E-Shop  </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="usersingin.jsp">Sing-In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="usersingup.jsp">Sing-Up</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        
        
        <div class="container" >

            <div class="card" style="width: 30rem; text-align: center; margin: 3% auto;">

                <div class="card-header">
                    <h2>Admin Panel</h2>
                </div>
                <div class="card-body">

                    <form action="AdminLogin" method="post" >
                       
                        <div class="form-group">
                            <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Enter Your Email">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="exampleInputEmail1" name="password" placeholder="Enter Your Password">
                        </div>
                        
                        <div>
                        <button type="submit" class="btn btn-primary">Sing-In</button>
                        <div>
                    </form>


                </div>

            </div>

        </div>

        
        
        
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
