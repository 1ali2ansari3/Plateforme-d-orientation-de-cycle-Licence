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
      .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 30vh;
    }

    table {
        width: 100%;
        max-width: 600px;
        border-collapse: collapse;
        border: 1px solid #ccc;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        font-family: Arial, sans-serif;
    }

    th, td {
        padding: 20px;
        text-align: left;
        border-bottom: 1px solid #ccc;
        font-size: 24px;
        
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    h1 {
        margin: 0;
        font-size: 28px;
        padding: 10px;
        text-align: center;
    }

    .form-container tbody tr:last-child td {
        border-bottom: none;
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

   <h1 class="heading">Votre profil</h1>

   <div class="info">

      <div class="user">
      <img src="image/pic-1.jpg" class="image" alt="">
        
     <h3><%= name%> </h3>
         <p><%= l %></p>
     
   

   
   <section class="form-container">
	<table width="100%" height="400" border="1" cellspacing="0" cellpadding="5">
		<thead>
			<tr>
				<th colspan="2"><h1>Informations D'enseignant</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><strong>Nom : </strong></td>
				<td><%= name %></td>
			</tr>
			
			<tr>
				<td><strong>CIN : </strong></td>
				<td><%= l %></td>
			</tr>
			<tr>
				<td><strong>Filière : </strong></td>
				<td><%= F %></td>
			</tr>
		</tbody>
	</table>
</section>
     
   
   
   
     
      </div>
  </div>

</section>
















<!-- custom js file link  -->
<script src="js/script.js"></script>

   
</body>
</html>