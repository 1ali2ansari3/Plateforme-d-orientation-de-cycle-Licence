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


/**
 *
 * @author admin
 */
public class Finaliservlet extends HttpServlet {

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
    	response.setContentType("text/html;charset=UTF-8");
	   	 PrintWriter out = response.getWriter();
	    	
		 String l = request.getParameter("l");
		 String F = null ;
		 out.print(l);
	   	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
			
			PreparedStatement stmt1=con.prepareStatement("UPDATE `enseignement` SET `Finalise`='1' WHERE `CIN` = '"+l+"'"); 
					          stmt1.executeUpdate();
					          Statement st = con.createStatement();
					          ResultSet res = st.executeQuery("SELECT filier FROM `enseignement` WHERE `CIN`= '"+l+"'");
								if(res.next()) {
								 F = res.getString(1);
								 out.print(F);
								}
								stmt1 = con.prepareStatement("UPDATE `choix` SET `ST_D`='Refuser' WHERE `CIN` NOT IN (SELECT CNE FROM etudiant WHERE `SP` = '"+F+"') AND `SP` = '"+F+"'");
					          stmt1.executeUpdate();  
			
			con.close();
		}catch (Exception e) { 
			System.out.println("ERROR :"+ e.getMessage());
		}
   		response.sendRedirect("OR.jsp?l="+l);		   	 

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