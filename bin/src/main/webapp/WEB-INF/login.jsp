<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
    <!-- Here we have to import the Date class. -->
    <!-- You will put the import in the first line of the jsp tag. Use the import attribute -->

    <!-- c:out ; c:forEach ; c:if -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Formatting (like dates) -->
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>

                    <!DOCTYPE html>

                    <html class="h-100">

                    <head>
                        <meta charset="UTF-8" />
                        <title>Randomness:login/registration</title>
                        <!-- Bootstrap -->
                        <!-- CSS only -->
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                            crossorigin="anonymous" />
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
                            crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
                            crossorigin="anonymous"></script>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
                        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
                        <link rel="stylesheet" type="text/css" href="/css/style.css">
                    </head>

                    <body class="h-100">
                        <div class="bg110">
                            <!--  Nav START -->
                            <nav class="navbar navbar-expand-xl navbar-dark bg-dark">
                                <div class="container">

                                    <!-- Landing button -->
                                    <a class="navbar-brand" href="/"><img class="smallLogo"
                                            src="/images/landingPageItems/smallLogo.png" alt="logo"></a>

                                    <!-- Toggler for mobile/small screen -->
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#navbarWithDropdown" aria-controls="navbarWithDropdown"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>

                                    <!-- Collapsable nav bar -->
                                    <div class="collapse navbar-collapse show" id="navbarWithDropdown">
                                        <ul class="navbar-nav">

                                            <!-- Home/Index button -->
                                            <!-- <li class="nav-item">
                                            <a class="nav-link active" aria-current="page" href="/home">Home</a>
                                        </li> -->

                                            <!-- Login/Registration button -->
                                            <li class="nav-item">
                                                <a class="nav-link" href="/randomness/login">Login</a>
                                            </li>

                                            <!-- Logout button -->
                                            <li class="nav-item">
                                                <a class="nav-link" href="/randomness/logout">Logout</a>
                                            </li>

                                            <!-- Dashboard button -->
                                            <li class="nav-item">
                                                <a class="nav-link" href="/randomness/dashboard">Dashboard</a>
                                            </li>

                                            <!-- Dropdown buttons -->
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                                    role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Select A Page
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                    <li><a class="dropdown-item" href="/">Home</a></li>
                                                    <li><a class="dropdown-item" href="/randomness/login">Login</a></li>
                                                    <li><a class="dropdown-item" href="/randomness/logout">Logout</a>
                                                    </li>
                                                    <li><a class="dropdown-item"
                                                            href="/randomness/dashboard">Dashboard</a>
                                                    </li>

                                                    <!-- <li><a class="dropdown-item" href="/dashboard">ShowMany</a></li> -->
                                                    <!-- <li><a class="dropdown-item" href="/createOne">CreateOne</a></li> -->
                                                    <!-- <li><a class="dropdown-item" href="/updateOne">UpdateOne</a></li> -->
                                                    <!-- <li><a class="dropdown-item" href="/delete">DeleteOne</a></li> -->
                                                </ul>
                                            </li>
                                        </ul>
                                        <!-- Search Bar and button -->
                                        <div class="container float-end">
                                            <form class="d-flex float-end">
                                                <input class="form-control me-2" type="search" placeholder="Search"
                                                    aria-label="Search">
                                                <button class="btn btn-outline-warning" type="submit">Search</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                            <!--  Nav END -->
                            <!-- Main Container START -->
                            <main class="container w-75">
                                <!-- Error Messages -->
                                <h1 class="bg-light text-danger text-center mt-5">
                                    <c:out value="${error}" />
                                </h1>
                                <div class="container overlay rounded-3 p-3 pt-1 mt-5">
                                    <!-- Page Titles -->
                                    <div>

                                        <h1 class="text-center mb-5 mt-5 p-2 bg12 text-white rounded-3 shadow">Welcome
                                            --
                                            Please
                                            Log
                                            In or
                                            Register!
                                        </h1>
                                    </div>

                                    <p class="w-100"></p>

                                    <!-- Login/Registration Form START -->
                                    <div class="container d-flex g-4">

                                        <!-- ******************************************************-->
                                        <!-- ***************** Login form *************************-->
                                        <!-- ******************************************************-->

                                        <!-- Login START -->
                                        <div class="container bg-white h-50 p-3 rounded-3 shadow">
                                            <h2 class="Vintage-Play-4-rgba text-center Vintage-Play-2-rgba-bg mb-2 p-1">
                                                LogIn</h2>
                                            <form:form action="/randomness/login" method="post"
                                                modelAttribute="newLogin">
                                                <div class="form-group">
                                                    <label class="Vintage-Play-3-rgba">Email:</label>
                                                    <form:input path="email" class="form-control" />
                                                    <form:errors path="email" class="text-danger" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="Vintage-Play-3-rgba">Password:</label>
                                                    <form:password path="password" class="form-control" />
                                                    <form:errors path="password" class="text-danger" />
                                                </div>
                                                <input type="submit" value="Login"
                                                    class="btn Vintage-Play-2-rgba-bg Vintage-Play-4-rgba mt-3" />
                                            </form:form>
                                        </div>
                                        <!-- Login END -->


                                        <p class="w-25"></p>


                                        <!-- ******************************************************-->
                                        <!-- **************Registration form **********************-->
                                        <!-- ******************************************************-->

                                        <!-- Registration START -->
                                        <div class="container bg-white p-3 rounded-3 shadow">
                                            <h2 class="Vintage-Play-4-rgba-bg text-center Vintage-Play-2-rgba mb-2 p-1">
                                                Register</h2>
                                            <form:form action="/randomness/register" method="post"
                                                modelAttribute="newUser">
                                                <div class="form-group">
                                                    <label class="Vintage-Play-3-rgba">First Name:</label>
                                                    <form:input path="firstName" class="form-control" />
                                                    <form:errors path="firstName" class="text-danger" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="Vintage-Play-3-rgba">Last Name:</label>
                                                    <form:input path="lastName" class="form-control" />
                                                    <form:errors path="lastName" class="text-danger" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="Vintage-Play-3-rgba">Email:</label>
                                                    <form:input path="email" class="form-control" />
                                                    <form:errors path="email" class="text-danger" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="Vintage-Play-3-rgba">Password:</label>
                                                    <form:password path="password" class="form-control" />
                                                    <form:errors path="password" class="text-danger" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="Vintage-Play-3-rgba">Confirm Password:</label>
                                                    <form:password path="confirm" class="form-control" />
                                                    <form:errors path="confirm" class="text-danger" />
                                                </div>
                                                <input type="submit" value="Register"
                                                    class="btn Vintage-Play-4-rgba-bg Vintage-Play-2-rgba mt-3" />
                                            </form:form>
                                        </div>
                                        <!-- Registration END -->


                                    </div>
                                    <!-- Login/Registration Form END -->

                                    <p class="w-100"></p>
                                </div>
                            </main>
                            <!-- Main Container END -->

                        </div>

                        <script src="/js/app.js"></script>
                    </body>

                    </html>