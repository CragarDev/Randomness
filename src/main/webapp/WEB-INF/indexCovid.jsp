<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!-- c:out ; c:forEach ; c:if -->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!-- Formatting (like dates) -->
		<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!-- form:form -->
			<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<!-- for rendering errors on PUT routes -->
				<%@ page isErrorPage="true" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8" />
						<title>Covid Case</title>
						<!-- Bootstrap -->

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


					</head>

					<body>

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
						<div class="container">
							<!-- Beginning of Container -->


							<h1>Coronavirus Tracker Application</h1>
							<p>This application lists the current number of cases reported across the globe.</p>
							<h2 class="pl-0 pt-5 pb-5 mb-2 bg-dark text-white">Total Cases: <span
									class="text-info">${totalReportedCases }</span></h2>
							<%-- <h1>"${locationStats}"</h1> --%>

								<a href="randomCovid" class="btn btn-primary m-2">Magic Random</a>

								<table class="table table-blue table-striped table-hover">
									<thead>
										<tr>
											<th class="align-middle">State</th>
											<th class="align-middle">Country</th>
											<th class="align-middle">Total cases reported</th>
											<th class="align-middle">Changes since last year</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${locationStats}">
											<tr>

												<td>
													<c:out value="${i.state}"></c:out>
												</td>

												<td>
													<c:out value="${i.country}"></c:out>
												</td>

												<td> <span class="text-info">
														<c:out value="${i.lastestTotalCases }"></c:out>
													</span></td>
												<td> <span class="text-info">
														<c:out value="${i.diffFromPrevDay}"></c:out>
													</span></td>

											</tr>
										</c:forEach>
									</tbody>


								</table>

						</div><!-- End of Container -->


					</body>

					</html>