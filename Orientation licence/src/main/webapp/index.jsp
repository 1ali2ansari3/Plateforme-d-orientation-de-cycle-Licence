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
        <h3>Orientation Licence</h3>
        <div id="error-message">
<%
String errorMessage = (String) request.getAttribute("errorMessage");
if (errorMessage != null) {
    %>
    <script>
    window.location.href = "http://localhost:8080/Orientation_licence/loginservlet#demo";
        
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






<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>Presse & Médias</h3>
            <a href="#"> <i class="fas fa-chevron-right"></i> 
            Communiqué de Presse </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> 
            Médias Audiovisuels</a>
            <a href="#"> <i class="fas fa-chevron-right"></i> 
            Presse Ecrite </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Revue de Presse </a>
           
        </div>

        <div class="box">
            <h3> Publications</h3>
            <a href="#"> <i class="fas fa-chevron-right"></i> Brochures & Dépliants </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Bulletins Infos </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Carrefours Hospitaliers </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Plans d'Actions </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Rapports d'Activités </a>
        </div>

        <div class="box">
            <h3>Annonces</h3>
            <a href="#"> <i class="fas fa-chevron-right"></i> Appels à Candidature</a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Appels d'Offres </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Concours de Recrutement </a>
            <a href="#"> <i class="fas fa-chevron-right"></i> Examens Professionnels </a>
            
        </div>

        <div class="box">
            <h3>Répertoire</h3>
            <a href="#"> <i class="fas fa-phone"></i> Agenda des Évènements </a>
            <a href="#"> <i class="fas fa-phone"></i> Annuaire </a>
            <a href="#"> <i class="fas fa-phone"></i> Liens Utiles </a>
            <a href="#"> <i class="fas fa-phone"></i> Messagerie Professionnelle </a>
            <a href="#"> <i class="fas fa-phone"></i> Photothèque </a>
        </div>

    </div>

    

</section>
</body>

</html>