package servlets;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import db.DBConnection;
import sn.Session;

@WebServlet("/CreditCard")
public class CreditCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreditCard() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession sess=request.getSession(false);  
		Session s = new Session();
		s.getSessionStatus("REGISTER JAVA",sess);
		
		int credNum = Integer.parseInt(request.getParameter("credNum"));
		int secNum = Integer.parseInt(request.getParameter("secNumber"));
		String address=request.getParameter("address");
		int month = Integer.parseInt(request.getParameter("month"));
		int year = Integer.parseInt(request.getParameter("year"));
		int uid = 12345678;
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB();
			String sqlSt="SELECT * FROM CreditCards WHERE credNum = ?";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			st.setLong(1,credNum);
			ResultSet rs=st.executeQuery();

			if(rs.next()) { 	// EXISTING EMAIL ENTERED. REDIRECT TO REGISTER JSP
				request.setAttribute("err","An account with this credit card number is already registered.");
				request.setAttribute("msg", "");
				request.getRequestDispatcher("creditCard.jsp").forward(request, response); 
				return;
			}
			
			// ALL INPUTS CORRECT. INSERT INFO INTO USERS
			
			sqlSt="INSERT INTO CreditCards (credNum, secCode, address, month, year, uid) VALUES (?,?,?,?,?,?)";
			st=con.prepareStatement(sqlSt); 
			st.setLong(1,credNum);
			st.setLong(2,secNum);
			st.setString(3,address);
			st.setLong(4, month);
			st.setLong(5, year);
			st.setLong(5, uid);//add uid info
			st.executeUpdate();
			
			// USER NOW REGISTERED. START NEW SESSION
			
			sess=request.getSession();
			 
			sqlSt="SELECT * FROM Users WHERE Users.uid = ?";
			st = con.prepareStatement(sqlSt); 
			st.setLong(1,uid);
			rs=st.executeQuery();
			rs.next();
			
			s.setSessionAttr(sess,rs); // SET SESSION ATTRIBUTES BASED ON RESULTSET 
			
			request.setAttribute("err", "");
			request.setAttribute("msg", "Welcome to Cinematic"+".");
			request.getRequestDispatcher("profile.jsp").forward(request, response);  
			db.close(con, rs, st);
			return;		
			
		} catch(Exception e) {System.out.println(e);}
	}
}