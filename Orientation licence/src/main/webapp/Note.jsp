<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.PreparedStatement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.text.DecimalFormat" %> 


 


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
   table {
      border-collapse: collapse;
   }
 .mm{
      border-top: 1px solid white;
      border-left: 1px solid white;
     
   }
   td,th {
      border: 1px solid;
      border-color: black;
      text-align: center;
      vertical-align: middle;
   }
  .mmm{
      border-bottom: 1px solid white;
      border-left: 1px solid white;
     
   }
   .mmmm{
      border-bottom: 1px solid white;
      border-left: 1px solid white;
      border-right: 1px solid white;
     
   }
</style>


</head>
<body>
<%
	 String l = request.getParameter("l");
	 String name = null;
	 String TR = null;
	 String CNE = null;
	 String sexe = null;
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
				TR = res.getString(6);
				CNE = res.getString(2);
				sexe = res.getString(5);
			}
			con.close();
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>
<header class="header">
   
   <section class="flex">

      <a href="#" class="logo">Orientation Licence</a>

    

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="search-btn" class="fas fa-search"></div>
         <div id="user-btn" class="fas fa-user"></div>
         <div id="toggle-btn" class="fas fa-sun"></div>
      </div>

        <div class="profile">
     
    <% if(sexe.equals("H")){%>
      <img src="image/pic-1.jpg" class="image" alt="">
    <% }else {%>
      <img src="image/pic-2.jpg" class="image" alt="">
    <% }%>      
     
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
   <% if(sexe.equals("H")){%>
      <img src="image/pic-1.jpg" class="image" alt="">
    <% }else {%>
      <img src="image/pic-2.jpg" class="image" alt="">
    <% }%>       <h3 class="name"><%= name%></h3>
      <p class="role"><%= l %></p>
      <a href="profel.jsp?l=<%= l %>" class="btn">Profil</a>
   </div>

   <nav class="navbar">
      <a href="Note.jsp?l=<%= l %>"><i class="fas fa-graduation-cap"></i><span>Note</span></a>
      <a href="Orient.jsp?l=<%= l %>"><i class="fas fa-chalkboard-user"></i><span>Orient</span></a>
   </nav>

</div>

<section class="user-profile">

   <h1 class="heading">Relevé de notes de DEUST</h1>
<%
	
	String[] A = new String[24];
	int i = 0;
	 try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `module` WHERE `TypeM`= '"+TR+"' ORDER BY id ASC");
			//parcourt des données
			while(res.next()) {
					A[i] = res.getString(3);
					i++;
			}
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>
<%
	
	String[] AA = new String[24];
	 i = 0;
	 try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `module` WHERE `TypeM`= '"+TR+"' ORDER BY id ASC");
			//parcourt des données
			while(res.next()) {
					AA[i] = res.getString(2);
					i++;
			}
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>
<%
	
	double[] AAA = new double[24];
    String[] AAAV = new String[24];
	String[] AAAA = new String[24];
	String[] AAAAA = new String[24];

	 try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			for(i=0;i<24;i++){
			ResultSet res = st.executeQuery("SELECT * FROM `evaluation` WHERE `CodeM`= '"+AA[i]+"' AND `CNE`= '"+l+"'");
			//parcourt des données
					if(res.next()){
							AAA[i] = res.getDouble(3);
							
							if (AAA[i] >= 16 && AAA[i] <= 20) {
								AAAAA[i]="Très bien";
							} else if (AAA[i] >= 14 && AAA[i] < 16) {
								AAAAA[i]="Bien";
							} else if (AAA[i] >= 12 && AAA[i] < 14) {
								AAAAA[i]="Assez bien";
							}else if (AAA[i] >= 10 && AAA[i] < 12) {
								AAAAA[i]="Passable";
							} else {
								AAAAA[i]="  ----   ";
							    
							}
							AAAA[i] = res.getString(4);
							AAAV[i] = Double.toString(AAA[i]);
					}
					else{
						AAAV[i] = "";
						AAAA[i] = "";
						AAAAA[i] = "";

						
					}
			
			}
			
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
%>

<%!
  // Déclaration d'une méthode avec un paramètre et un type de retour
  public String mention(double a) {
	
	if (a >= 10) {
		return "Validé";
	} else {
		return "No Validé";
	}
	
  }
%>

