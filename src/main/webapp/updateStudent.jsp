<%@page import="com.mycompany.studentmanagementapp.web.entities.Student"%>
<%@page import="com.mycompany.studentmanagementapp.web.dao.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    int sid = Integer.parseInt(request.getParameter("stud_id"));
    Student s = StudentDAO.getStudentById(sid);
    
%>



<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update Student | App</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!--Customized CSS-->
        <link rel="stylesheet" href="css/custom.css"/>

        <!--Font Awesome CSS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom sticky-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><b>Student Management App</b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
        <!--Navbar ending-->

        <div class="container my-5">
            <div class="row">
                <div class="offset-sm-3 col-sm-6">
                    <div class="card">
                        <div class="card-header text-center display-6 bg-custom text-light">
                            <p><span class="fa fa-user-plus"></span> <b>Update Student</b></p>
                        </div>
                        <form action="updateStudentServlet" method="post">
                            <div class="card-body">
                                
                                 <div class="mb-3">
                                    <input type="text" class="form-control" id="sid" aria-describedby="emailHelp" name="sid" placeholder="Student Id" value ="<%= s.getId()%>"readonly >
                                </div> 
                                
                                
                                <div class="mb-3">
                                    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" placeholder="Update Name" value ="<%= s.getName()%>" >
                                </div> 
                                <div class="mb-3">
                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Update Phone Number"value ="<%=s.getNumber()%>">
                                </div>

                                <div class="form-floating mb-3">
                                    <textarea class="form-control" name="city" id="city" style="height: 100px"><%=s.getCity()%></textarea>
                                    <label for="address"> Update Address</label>
                                </div>

                            </div>
                            <div class="card-footer text-center">
                                <button type="submit" class="btn btn-outline-success">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>


    </body>
</html>
