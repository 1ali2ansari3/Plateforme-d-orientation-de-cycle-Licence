/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;



/**
 *
 * @author admin
 */
public class orientsevlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
		   	 response.setContentType("text/html;charset=UTF-8");
		   	 PrintWriter out = response.getWriter();
		   	 
		   	 int l = Integer.parseInt(request.getParameter("NCH"));		   	 
		   	 String CNE = request.getParameter("CNE");
		   	 String SP = null;
		   	 double A;
		   	 int i= 1,j=0;
		   	 
			   try {
					//charge drive
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
					while(i<= l) {
						
				    SP = request.getParameter(String.valueOf(i));
					
				    
					//créer une requete de sélection
					PreparedStatement stmt=con.prepareStatement("INSERT INTO `choix` VALUES (?,?,?,?,?,?,?)");  
					stmt.setString(1,CNE);
					stmt.setString(2,SP);
					stmt.setInt(3,i);
					Statement st1 = con.createStatement();
					//créer une requete de sélection
					ResultSet res1 = st1.executeQuery("SELECT AdmisDEUST FROM `etudiant` WHERE `CNE`= '"+CNE+"'");
					if(res1.next()) {
						
						 stmt.setString(4,res1.getString(1));
				    }
					
					A=0;
					j=0;
					Statement st = con.createStatement();
					//créer une requete de sélection
					ResultSet res = st.executeQuery("SELECT dept FROM `filier` WHERE `TYPEF`= '"+SP+"'");
					if(res.next()) {
						Statement st2 = con.createStatement();
						//créer une requete de sélection
						ResultSet res2 = st2.executeQuery("SELECT CodeM FROM `module` WHERE `dept`= '"+res.getString(1)+"'");
						while(res2.next()) {
							j++;
							Statement st3 = con.createStatement();
							//créer une requete de sélection
							ResultSet res3 = st3.executeQuery("SELECT NoteF FROM `evaluation` WHERE `CodeM`= '"+res2.getString(1)+"' AND `CNE`= '"+CNE+"'");
							if(res3.next()) {
								A += res3.getDouble(1);
							}
							
					    }
						
						
				    }
				
					
					
					
					stmt.setDouble(5,A/j);
					stmt.setString(6,"En Cours");
					ResultSet res4 = st1.executeQuery("SELECT MoyGD FROM `etudiant` WHERE `CNE` = '" +CNE+ "'");
					res4.next();
					stmt.setFloat(7,res4.getFloat(1));

					stmt.executeUpdate();  
					
					i++;
					}
					
					PreparedStatement stmt1=con.prepareStatement("UPDATE `etudiant` SET `DJ_OR`='1' WHERE `CNE` = '"+CNE+"'"); 
					stmt1.executeUpdate();  

					//Fermer la connection
					con.close();
					}catch (Exception e) {
						System.out.println("ERROR :"+ e.getMessage());
					}
			 
			   
		   		response.sendRedirect("Orient.jsp?l="+CNE);		   	 

		    	


    	
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}