<%  
	String S1,S2,S3,S4;
	double S11,S22,S33,S44;
	S11 = (AAA[5]+AAA[4]+AAA[3]+AAA[2]+AAA[1]+AAA[0])/6;
	S22 = (AAA[11]+AAA[10]+AAA[9]+AAA[8]+AAA[7]+AAA[6])/6;
	S33 = (AAA[17]+AAA[16]+AAA[15]+AAA[14]+AAA[13]+AAA[12])/6;
	S44 = (AAA[23]+AAA[22]+AAA[21]+AAA[20]+AAA[19]+AAA[18])/6;
	
	DecimalFormat decimalFormat = new DecimalFormat("#.##");
    String formattedS11 = decimalFormat.format(S11);
    String formattedS22 = decimalFormat.format(S22);
    String formattedS33 = decimalFormat.format(S33);
    String formattedS44 = decimalFormat.format(S44);

	
	S1 = mention(S11);	
	S2 = mention(S22);	
	S3 = mention(S33);	
	S4 = mention(S44);	
	
	if(S11+S22+S33+S44>=40){
		if(S1.equals("No Validé") && S2.equals("Validé")  && S3.equals("Validé") && S4.equals("Validé")){
			S1 = "Validé/Comp";
		}
		else if(S1.equals("Validé") && S2.equals("No Validé")  && S3.equals("Validé") && S4.equals("Validé")){
			S2 = "Validé/Comp";
		}
		else if(S1.equals("Validé") && S2.equals("Validé") && S3.equals("No Validé") && S4.equals("Validé")){
			S3 = "Validé/Comp";
		}
		else if(S1.equals("Validé") && S2.equals("Validé") && S3.equals("Validé") && S4.equals("No Validé")){
			S4 = "Validé/Comp";
		}
	}



