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
	 String l = request.getParameter("l");

%>


<section class="user-profile">
<%
       String F = null ;
	   try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT filier FROM `enseignement` WHERE `CIN`= '"+l+"'");
			//parcourt des données
			if(res.next()) {
	            F= res.getString(1);
		    }
			con.close();
			
		    }catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>



<div class="info">
		
		      <img src="image/LOGO_FST.png" class="image" alt="">
		<br>
		<br>
		
      <h1 style="color: blue; text-align: center;">Liste des étudiants orientés en licence :   <%=F%></h1>
	  <h2 style="color: black; text-align: center;">Année universitaire 2023-2024</h2>
		
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
	
		
   </div>
  
</section>


<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>