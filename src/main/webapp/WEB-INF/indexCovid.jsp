<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!-- c:out ; c:forEach ; c:if -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (like dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Covid Case</title>
    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div class="container">
      <!-- Beginning of Container -->


		<h1>Coronavirus Tracker Application</h1>
		<p>This application lists the current number of cases reported across the globe.</p>
		<h2 class="pl-0 pt-5 pb-5 mb-2 bg-dark text-white">Total Cases: <span class="text-info">${totalReportedCases }</span></h2>
	<%-- 	<h1>"${locationStats}"</h1> --%>
	
	<a href="randomCovid" class="btn btn-primary m-2">Magic Random</a>
		
			<table class ="table table-blue table-striped table-hover">
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
    				
    				<td><c:out value="${i.state}"></c:out> </td>
    				
    				<td> <c:out value="${i.country}"></c:out> </td>
    			
    				<td> <span class="text-info"><c:out value="${i.lastestTotalCases }"></c:out> </span></td>
    				<td> <span class="text-info"><c:out value="${i.diffFromPrevDay}"></c:out> </span></td>
    			
    			</tr>
    			</c:forEach>
    			</tbody>
    	
    	
    	</table>
	    	
	    </div><!-- End of Container -->

    
  </body>
</html>