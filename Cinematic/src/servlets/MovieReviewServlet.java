package servlets;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import db.DBConnection;
import sn.Session;

@WebServlet("/MovieReviewServlet")
public class MovieReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieReviewServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession sess=request.getSession(false);  
		Session s = new Session();
		s.getSessionStatus("REGISTER JAVA",sess);
		
		String title=request.getParameter("title");
		String review=request.getParameter("review");
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB();
			
			String sqlSt="INSERT INTO Reviews (title, description, rating) VALUES (?,?,?)";
			PreparedStatement st=con.prepareStatement(sqlSt); 
			st.setString(1,title);
			st.setString(2,review);
			st.setLong(3,rating);
			st.executeUpdate();
			
			// USER NOW REGISTERED. START NEW SESSION
			
			//sess=request.getSession();
			 
			
			request.setAttribute("err", "");
			request.setAttribute("msg", "Your review has been added.");
			request.getRequestDispatcher("profile.jsp").forward(request, response);  

			return;		
			
		} catch(Exception e) {System.out.println(e);}
	}
}