package servlets;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import db.DBConnection;
import sn.Session;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	public LoginServlet() { super(); }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession sess=request.getSession(false);  
		Session s = new Session();
		s.getSessionStatus("LOGIN JAVA",sess);
		
		String emailCurrent = request.getParameter("email-current");  
		String passCurrent  = request.getParameter("pass-current" );
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB("CinematicDB","root","root");
			String sqlSt="SELECT * FROM Users WHERE email=?";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			st.setString(1,emailCurrent);
			ResultSet rs=st.executeQuery();

			if(!rs.next()) { 	// WRONG EMAIL ENTERED. REDIRECT TO LOGIN JSP
				request.setAttribute("err","No matching users found.");
				request.setAttribute("msg", "");
				request.getRequestDispatcher("login.jsp").forward(request, response); 
				return;
			}
			
			if (!passCurrent.equals(rs.getString("pass"))) {	// WRONG PASSWORD ENTERED. REDIRECT TO LOGIN JSP
				request.setAttribute("err","Wrong password entered.");
				request.setAttribute("msg", "");
			    request.getRequestDispatcher("login.jsp").forward(request, response);  
			    return;
			}
			// ALL INPUTS CORRECT. REDIRECT TO PROFILE
			
			sess=request.getSession();
			
			s.setSessionAttr(sess,rs); // SET SESSION ATTRIBUTES BASED ON RESULTSET 
			
			request.setAttribute("err", "");
			request.setAttribute("msg", "Welcome back, "+rs.getString("fname")+".");
			request.getRequestDispatcher("profile.jsp").forward(request, response);  
			db.close(con, rs, st);
			return;		
			
		} catch(Exception e) {System.out.println(e);}
	}
}