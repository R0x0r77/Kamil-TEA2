<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Create account</title>
<link rel="stylesheet" href="Styles/CreateAccountStyle.css" type="text/css">
</head>
<body>

<%
String incorrectInput = (String) request.getAttribute("incorrect input");
if (incorrectInput != null)
	out.println(incorrectInput);
%>
<br><br>

<form action="CreateAccountServlet" method="post" class="hhe">
	<div class="container">
		<label for="firstName">First Name: </label> <br>
		<input type="text" name="firstName" placeholder="Enter First Name"> <br>
		
		<label for="lastName">Last Name: </label> <br>
		<input type="text" name="lastName" placeholder="Enter Last Name"> <br>
		
		<label for="loginName">Login Name: </label> <br>
		<input type="text" name="loginName" placeholder="Enter Login Name"> <br>
		
		<label for="password">Password: </label> <br>
		<input type="password" name="password" placeholder="Enter Password"> <br>
		
		<input type="password" name="repeatPassword" placeholder="Repeat Password"> <br>
	</div>
	
	<div class="cancel/submit">
		<button type="button" class="buttonCancel" onclick="window.history.back()">Cancel</button>
		<button type="submit" class="buttonSignUp">Sign Up</button>
	</div>
</form>

</body>
</html>