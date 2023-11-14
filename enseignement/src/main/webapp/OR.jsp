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
  .bouton-droite {
  	margin-left: 83%;
  	
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
  }
  
  .tableau {
    width: 100%;
    border-collapse: collapse;
  }

  .tableau td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
    font-size: 16px;
  }
   table {
    border-collapse: collapse;
    width: 100%;
  }
  
  th, td {
  font-size: 16px;
    border: 1px solid black;
    padding: 8px;
    text-align: center;
  }
  
  th {
    background-color: #f2f2f2;
    font-size: 18px;
  }
   h1 {
    font-size: 22px;
  }
  
  .colonne1, .colonne3 {
    width: 20%;
  }
   .div-travail {
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      padding: 20px;
      text-align: center;
      font-size: 18px;
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
			if(res.next()) {
				name = res.getString(2);
				   F = res.getString(3);
			}
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>
<header class="header">
   
   <section class="flex">

      <a href="#" class="logo">Espace D'enseignant <b><%=F%></b></a>

    

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
  
      <h3 class="name"><%= name %> </h3>
      <p class="role"><%= l %></p>
      <a href="profel.jsp?l=<%= l %>" class="btn">Profil</a>
   </div>

   <nav class="navbar">
  
   
      <a href="list.jsp?l=<%= l %>"><i class="fas fa-graduation-cap"></i><span>list des étudiant</span></a>
      <a href="OR.jsp?l=<%= l %>"><i class="fas fa-chalkboard-user"></i><span>list <%=F%></span></a>
      
      
   </nav>

</div>

 <%
     int i = 1;
 	 try {
 		 	
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT TR FROM `filier` WHERE `TYPEF`= '"+F+"'");
			//parcourt des données
			res.next();
		
			Statement st1 = con.createStatement();
			//créer une requete de sélection
			ResultSet res1 = st1.executeQuery("SELECT * FROM `filier` WHERE `TR`= '"+res.getString(1)+"'");
			
			  while(res1.next()){	
			   i++;
	          }
				
			con.close();
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}	   	 

   
%>

 

<section class="user-profile">
<%
       String dj = null ;
	   try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT Finalise FROM `enseignement` WHERE `CIN`= '"+l+"'");
			//parcourt des données
			if(res.next()) {
	            dj= res.getString(1);
		    }
			con.close();
			
		    }catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>

<%  if(dj.equals("0")){ %>

   <div class="info">
		
		      <img src="image/LOGO_FST.png" class="image" alt="">
		<br>
		<br>
		
      <h1 style="color: blue; text-align: center;">Liste des étudiants orientés en licence :   <%=F%></h1>
	  <h2 style="color: black; text-align: center;">Année universitaire 2023-2024</h1>
		
		<br><br>
		
		<table>
			  <tr>
			    <th class="colonne1">CNE</th>
			    <th>NOM</th>
			     <th>Deust</th>
			     <th>MoyGD</th>
			    
			  </tr>
			  
			   <%
 	 try {
 		 	
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `etudiant` WHERE `SP`= '"+F+"'");
			//parcourt des données
			
			  while(res.next()){	
				  
				  String A =res.getString(2);
				  String B =res.getString(3);
				  String C =res.getString(7);
				  String D =res.getString(8);
				  String E =res.getString(9);

				
				 %>
				 <tr>
			     <td class="colonne1"><%=A%></td>
			     <td><%=B%></td>
			     <td><% if (C.equals("1")) { out.print("oui"); } else { out.print("non"); } %> </td>
			     <td><% if (D == null) { out.print(""); } else { out.print(D); } %></td>
			    </tr>
				 <%   
				 
	          }
				
			con.close();
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}	   	 

       %>
			  
			  
		
			  
		</table>
		<br><br>
		

<a href="Finaliservlet?l=<%=l%>">
  <input class="bouton-droite" type="button" name="finaly" value="Finalise le orientation">
</a>	 
		
		
   </div>
   
   <% }else{ %>
      <div class="info">
      	<div class="div-travail">
		      Orientation terminé
		</div>
		<br>
		
		      <img src="image/LOGO_FST.png" class="image" alt="">
		<br>
		<br>
		
      <h1 style="color: blue; text-align: center;">Liste des étudiants orientés en licence :   <%=F%></h1>
	  <h2 style="color: black; text-align: center;">Année universitaire 2023-2024</h2>
	
		<br><br>
		
		<table>
		      <tr>
			     <th class="colonne1">CNE</th>
			     <th>Nom</th>
			     <th>Deust</th>
			     <th>MoyGD</th>
			     
			  </tr>
			  
			   <%
 	 try {
 		 	
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `etudiant` WHERE `SP`= '"+F+"'");
			//parcourt des données
			 while(res.next()){	
				  
				  String A =res.getString(2);
				  String B =res.getString(3);
				  String C =res.getString(7);
				  String D =res.getString(8);
				  String E =res.getString(9);

				  
				
				 %>
				  <tr>
			     <td class="colonne1"><%=A%></td>
			     <td><%=B%></td>
			     <td><% if (C.equals("1")) { out.print("oui"); } else { out.print("non"); } %> </td>
			     <td><% if (D == null) { out.print(""); } else { out.print(D); } %></td>
			    </tr>
				 
				 
				 <%   
	          }
				
			con.close();
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}	   	 

      %>
			  
			  
		
			  
		</table>
		<br>
				<br>
		
	<a href="pdf.jsp?l=<%=l%>">
  <input class="bouton-droite" type="button" name="finaly" value="Imprime">
   </a>
		
		
		
		
		
      </div>
   
     <% } %>

</section>


<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>