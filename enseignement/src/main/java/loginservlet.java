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
import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author admin
 */
public class loginservlet extends HttpServlet {

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
		   	 String p = request.getParameter("password");
		   	 try {
					//charge drive
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");
					Statement st = con.createStatement();
					//créer une requete de sélection
					ResultSet res = st.executeQuery("SELECT * FROM `enseignement` WHERE `CIN`='"+l+"' AND `password`='"+p+"'");
					//parcourt des données
						if(res.next()) {
					   		 HttpSession session = request.getSession();
					   		 session.setAttribute("authentifier","oui");
					   		 RequestDispatcher rd = request.getRequestDispatcher("profel.jsp");
					   		 rd.forward(request,response);
					   	 }
					   	 else {
					   		request.setAttribute("errorMessage", "Login ou mot de passe incorrect!");
					   		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					   		rd.forward(request, response);

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