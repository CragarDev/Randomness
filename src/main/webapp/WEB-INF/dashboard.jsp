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
                        <title>Randomness:dashboard</title>
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
                        <div class="bg111">
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
                                                <a class="nav-link Vintage-Play-4-hex"
                                                    href="/randomness/login">Login</a>
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
                                                    <li><a class="dropdown-item" href="/indexCovid">Random
                                                            Covid</a>
                                                    </li>
                                                    <li><a class="dropdown-item" href="/image/rand">Random
                                                            Picture</a>
                                                    </li>
                                                    <li><a class="dropdown-item" href="/randomness/weather">Random
                                                            Weather</a>
                                                    </li>
                                                    <li><a class="dropdown-item" href="/randomness/login">Login</a></li>
                                                    <li><a class="dropdown-item" href="/randomness/logout">Logout</a>
                                                    </li>
                                                    <li><a class="dropdown-item"
                                                            href="/randomness/dashboard">Dashboard</a>
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

                            <!-- Main container START -->
                            <main class="container text-center">

                                <!-- Page Title / start button START -->
                                <!-- <div class="mt-5">
                                    <h1 class="bg-success text-light ps-5">Welcome to Randomness</h1>
                                </div> -->
                                <!-- Page Title END -->

                                <p class="w-100"></p>

                                <!-- show user name on page START -->
                                <div>
                                    <h3 class="Vintage-Play-3-rgba-bg text-light p-3 h1">Welcome <span
                                            class="Vintage-Play-4-rgba">${loggedUser.firstName},</span> to the
                                        Randomness Dashboard</h3>
                                </div>
                                <!-- show user name on page END -->

                                <p class="w-100"></p>

                            </main>
                            <!-- Main container END -->
                        </div>

                        <script src="/js/app.js"></script>
                    </body>

                    </html>