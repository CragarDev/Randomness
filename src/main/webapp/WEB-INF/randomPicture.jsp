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
					<style>
						body {
							background-image: url("/images/bgs/LandingBG107.png");
						}
					</style>

					<body class="h-100 text-white">
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
						<div>
							<div class="container">
								<div class="row justify-content-center">
									<div class="col-12 text-center text-warning">
										<h1>Random Image</h1>
									</div>
								</div>
							</div>
							<hr>

							<div id="mainForm" class="container w-50 p-2" style="background-color:rgba(0, 0, 0, 0.7);">
								<div class="row justify-content-center m-3">
									<div class="col-12 text-center pb-2">
										<h2>Artist: ${Image.artist}</h2>
									</div>
								</div>
								<hr>
								<div class="row justify-content-center text-center pb-2 px-4">
									<div class="col">
										<p>nsfw rating: ${Image.nsfwRating}%</p>
									</div>
									<div class="col">
										<p>Categories: ${Image.category}</p>
									</div>
								</div>

								<div class="row justify-content-center text-center px-4">
									<h2 style="background-color:rgba(155, 0, 0, 0.7);">${searchError}</h2>
									<img class="border border-warning border-5" src=${Image.url} alt=""
										style="width:100%; height:auto; padding:0;">
								</div>
								<br>
								<div class="row justify-content-center text-center pb-3">
									<div class="col-2">
										<a class="btn btn-primary" href="#">Save Image</a>
									</div>
								</div>
							</div>
							<div class="row justify-content-center text-center pb-3 pt-3">
								<div class="col-2 ">
									<a onclick="load()" class="shadow btn btn-success" href="/image/rand">Get Random
										Image</a>
								</div>
								<div class="col-2">
									<form action="/image/search/">
										<input onclick="load()" class="btn btn-success mb-1" type="submit" name="submit"
											value="Get Image with Keyword">
										<input type="text" name="query" />
									</form>
								</div>
							</div>
							<div class="container text-center justify-content-center align-items-center" id="loadScreen"
								style="display: none;">
								<div class="mt-5">
									<h2 class="text-center" style="margin: 0 auto">Loading, Please Wait</h2>
									<img src="/images/loading/giphy.gif" alt="" style="margin: 0 auto">
								</div>
							</div>
						</div>

						<script>
							function load() {
								mainForm = document.getElementById("mainForm")
								loadScreen = document.getElementById("loadScreen")
								mainForm.style.display = "none"
								loadScreen.style.display = "block"
							}
						</script>
					</body>



					</html>