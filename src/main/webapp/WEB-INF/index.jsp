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
                        <title>Randomness:landing</title>
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

                    <body id="bgImage" class="h-100">

                        <!--  Nav START -->
                        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                            <div class="container">

                                <!-- Landing button -->
                                <a class="navbar-brand" href="/randomness/landing"><img class="smallLogo"
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
                                        <!-- Login/Registration button -->
                                        <li class="nav-item">
                                            <a class="nav-link Vintage-Play-4-hex" href="/randomness/login">Login</a>
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
                                                <li><a class="dropdown-item" href="/randomness/dashboard">Dashboard</a>
                                                </li>
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
                        <!-- Top Section START -->
                        <section class="p-2 ">
                            <div class="container">
                                <div class="row g-5">

                                    <!-- Top Left Column -->
                                    <div class="col-3">
                                        <h3 class="text-light">We can put something here...</h3>
                                        <p class="lead text-light">Lorem ipsum dolor sit amet consectetur adipisicing
                                            elit.
                                            Aperiam, quod tenetur? Explicabo eveniet recusandae laboriosam!</p>

                                    </div>

                                    <!-- Top Middle Column -->
                                    <div class="col-6">

                                        <div class="container text-center">
                                            <h1 class="bg-warning text-dark text-center">Welcome to</h1>
                                            <img class="img-fluid" src="/images/LandingPageItems/logoName.png"
                                                alt="randomness">
                                        </div>
                                        <div class="text-center">
                                            <a class="btn btn-warning text-center mt-2" href="/">Start Randomizing
                                                Something!</a>
                                        </div>
                                    </div>

                                    <!-- Top Right Column -->
                                    <div class="col-3">
                                        <h3 class="text-light">We can put something here...</h3>
                                        <p class="lead text-light">Lorem ipsum dolor sit amet consectetur adipisicing
                                            elit.
                                            Aperiam, quod tenetur? Explicabo eveniet recusandae laboriosam!</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Top Section END -->

                        <p class="w-100"></p>

                        <!-- Middle Section START -->
                        <section class="p-2 mt-5">
                            <div class="container-fluid w-50 d-flex g-5 align-items-center justify-content-between p-5">


                                <!-- Middle Left Column -->
                                <div class="">

                                    <div class="container">
                                        <img class="img-fluid" src="/images/layout/parrot.jpeg" alt="parrot"
                                            width="420px">
                                    </div>


                                </div>

                                <!-- Middle Middle Column -->
                                <div class="">
                                    <div class="container">
                                        <img class="img-fluid" src="/images/layout/cat.jpeg" alt="cat" width="640px">
                                    </div>



                                </div>

                                <!-- Middle Right Column -->
                                <div class="">
                                    <div class="container">
                                        <img class="img-fluid" src="/images/layout/modano.jpeg" alt="modano"
                                            width="420px">
                                    </div>

                                </div>

                            </div>
                        </section>
                        <!-- Middle Section END -->

                        <p class="w-100"></p>

                        <!-- Bottom Section START -->
                        <section class="p-2 mt-5">
                            <div class="container-fluid w-50 d-flex g-5 align-items-center justify-content-between p-5">

                                <!-- Bottom Left Column -->
                                <div class="">

                                    <iframe width="427" height="240"
                                        src="https://www.youtube.com/embed/M5QY2_8704o"></iframe>
                                </div>

                                <!-- Bottom Middle Column -->
                                <div class="">

                                    <iframe width="427" height="240" src="https://www.youtube.com/embed/oTEiQx88B2U">
                                    </iframe>

                                </div>

                                <!-- Bottom Right Column -->
                                <div class="">

                                    <iframe width="427" height="240" src="https://www.youtube.com/embed/mtEJ3ePxWOw">
                                    </iframe>
                                </div>

                            </div>

                        </section>
                        <!-- Bottom Section END -->



                        <p class="w-100"></p>

                        <script src="/js/landingJS.js"></script>
                    </body>

                    </html>