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
  background-color: #4CAF50; /* Couleur de fond */
  color: white; /* Couleur du texte */
  padding: 10px 20px; /* Espacement intérieur */
  border: none; /* Suppression de la bordure */
  text-align: center; /* Alignement du texte */
  text-decoration: none; /* Suppression du soulignement */
  display: inline-block;
  font-size: 16px; /* Taille de la police */
  margin: 4px 2px 4px 12px; /* Marge extérieure (haut, droite, bas, gauche) */
  cursor: pointer; /* Curseur au survol */
}


.bouton-droite:hover {
  background-color: #45a049; /* Couleur de fond au survol */
}
   
   .my-form {
  width: 400px;
  margin: 0 auto;
}

.my-form label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
}

.my-form select {
  width: 100%;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.my-form .submit-btn {
  display: block;
  width: 100%;
  padding: 10px;
  margin-top: 10px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.my-form .submit-btn:hover {
  background-color: #45a049;
}
   
   
   
   .my-list-item {
    position: relative;
    overflow: hidden;
}

   .my-list-item b {
    position: absolute;
    top: 50%;
    right: 30%;
    float: right;
     font-size: 16px;
}
.yellow {
    color: #fcb900;
}

.red {
    color: red;
}

.green {
    color: green;
}

p {
	margin: 0;
	line-height: 1.6;
}

ol {
	list-style: none;
	counter-reset: list;
	padding: 0 1rem;
}

li {
	--stop: calc(100% / var(--length) * var(--i));
	--l: 62%;
	--l2: 88%;
	--h: calc((var(--i) - 1) * (180 / var(--length)));
	--c1: hsl(var(--h), 71%, var(--l));
	--c2: hsl(var(--h), 71%, var(--l2));
	
	position: relative;
	counter-increment: list;
	max-width: 45rem;
	margin: 2rem auto;
	padding: 2rem 1rem 1rem;
	box-shadow: 0.1rem 0.1rem 1.5rem rgba(0, 0, 0, 0.3);
	border-radius: 0.25rem;
	overflow: hidden;
	background-color: white;
}

li::before {
	content: '';
	display: block;
	width: 100%;
	height: 1rem;
	position: absolute;
	top: 0;
	left: 0;
	background: linear-gradient(to right, var(--c1) var(--stop), var(--c2) var(--stop));
}

h3 {
	display: flex;
	align-items: baseline;
	margin: 0 0 1rem;
	color: rgb(70 70 70);
}

h3::before {
	display: flex;
	justify-content: center;
	align-items: center;
	flex: 0 0 auto;
	margin-right: 1rem;
	width: 3rem;
	height: 3rem;
	content: counter(list);
	padding: 1rem;
	border-radius: 50%;
	background-color: var(--c1);
	color: white;
}

@media (min-width: 40em) {
	li {
		margin: 3rem auto;
		padding: 3rem 2rem 2rem;
	}
	
	h3 {
		font-size: 2.25rem;
		margin: 0 0 2rem;
	}
	
	h3::before {
		margin-right: 1.5rem;
	}
}
  
</style>

   <script>
    function supprimerOption(selectElement) {
      var selectedOption = selectElement.options[selectElement.selectedIndex].value;

      var selects = document.getElementsByTagName('select');

      for (var i = 0; i < selects.length; i++) {
        if (selects[i] !== selectElement) {
          var options = selects[i].getElementsByTagName('option');
          for (var j = 0; j < options.length; j++) {
            if (options[j].value === selectedOption) {
              options[j].selected = false;
            } else {
              options[j].disabled = false;
            }
          }
        }
      }
    }
  </script>

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
<%
     String[] TYPE = new String[40];
	 int i=0;
	 try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `filier` WHERE `TR`= '"+TR+"'");
			//parcourt des données
			while(res.next()) {
	            TYPE[i] = res.getString(1);
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
			ResultSet res = st.executeQuery("SELECT DJ_OR FROM `etudiant` WHERE `CNE`= '"+l+"'");
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
   
   <form action="orientsevlet" method="post" class="my-form" >
   
   
    <%
    int j = 0;
    while(TYPE[j]!=null) {
    %>
   
   
	<label>Choix <%= j+1 %> : </label>
	<select onchange="supprimerOption(this)" name="<%= j+1 %>" required>
    <option value="">Choisissez une option</option>
    <%
    i= 0;
    while(TYPE[i]!=null) {
    %>
   
   <option value="<%= TYPE[i] %>"><%= TYPE[i] %></option>
    
    <%	
    i++;
    }
    %>
    </select>
    <br>
	<br>
	<br>
    <%	
    j++;
    }
    %>
   
    <input type="hidden" name="NCH" value="<%= j %>">
    <input type="hidden" name="CNE" value="<%= l %>">	
    	
    <input type="submit" name="Enregistrement" value="Enregistrement" class="submit-btn" >
      
    </form>
      
    </div>


<%  }else{ 
    String[] T1 = new String[40];
    String[] T2 = new String[40];
    String[] T3 = new String[40];
 
	int u =0;
	   try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `choix` WHERE `CIN`= '"+l+"'");
			//parcourt des données
			while(res.next()) {
				T1[u] = res.getString(2);
				T2[u] = res.getString(3);
				T3[u] = res.getString(6);
				u++;
		    }
			con.close();
			
		    }catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}







%>

<ol style="--length: 5" role="list">

<% 
u=0;
while(T1[u] != null){ 
%>

 <li class="my-list-item" style="--i: <%= (T3[u].equals("En Cours")) ? "3" : (T3[u].equals("Refuser")) ? "1" : (T3[u].equals("Accepter")) ? "2" : "" %>">
    <h3><%= T1[u] %></h3>
    <b class="<%= (T3[u].equals("En Cours")) ? "yellow" : (T3[u].equals("Refuser")) ? "red" : (T3[u].equals("Accepter")) ? "green" : "" %>"><%= T3[u] %></b>
</li>

	


<% u++;
}
%>


<a href="pdf.jsp?l=<%=l%>">
  <input class="bouton-droite" type="button" name="finaly" value="Imprime">
</a>

<%
}%>

</ol>



</section>

















<!-- custom js file link  -->
<script src="js/script.js"></script>

   
</body>
</html>