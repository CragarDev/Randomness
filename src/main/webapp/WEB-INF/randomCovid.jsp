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
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
							crossorigin="anonymous" />
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
							<a href="/" class="btn btn-success mt-2 float-end">Home</a>
							<div class="row">

								<div class="col text-center">
									<!-- <button class="btn btn-default"> Get Random</button> -->
									<br> <br>
									<br>
									<br>
									<h3>Country: <span class="text-info">United State of America</span></h3>
									<h3>Total Cases: <span class="text-info">X</span></h3>

									<a href="/randomCovid" class="btn btn-info text-center p-5 mt-5">GET RANDOM</a>
								</div>
								<%-- <h3>Country: <span class="text-info">${totalReportedCases }</span></h3> --%>

									<%-- <h3>Total Cases: <span class="text-info">${totalReportedCases }</span></h3>
										--%>
							</div>

							S





							<%-- <h1>"${locationStats}"</h1> --%>



								<%-- <table class="table table-blue table-striped table-hover">
									<thead>
										<tr>
											<th class"align-middle">State</th>
											<th class"align-middle">Country</th>
											<th class"align-middle">Total cases reported</th>
											<th class"align-middle">Changes since last year</th>

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


									</table> --%>

						</div><!-- End of Container -->


					</body>

					</html>