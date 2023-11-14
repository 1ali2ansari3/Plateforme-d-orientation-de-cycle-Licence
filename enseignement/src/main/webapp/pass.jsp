<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.PreparedStatement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.util.ArrayList" %>  

<%

String auth = (String)request.getSession(false).getAttribute("authentifier");
if(!auth.equals("oui")){
		response.sendRedirect("index.jsp");		
		
}

%>

   
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>profile</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

<style>
	.change-password-form {
  width: 300px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f7f7f7;
}

.change-password-form label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
}

.change-password-form input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.change-password-form input[type="submit"] {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.change-password-form input[type="submit"]:hover {
  background-color: #45a049;
}
	

    .form-container {
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f7f7f7;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    .form-container table {
        width: 100%;
        border-collapse: collapse;
    }

    .form-container th, .form-container td {
        padding: 10px;
        text-align: left;
    }

    .form-container th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    .form-container td:first-child {
        width: 120px;
        font-weight: bold;
    }
     .form-container td {
        padding: 10px;
        text-align: left;
        width: 150px; /* Ajoutez cette ligne pour spécifier la largeur */
        font-size: 16px;
    }
    
</style>




</head>
<body>
<%
	 String l = request.getParameter("CIN");

	 if(l==null)  { l = request.getParameter("l");} 
	 
	 String name = null;
	 String F = null;
	
	 try {	
		    //charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `enseignement` WHERE `CIN`= '"+l+"'");
			//parcourt des données
			if(res.next()){
				name = res.getString(2);
				F = res.getString(3);
				
			}
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>
<header class="header"> 
   
   <section class="flex">

      <a href="#" class="logo">Espace D'enseignant <%= F %></a>

    

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="search-btn" class="fas fa-search"></div>
         <div id="user-btn" class="fas fa-user"></div>
         <div id="toggle-btn" class="fas fa-sun"></div>
      </div>

      <div class="profile">
     
      <img src="image/pic-1.jpg" class="image" alt="">
        
     
         <h3 class="name"><%= name%></h3>
         <p class="role"><%= l%></p>
      <a href="pass.jsp?l=<%= l %>" class="btn">Changer le mot de pass</a>
         <div class="flex-btn">
            <a href="logoutservlet" class="option-btn">déconnexion</a>
         </div>
      </div>

   </section>

</header>   

<div class="side-bar">

   <div id="close-btn">
      <i class="fas fa-times"></i>
   </div>

   <div class="profile">
   
      <img src="image/pic-1.jpg" class="image" alt="">
  
      <h3 class="name"><%= name%> </h3>
      <p class="role"><%= l %></p>
      <a href="profel.jsp?l=<%= l %>" class="btn">Profil</a>
   </div>

   <nav class="navbar">
      
      <a href="list.jsp?l=<%= l %>"><i class="fas fa-graduation-cap"></i><span>list des étudiant</span></a>
      <a href="OR.jsp?l=<%= l %>"><i class="fas fa-chalkboard-user"></i><span>list <%=F%></span></a>
      
   </nav>

</div>



<section class="user-profile">


   		<form class="change-password-form" action="changeservlet" method="post" >
		  <label for="old-password">Ancien mot de passe:</label>
		  <input type="password" id="old-password" name="old-password" required>
		
		  <label for="new-password">Nouveau mot de passe:</label>
		  <input type="password" id="new-password" name="new-password" required>
		
		  <label for="new-password">Confirmez le nouveau mot de passe:</label>
		  <input type="password" id="new-password" name="new-password2" required>
		  
		      <input type="hidden" name="CIN" value="<%= l %>">
		  
		  
		  <input type="submit" value="Changer le mot de passe">
		</form>
     
     
  
</section>
















<!-- custom js file link  -->
<script src="js/script.js"></script>

   
</body>
</html>