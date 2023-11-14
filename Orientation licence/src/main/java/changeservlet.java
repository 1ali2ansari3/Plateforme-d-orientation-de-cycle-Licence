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
public class changeservlet extends HttpServlet {

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
		   	 
		   	 String l = request.getParameter("CIN");
		   	 String A = request.getParameter("old-password");	 
		   	 String B = request.getParameter("new-password");	 
		   	 String C = request.getParameter("new-password2");	 
		   	 
		   	try {
				//charge drive
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
				Statement st = con.createStatement();
				ResultSet res = st.executeQuery("SELECT PASS FROM `etudiant` WHERE `CNE`='"+l+"'");
				res.next();
			
				if(A.equals(res.getString(1)) & B.equals(C)) {
				PreparedStatement stmt1=con.prepareStatement("UPDATE `etudiant` SET `PASS`='"+B+"'  WHERE `CNE` = '"+l+"'"); 
				stmt1.executeUpdate(); 
				 	
				    
				    out.print("<script>");
					out.print("alert('Le mot de passe a été modifié avec succès.');");
					out.print("</script>");
					
					RequestDispatcher rd = request.getRequestDispatcher("profel.jsp?l="+l);
			   		rd.include(request, response);
				}else {
					
					out.print("<script>");
					out.print("alert('Informations incorrectes');");
					out.print("</script>");
					
					RequestDispatcher rd = request.getRequestDispatcher("pass.jsp?l="+l);
			   		rd.include(request, response);
				}
				
	
		   			   	 

				con.close();
				}catch (Exception e) {
					System.out.println("ERROR :"+ e.getMessage());
				}

    	
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