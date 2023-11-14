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
public class orientservlet extends HttpServlet {

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
		    	
			 String l = request.getParameter("l");
		   	 String A = request.getParameter("j");
		   	 String B = request.getParameter("N");
		   	 String C,D;
		     int BI = Integer.parseInt(B);
		     int BJ = Integer.parseInt(A);

		     out.print(l);
		     out.print(A);
		   	 out.print(B);
		   	 
		   	 if(A.equals("1")){
		   		int i=1; 
		   		try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
					PreparedStatement stmt1,stmt2,stmt3;
					while(i<=BI){
						C = request.getParameter(Integer.toString(i));
						D = request.getParameter("A"+Integer.toString(i));
						 
							if(C!=null){
							stmt1=con.prepareStatement("UPDATE `etudiant` SET `SP`='"+C+"' ,`Orientation`= '1' WHERE `CNE` = '"+D+"'"); 
							stmt1.executeUpdate();  
							stmt2=con.prepareStatement("UPDATE `choix` SET `ST_D`='Accepter' WHERE `CIN`='"+D+"' AND `SP`='"+C+"'"); 
							stmt2.executeUpdate();
							stmt3=con.prepareStatement("UPDATE `choix` SET `ST_D`='Refuser' WHERE `CIN`='"+D+"' AND `SP`!='"+C+"'"); 
							stmt3.executeUpdate();
							}
						i++;
					}
					con.close();
				}catch (Exception e) { 
					System.out.println("ERROR :"+ e.getMessage());
				}
		   		
			   	response.sendRedirect("OR.jsp?l="+l);

		   		
		   	 }
		   	 else{	
				int i=1; 
					try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
					PreparedStatement stmt1,stmt2,stmt3;
					while(i<=BI){
						C = request.getParameter(Integer.toString(i));
						D = request.getParameter("A"+Integer.toString(i));
						if(C!=null){
						Statement st = con.createStatement();
						ResultSet res = st.executeQuery("SELECT ST_D FROM `choix` WHERE `CIN` = '"+D+"' AND `NCH` = '"+--BJ+"'"); 
						if(res.next()) {
							if(res.getString(1).equals("En Cours")) {
							   	 out.print("<script> alert('Étudiant "+D+" en attente. Veuillez faire un meilleur choix.');</script>");

							}
							else {
								stmt1=con.prepareStatement("UPDATE `etudiant` SET `SP`='"+C+"' ,`Orientation`= '1' WHERE `CNE` = '"+D+"'"); 
								stmt1.executeUpdate();  
								stmt2=con.prepareStatement("UPDATE `choix` SET `ST_D`='Accepter' WHERE `CIN`='"+D+"' AND `SP`='"+C+"'"); 
								stmt2.executeUpdate();
								stmt3=con.prepareStatement("UPDATE `choix` SET `ST_D`='Refuser' WHERE `CIN`='"+D+"' AND `SP`!='"+C+"'"); 
								stmt3.executeUpdate();
							}
						
						}
						
						}
						i++;
					}
					con.close();
				}catch (Exception e) { 
					System.out.println("ERROR :"+ e.getMessage());
				} 
					RequestDispatcher rd = request.getRequestDispatcher("OR.jsp?l="+l);
			   		rd.include(request, response);
					
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