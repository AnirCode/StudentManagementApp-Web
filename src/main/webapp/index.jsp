<%@page import="java.util.List"%>
<%@page import="com.mycompany.studentmanagementapp.web.entities.Student"%>
<%@page import="com.mycompany.studentmanagementapp.web.dao.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>App | index</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!--Customized CSS-->
        <link rel="stylesheet" href="css/custom.css"/>

        <!--Font Awesome CSS-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>

        <%
            List<Student> studs = StudentDAO.displayStudent();
        %>



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

        <div class="container-fluid my-3 mx-0">
            <div class="row">
                <!--Side Menu-->
                <div class="col-sm-2">
                    <ul class="list-group text-center">
                        <li class="list-group-item bg-custom text-light" aria-current="true"><b>Menu</b></li>
                        <a href="addStudent.jsp" class="list-group-item list-group-item-info">Add Student</a>
                        
                    </ul>
                </div>

                <!--Main Conent-->
                <div class="col-sm-10">
                    <!--<div class="">-->

                    <table class="table table-responsive-sm">
                        <thead>
                            <tr class="bg-custom text-light">
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">City</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Student stud : studs) {
                            %>
                            <tr>
                                <th scope="row"> <%= stud.getId()%> </th>
                                <td><%= stud.getName()%></td>
                                <td><%= stud.getNumber()%></td>
                                <td><%= stud.getCity()%></td>
                                <td>
                                    <a href="updateStudent.jsp?stud_id=<%= stud.getId() %>" class="btn btn-warning">Update</a>
                                    <a href="deleteServlet?s_id=<%= stud.getId() %>" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <!--</div>-->
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    </body>
</html>