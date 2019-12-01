package servlets;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import db.DBConnection;
import sn.Session;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession sess=request.getSession(false);  
		Session s = new Session();
		s.getSessionStatus("REGISTER JAVA",sess);
		
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB("CinematicDB","root","root");
			String sqlSt="SELECT * FROM Users WHERE email=?";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			st.setString(1,email);
			ResultSet rs=st.executeQuery();

			if(rs.next()) { 	// EXISTING EMAIL ENTERED. REDIRECT TO REGISTER JSP
				request.setAttribute("err","An account with this email is already registered.");
				request.setAttribute("msg", "");
				request.getRequestDispatcher("register.jsp").forward(request, response); 
				return;
			}
			
			// ALL INPUTS CORRECT. INSERT INFO INTO USERS
			
			sqlSt="INSERT INTO Users (email, pass, fname, lname) VALUES (?,?,?,?)";
			st=con.prepareStatement(sqlSt); 
			st.setString(1,email);
			st.setString(2,pass);
			st.setString(3,fname);
			st.setString(4,lname);
			st.executeUpdate();
			
			// USER NOW REGISTERED. START NEW SESSION
			
			sess=request.getSession();
			 
			sqlSt="SELECT * FROM Users WHERE email=?";
			st = con.prepareStatement(sqlSt); 
			st.setString(1,email);
			rs=st.executeQuery();
			rs.next();
			
			s.setSessionAttr(sess,rs); // SET SESSION ATTRIBUTES BASED ON RESULTSET 
			
			request.setAttribute("err", "");
			request.setAttribute("msg", "Welcome to Cinematic, "+rs.getString("fname")+".");
			request.getRequestDispatcher("profile.jsp").forward(request, response);  
			db.close(con, rs, st);
			return;		
			
		} catch(Exception e) {System.out.println(e);}
	}
}