%>
   <div class="info">

      
		<h1>Nom et Prénom : <%= name%> </h1> 
		<h1>CNE : <%= CNE%> </h1> 
		<h1>Filière : <%= TR%> </h1> 
		<br>
		<h1>Semestre S1</h1> 
		<br>
		<table  height="200" >
				   <thead>
				      <tr>
				         <th class="mm" style="width: 200px;"></th>
				         <th style="width: 500px;">Module </th>
				         <th style="width: 200px;">Note</th>
				         <th style="width: 200px;">Résultat</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				         <td><%= AAAA[0] %></td>
				         <td><%= A[0] %></td>
				         <td><%= AAAV[0] %></td>
				         <td><%= AAAAA[0] %></td>
				      </tr>
				       <tr>
				         <td><%= AAAA[1] %></td>
				         <td><%= A[1] %></td>
				         <td><%= AAAV[1] %></td>
				         <td><%= AAAAA[1] %></td>
				      </tr>
				       <tr>
				         <td><%= AAAA[2] %></td>
				         <td><%= A[2] %></td>
				         <td><%= AAAV[2] %></td>
				         <td><%= AAAAA[2] %></td>
				      </tr>
				      <tr>
				         <td><%= AAAA[3] %></td>
				         <td><%= A[3] %></td>
				         <td><%= AAAV[3] %></td>
				         <td><%= AAAAA[3] %></td>
				      </tr>
				      <tr>
				         <td><%= AAAA[4] %></td>
				         <td><%= A[4] %></td>
				         <td><%= AAAV[4] %></td>
				         <td><%= AAAAA[4] %></td>
				      </tr>
				      <tr>
				         <td><%= AAAA[5] %></td>
				         <td><%= A[5] %></td>
				         <td><%= AAAV[5] %></td>
				         <td><%= AAAAA[5] %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Moyenne</b></td>
				         <td><%= formattedS11 %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Résultat</b></td>
				         <td><%= S1 %></td>
				      </tr>
				   </tbody>
			</table>
		
		<h1>Semestre S2</h1> 
		<br>
		<table >
				   <thead>
				      <tr>
				         <th class="mm" style="width: 200px;"></th>
				         <th style="width: 500px;">Module </th>
				         <th style="width: 200px;">Note</th>
				         <th style="width: 200px;">Résultat</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				         <td><%= AAAA[6] %></td>
				         <td><%= A[6] %></td>
				         <td><%= AAAV[6] %></td>
				         <td><%= AAAAA[6] %></td>
				      </tr>
				       <tr>
				         <td><%= AAAA[7] %></td>
				         <td><%= A[7] %></td>
				         <td><%= AAAV[7] %></td>
				         <td><%= AAAAA[7] %></td>
				      </tr>
				       <tr>
				         <td><%= AAAA[8] %></td>
				         <td><%= A[8] %></td>
				         <td><%= AAAV[8] %></td>
				         <td><%= AAAAA[8] %></td>
				      </tr>
				       <tr>
				         <td><%= AAAA[9] %></td>
				         <td><%= A[9] %></td>
				         <td><%= AAAV[9] %></td>
				         <td><%= AAAAA[9] %></td>
				      </tr>
				       <tr>
				         <td><%= AAAA[10] %></td>
				         <td><%= A[10] %></td>
				         <td><%= AAAV[10] %></td>
				         <td><%= AAAAA[10] %></td>
				      </tr>
				      <tr>
				         <td><%= AAAA[11] %></td>
				         <td><%= A[11] %></td>
				         <td><%= AAAV[11] %></td>
				         <td><%= AAAAA[11] %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Moyenne</b></td>
				         <td><%= formattedS22 %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Résultat</b></td>
				         <td><%= S2 %></td>
				      </tr>
				   </tbody>
			</table>
		
		<h1>Semestre S3</h1> 
		<br>
		<table  height="200" >
				   <thead>
				      <tr>
				         <th class="mm" style="width: 200px;"></th>
				         <th style="width: 500px;">Module </th>
				         <th style="width: 200px;">Note</th>
				         <th style="width: 200px;">Résultat</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				         <td><%= AAAA[12] %></td>
				         <td><%= A[12] %></td>
				         <td><%= AAAV[12] %></td>
				         <td><%= AAAAA[12] %></td>
				      </tr>
				       <tr>
				        <td><%= AAAA[13] %></td>
				         <td><%= A[13] %></td>
				         <td><%= AAAV[13] %></td>
				         <td><%= AAAAA[13] %></td>
				      </tr>
				       <tr>
				          <td><%= AAAA[14] %></td>
				         <td><%= A[14] %></td>
				         <td><%= AAAV[14] %></td>
				         <td><%= AAAAA[14] %></td>
				      </tr>
				      <tr>
				          <td><%= AAAA[15] %></td>
				         <td><%= A[15] %></td>
				         <td><%= AAAV[15] %></td>
				         <td><%= AAAAA[15] %></td>
				      </tr>
				      <tr>
				          <td><%= AAAA[16] %></td>
				         <td><%= A[16] %></td>
				         <td><%= AAAV[16] %></td>
				         <td><%= AAAAA[16] %></td>
				      </tr>
				      <tr>
				          <td><%= AAAA[17] %></td>
				         <td><%= A[17] %></td>
				         <td><%= AAAV[17] %></td>
				         <td><%= AAAAA[17] %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Moyenne</b></td>
				         <td><%= formattedS33 %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Résultat</b></td>
				         <td><%= S3 %></td>
				      </tr>
				   </tbody>
			</table>
		
		<h1>Semestre S4</h1> 
		<br>
		<table  height="200" >
				   <thead>
				      <tr>
				         <th class="mm" style="width: 200px;"></th>
				         <th style="width: 500px;">Module </th>
				         <th style="width: 200px;">Note</th>
				         <th style="width: 200px;">Résultat</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				          <td><%= AAAA[18] %></td>
				         <td><%= A[18] %></td>
				         <td><%= AAAV[18] %></td>
				         <td><%= AAAAA[18] %></td>
				      </tr>
				       <tr>
				          <td><%= AAAA[19] %></td>
				         <td><%= A[19] %></td>
				         <td><%= AAAV[19] %></td>
				         <td><%= AAAAA[19] %></td>
				      </tr>
				       <tr>
				          <td><%= AAAA[20] %></td>
				         <td><%= A[20] %></td>
				         <td><%= AAAV[20] %></td>
				         <td><%= AAAAA[20] %></td>
				      </tr>
				      <tr>
				          <td><%= AAAA[21] %></td>
				         <td><%= A[21] %></td>
				         <td><%= AAAV[21] %></td>
				         <td><%= AAAAA[21] %></td>
				      </tr>
				      <tr>
				          <td><%= AAAA[22] %></td>
				         <td><%= A[22] %></td>
				         <td><%= AAAV[22] %></td>
				         <td><%= AAAAA[22] %></td>
				      </tr>
				      <tr>
				         <td><%= AAAA[23] %></td>
				         <td><%= A[23] %></td>
				         <td><%= AAAV[23] %></td>
				         <td><%= AAAAA[23] %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Moyenne</b></td>
				         <td><%= formattedS44 %></td>
				      </tr>
				      <tr>
				         <td class="mmmm"></td>
				         <td class="mmm"></td>
				         <td><b>Résultat</b></td>
				         <td><%= S4 %></td>
				      </tr>
				   </tbody>
			</table>
				
				
		
		 
       
    
       
   </div>

</section>

















<!-- custom js file link  -->
<script src="js/script.js"></script>

   
</body>
</html>