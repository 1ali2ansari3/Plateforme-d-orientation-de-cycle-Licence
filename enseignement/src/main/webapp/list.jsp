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
  .custom-select {
  /* Styles personnalisés pour le select */
  width: 200px;
  height: 30px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 14px;
  padding: 5px;
}

.custom-button {
  /* Styles personnalisés pour le bouton */
  background-color: #4CAF50;
  color: white;
  padding: 5px 20px;
  border: none;
  border-radius: 4px;
  font-size: 14px;
  margin-left : 10px;
  
}

.custom-label {
  /* Styles personnalisés pour le label */
  font-weight: bold;
  margin-top: 10px;
  margin-left : 20px;
  border-radius: 4px;
  border-color: black;
}

  
  .custom-select {
  /* Styles personnalisés */
  width: 200px;
  height: 30px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 14px;
  padding: 5px;
}
  
    /* Styles pour les onglets */
    .bouton-d {
  	margin-left: 62%;
  	
    background-color: #007bff;
    color: #fff;
    padding: 5px 10px;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
  }
    .bouton-droite {
  	margin-left: 92%;
  	
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
  }
   .div-travail {
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      padding: 20px;
      text-align: center;
      font-size: 18px;
    }
  
    .tab {
      overflow: hidden;
      background-color: #f1f1f1;
    }

    .tab button {
      background-color: inherit;
      border: none;
      outline: none;
      cursor: pointer;
      padding: 10px 20px;
      transition: background-color 0.3s;
    }

    .tab button:hover {
      background-color: #1E90FF;
    }

    .tab button.active {
      background-color: #1E90FF;
    }

    /* Styles pour les contenus des onglets */
    .tab-content {
      display: none;
      padding: 20px;
      background-color: #fff;
    }
     table {
      border-collapse: collapse;
      width: 100%;
    }
    
    th, td {
      text-align: left;
      padding: 8px;
      border-bottom: 1px solid #ddd;
    }
    
    th {
      background-color: #f2f2f2;
    }
    
    .selected {
      background-color: #c1e1c1;
    }
    input[type="number"] {
    width: 20%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}
  </style>
  <script>
    // Fonction pour changer de contenu d'onglet
    function changeTab(tabName) {
      var i, tabContent;
      tabContent = document.getElementsByClassName('tab-content');
      for (i = 0; i < tabContent.length; i++) {
        tabContent[i].style.display = 'none';
      }
      document.getElementById(tabName).style.display = 'block';
    }
  </script>


	


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

<%  if(dj.equals("0")){
	 
	   String tri = request.getParameter("tri");
	   if(tri == null){
		   tri = "MoyGD";
	   }
	
	
	%>
 
 
 
 

<section class="user-profile">

   <div class="info">
		<form method="post" action="">
		  <select name="tri" class="custom-select">
		    <option value="MoyGD">MoyGD</option>
		    <option value="MOYSP">MOYSP</option>
		  </select>
		  <input type="submit" value="Tri" class="custom-button">
          <label for="tri" class="custom-label"><%= tri %></label>
		</form>
<br>
<br>
    
		
		
		
  <div class="tab">
    <% int j = 1;  while(j<i){ %>
    <button class="tablinks" onclick="changeTab('Tab<%=j%>')" id="defaultOpen"   >Choix <%= j%></button>
   
    <% j++; } %>
    
  </div>

   
			
   <%  j = 1;  while(j<i){ %>
    
   <%
  
   
   
       int O = 2;
 	   try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
            ResultSet res = st.executeQuery("SELECT COUNT(*) FROM `choix` WHERE `SP` = '" + F + "' AND `NCH` = '" + j + "' AND CIN NOT IN (SELECT CNE FROM etudiant WHERE Orientation = '1') ORDER BY `DEUST` DESC, `MOYSP` DESC");
			
			if(res.next()){
				O = res.getInt(1);
			}
			
			con.close();
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}	   	 
         %>
   

  
  
  <form action="orientservlet" method="post" >
  
  <div id="Tab<%=j%>" class="tab-content">
  
  
  <h1>Choisissez le nombre d'étudiants à cocher sur choix <%=j%>:</h1>
  <br>
  <input type="number" id="numberToCheck<%=j%>" min="0" max="<%= O %>"  value="0" onchange="updateCheckboxes<%=j%>()">
  <br>
  <br>
  <br>
 
  <table>
    <tr>
      <th></th>
      <th><h1>CNE</h1></th>
      <th><h1>Nom</h1></th>
      <th><h1>Deust</h1></th>
      <th><h1>Moyen SP</h1></th>
      <th><h1>Moyen Deust</h1></th>
      <th><h1>Coche</h1></th>
      <th></th>
      
    </tr>
    
        <%
        int p=1;
       
        
 	   try {
 		   
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
            ResultSet res = st.executeQuery("SELECT * FROM `choix` WHERE `SP` = '" + F + "' AND `NCH` = '" + j + "' AND CIN NOT IN (SELECT CNE FROM etudiant WHERE Orientation = '1') ORDER BY `DEUST` DESC, `"+tri+"` DESC");
            Statement st1 = con.createStatement();
			//créer une requete de sélection
            ResultSet res1;
			String A = null;
			while(res.next()){
				
				res1 = st1.executeQuery("SELECT * FROM `etudiant` WHERE `CNE` = '" +res.getString(1)+ "'");
				res1.next();
				A = res1.getString(3);
				
		%>
		    
    <tr>
      <td><%=p%></td>
      <td><%= res.getString(1) %></td>
      <td><%= A %></td>
      <td><% if (res.getString(4).equals("1")) { out.print("Oui"); } else { out.print("Non"); } %></td>
      <td><%= res.getString(5) %></td>
      <td><% if(res1.getString(8) == null ){ out.print(""); } else{ out.print(res1.getString(8)); } %></td>
     
     <td><input type="checkbox" class="studentCheckbox<%=j%>" name="<%=p%>" value="<%=res.getString(2)%>" onchange="updateSelection<%=j%>()"> <input type="hidden" name="A<%=p%>" value="<%=res.getString(1)%>"></td>
     <td><a href="relv.jsp?l=<%=res.getString(1)%>"><input type="button"  name="CIN" value="RN" class="bouton-d"></a></td>
  
   
    </tr>
		    
		 
		    
		 <%		
			p++;}
			con.close();
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}	   	 
         %>
    
    
  
  </table>
  <br>
  <br>
  	   <input type="hidden" name="N" value="<%=--p%>">	
  		
       <input type="hidden" name="j" value="<%=j%>">	
  
         <input type="hidden" name="l" value="<%=l%>">	
  
       <input type="submit" name="Authentification<%=j%>" value="Orient" class="bouton-droite" >
   
   
  </div>
     </form>
  
  <% j++; } %>
  

 
		
		
		
		
		
		
		
   </div>

