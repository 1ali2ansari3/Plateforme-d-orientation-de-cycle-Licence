import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class EtudiantDOA {
	
	Connection con = null;
	

	public  Connection OuverirConnex() {
		try {
			//charge drive
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/fsterr","root","");	
			}catch (Exception e) {
				System.out.println("ERROR :"+ e.getMessage());
			}
		return con;
	}

	
	public boolean chercher(String login,String pass){
		try {
			con = OuverirConnex();
			Statement st = con.createStatement();
			//créer une requete de sélection
			ResultSet res = st.executeQuery("SELECT * FROM `etudiant` WHERE `CNE`= '"+login+"' AND `PASS` = '"+pass+"'" );
			//parcourt des données
			if(res.next()) {
				return true;
			}
			
		}catch (Exception e1){
			System.out.println("ERROR :"+ e1.getMessage());
		}
		return false;
	}
	

	
	
	public static void main(String[] args) {
		 
		
	}

}