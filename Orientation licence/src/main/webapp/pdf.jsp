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
     String l = request.getParameter("l");
	 
	 String name = null;
	 String sexe = null;
	 String A1 = null;
	 String A2 = null;
	 String A3 = null;

	 try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `etudiant` WHERE `CNE`= '"+l+"'");
			//parcourt des données
			if(res.next()) {
				name = res.getString(3);
				sexe = res.getString(5);
				A1 = res.getString(1);
				A2 = res.getString(2);
				A3 = res.getString(4);
				
				
			}
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>



<section class="user-profile">


   <div class="info">

   <table width="100%" height="400" border="1" cellspacing="0" cellpadding="5">
	
		<tbody>
			<tr>
				<td><strong>Nom : </strong></td>
				<td><%= name %></td>
			</tr>
			<tr>
				<td><strong>CNE : </strong></td>
				<td><%= A2 %></td>
			</tr>
			<tr>
				<td><strong>CIN : </strong></td>
				<td><%= A1 %></td>
			</tr>
			<tr>
				<td><strong>Date naissance : </strong></td>
				<td><%= A3 %></td>
			</tr>
		</tbody>
		
	</table>
	
	   <table width="100%" height="400" border="1" cellspacing="0" cellpadding="5">
	
        	<%

	 
	 String[] A = new String[50];
	 int i = 1;
	 try {	 

			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `choix` WHERE `CIN`= '"+l+"'");
			//parcourt des données
			while(res.next()) {
			%>
			<tr>
				<td><strong>Choix <%= i %> :</strong></td>
				<td><%= res.getString(2) %></td>
			</tr>
           <% 
			i++;
			}
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