package servlets;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import db.DBConnection;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public IndexServlet() {super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		ArrayList <String> titles  = new ArrayList <String> ();
		ArrayList <String> posters = new ArrayList <String> ();
		
		try {
			DBConnection db = new DBConnection();
			Connection con = db.connectDB();
			String sqlSt = "SELECT Title,Poster FROM Movies";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				titles .add( rs.getString(1) );
			    posters.add( rs.getString(2) ); 
			}
			
			db.close(con,rs,st);
			
		} catch(Exception e) {System.out.println(e);}	
		
		request.setAttribute("titles" , titles );
		request.setAttribute("posters", posters);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);  
	}
}
