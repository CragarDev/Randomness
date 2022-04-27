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

                        <!-- style for the background of the Weather div -->
                        <style>
                            .bgWeather {
                                background-image: url("/images/weatherBackgrounds/${wad.icon}.png");
                                background-repeat: no-repeat;
                                width: 460px;
                                min-height: 460px;
                                background-size: cover;
                                background-position: center;
                                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                            }
                        </style>

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
                                                <li><a class="dropdown-item" href="/randomness/weather">Weather</a>
                                                </li>
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


                                    <!-- --------- Weather section ------------- -->
                                    <div class="container">
                                        <!-- 
                                        <img class="img-fluid" src="/images/layout/weatherLayout.png" alt="weather"
                                            width="600px"> -->

                                        <!-- Weather section START -->
                                        <section class="p-5">
                                            <div class="container bgWeather">
                                                <!-- Top bar -->
                                                <div class="row">
                                                    <h1 class="text-center text-dark bg-warning">
                                                        <c:out value="${wad.city}"></c:out>, <span
                                                            class="h4 text-secondary">
                                                            <c:out value="${wad.state}">
                                                            </c:out>
                                                        </span>
                                                    </h1>
                                                </div>
                                                <!-- middle row -->
                                                <div class="d-flex">

                                                    <div class="col">
                                                        <h1
                                                            class="p-1 mt-2 text-center align-self-center text-danger fw-bold bg-light bg-opacity-50 display-4 rounded-pill">
                                                            <c:out value="${wad.temperature}°"></c:out>
                                                        </h1>
                                                    </div>
                                                </div>
                                                <!-- bottom row -->
                                                <div class="mt-5">
                                                    <div class="text-light mt-3 float-end mb-2">
                                                        <p>low: <c:out value="${wad.lows}°"></c:out><br>
                                                            high: <c:out value="${wad.highs}°"></c:out><br>
                                                            windSpeed: <c:out value="${wad.windSpeed}"></c:out><br>
                                                            humidity: <c:out value="${wad.humidity}°"></c:out><br>
                                                            feels like: <c:out value="${wad.feelsLike}°"></c:out><br>
                                                            longitude: <c:out value="${wad.longitude}"></c:out><br>
                                                            latitude: <c:out value="${wad.latitude}"></c:out><br>
                                                            zipcode: <c:out value="${wad.zip}"></c:out><br>
                                                            <a class="btn btn-outline-info" href="/">Randomize</a>
                                                            <br>
                                                        </p>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="float-start ps-1 mt-4">
                                                    <div class="mt-5">
                                                        <br class="mt-5">
                                                        <h3 class="mt-5 align-self-bottom text-light">
                                                            <c:out value="${wad.condition}"></c:out><br><span
                                                                class="mt-5 text-warning">
                                                                <c:out value="${wad.description}"></c:out>
                                                        </h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- button to randomize -->
                                        </section>
                                        <!-- Weather section END -->


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

                        <script src="/js/app.js"></script>
                        <script src="/js/landingJS.js"></script>
                    </body>

                    </html>