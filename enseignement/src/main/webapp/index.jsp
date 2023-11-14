<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <!-- font awesome cdn link  -->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="login.css">
	
</head>



<body>

<header class="header">

    <a href="#" class="logo">         
    	<img src="image/LOGO_FST.png" alt="">
    </a>

    <nav class="navbar">
        <a href="#home">FST ERR</a>
        
    </nav>

    <div id="menu-btn" class="fas fa-bars"></div>

</header>

<section class="home" id="home">

    <div class="image">
        <img src="image/errachidia.png" alt="">
    </div>

    <div class="content">
        <h3>espace d'enseignant</h3>
        <div id="error-message">
<%
String errorMessage = (String) request.getAttribute("errorMessage");
if (errorMessage != null) {
    %>
    <script>
    window.location.href = "http://localhost:8080/enseignement/loginservlet#demo";
        
    </script>
    <%
}
%>
        </div>
        <p>Nous sommes ravis de vous informer que les inscriptions pour la licence à la Faculté des Sciences et Techniques d'Errachidia sont désormais ouvertes. Pour obtenir davantage d'informations, veuillez vous rendre sur notre site web.</p>
        <a href="#demo" class="btn"> Login <span class="fas fa-chevron-right"></span> </a>
    </div>


</section>

<div class="book" id="demo" >
    <div class="row" >
        <div class="image">
            <img src="image/home-img.svg" alt="">
        </div>

        <form action="loginservlet" method="post" >
           <% if(errorMessage != null) {%>
           <h3><%= errorMessage %></h3>
           <%} else{%>
            <h3>Authentification</h3><%} %>
            <input type="text" placeholder="CIN" class="box" name="CIN" required>
            <input type="password" placeholder="YYYY-MM-DD" class="box" name="password" required>
            
            <input type="submit" name="Authentification" value="Connexion" class="btn">
        </form>
        
       <a href="#" class="modal_close">&times</a>
    </div>

</div>







</body>

</html>