</section>

 



<!-- custom js file link  -->
<script src="js/script.js"></script>

<script>
    document.getElementById('defaultOpen').click();
    
    <%  j = 1;  while(j<i){ %>
    //++++++++++++++

    function updateSelection<%=j%>() {
        var checkboxes = document.getElementsByClassName("studentCheckbox");
        var numberToCheck = parseInt(document.getElementById("numberToCheck<%=j%>").value);
        var checkedCount = 0;

        for (var i = 0; i < checkboxes.length; i++) {
          if (checkboxes[i].checked) {
            checkedCount++;
            if (checkedCount > numberToCheck) {
              checkboxes[i].checked = false;
            }
          }
        }

        // Automatically check n students if numberToCheck is n
        if (numberToCheck === checkedCount) {
          return;
        }

        var uncheckedCheckboxes = Array.from(checkboxes).filter(function(checkbox) {
          return !checkbox.checked;
        });

        if (numberToCheck > checkedCount) {
          uncheckedCheckboxes.slice(0, numberToCheck - checkedCount).forEach(function(checkbox) {
            checkbox.checked = true;
          });
        } else {
          uncheckedCheckboxes.forEach(function(checkbox) {
            checkbox.checked = false;
          });
        }

        updateTableStyle<%=j%>();
      }
    
    //++++++++++++++


      function updateTableStyle<%=j%>() {
        var checkboxes = document.getElementsByClassName("studentCheckbox<%=j%>");

        for (var i = 0; i < checkboxes.length; i++) {
          var row = checkboxes[i].parentNode.parentNode;
          if (checkboxes[i].checked) {
            row.classList.add("selected");
          } else {
            row.classList.remove("selected");
          }
        }
      }

      //++++++++++++++
      
      function updateCheckboxes<%=j%>() {
        var numberToCheck = parseInt(document.getElementById("numberToCheck<%=j%>").value);
        var checkboxes = document.getElementsByClassName("studentCheckbox<%=j%>");
        var checkedCount = 0;

        for (var i = 0; i < checkboxes.length; i++) {
          checkboxes[i].checked = false;
        }

        // Automatically check n students if numberToCheck is n
        if (numberToCheck > 0) {
          Array.from(checkboxes).slice(0, numberToCheck).forEach(function(checkbox) {
            checkbox.checked = true;
          });
        }

        updateTableStyle<%=j%>();
      }
      
    
     
      <% j++; } %>
      
    
    

     


      
      
</script>
   
   
   <% }else{ %>
 <section class="user-profile">
      <div class="info">
      	<div class="div-travail">
		      Orientation terminé
		</div>
	</div>
</section>
 <% } %>
</body>
</html>