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

<body class="h-100 text-white">
<div class="bg107">
	<div class="container ">
		<div class="row justify-content-center">
			<div class="col-12 text-center text-warning">
				<h1>Random Image</h1>
			</div>
		</div>
	</div>
	<hr>
	<div class="container w-50 p-2" style="background-color:rgba(0, 0, 0, 0.7);">
		<div class="row justify-content-center">
			<div class="col-12 text-center pb-2">
				<h2>Artist: ${Image.artist}</h2>
			</div>
		</div>
		<hr>
		<div class="row justify-content-center text-center pb-2">
			<div class="col">
				<p>nsfw rating: ${Image.nsfwRating}%</p>
			</div>
			<div class="col">
				<p>Categories: ${Image.category}</p>
			</div>
		</div>
		<div class="row justify-content-center text-center">
			<img class="border border-warning border-5" src=${Image.url} alt="" style="width:80%; height:auto; padding:0;">
		</div>
		<br>
		<div class="row justify-content-center text-center pb-3">
			<div class="col-2">
				<a class="btn btn-primary" href="#">Save Image</a>
			</div>
		</div>
	</div>
	<div class="row justify-content-center text-center pt-3">
		<div class="col-2 ">
			<a class="shadow btn btn-success" href="/image/rand">Get Random Image</a>
		</div>
		<div class="col-2">
			<a class="shadow btn btn-success" href="#">Get Image with Keyword</a>
		</div>
	</div>
</div>
</body>

</html>