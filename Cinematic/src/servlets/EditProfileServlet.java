package servlets;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import db.DBConnection;
import sn.Session;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public EditProfileServlet() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession sess=request.getSession(false);  
		Session s = new Session();
		s.getSessionStatus("EDIT PROFILE JAVA",sess);
		
		// VERIFY CREDENTIALS
	    
		String emailCurrent = request.getParameter("email-current"); 
		String passCurrent  = request.getParameter("pass-current" ); 
		
		if(!emailCurrent.equals(sess.getAttribute("email"))) { 	// WRONG EMAIL ENTERED
			request.setAttribute("err","Current email is incorrect.");
			request.setAttribute("msg", "");
			request.getRequestDispatcher("editProfile.jsp").forward(request, response); 
			return;
		}
		
		if(!passCurrent.equals(sess.getAttribute("pass"))) { 	// WRONG PASS ENTERED
			request.setAttribute("err","Current password is incorrect.");
			request.setAttribute("msg", "");
			request.getRequestDispatcher("editProfile.jsp").forward(request, response); 
			return;
		}
		
		// GIVEN CORRECT EMAIL AND PASS, PARSE INPUTS THEN UPDATE INFO
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB("CinematicDB","root","root");
			PreparedStatement st; 
			ResultSet rs;
			String sqlSt;
			
			String email   = request.getParameter("email");  
			String pass    = request.getParameter("pass" );
			String fname   = request.getParameter("fname");
			String lname   = request.getParameter("lname");
			String address = request.getParameter("address");
			String city    = request.getParameter("city");
			String state   = request.getParameter("state");
			String zip     = request.getParameter("zip");	
			
			String [] queryVals= {email,pass,fname,lname,address,city,state,zip};
			
			String [] queryCols= {
				"email=?,",		"pass=?,",		"fname=?,",		"lname=?,",
				"address=?,",	"city=?,",		"state=?,",		"zip=?,"};
 			
			boolean [] toChange= {
				!email.isEmpty(),	!pass.isEmpty(),	!fname.isEmpty(),	!lname.isEmpty(),
				!address.isEmpty(),	!city.isEmpty(),	!state.isEmpty(),	!zip.isEmpty()};
			
			sqlSt="UPDATE Users SET ";
			
			int c=0; // will ++ every time a value is not changed
			int p=0; // will ++ every param that is set
			
			for (int i=0;i<queryCols.length;i++) 
				if (toChange[i]) sqlSt=sqlSt.concat(queryCols[i]);
				else c++;
			
			sqlSt=sqlSt.substring(0,sqlSt.length()-1);
			
			sqlSt=sqlSt.concat(" WHERE email=?");
		
			st = con.prepareStatement(sqlSt); 
			
			for (int i=0;i<queryVals.length;i++)
				if (toChange[i]) st.setString(++p,queryVals[i]);
			
			st.setString(++p, emailCurrent);
			
			// if c==8, then no values were set to change. bad query.
			if (c<queryCols.length) st.executeUpdate();
			
			// select columns of current user to reflect in session 
			
			sqlSt="SELECT * FROM Users WHERE email=?";
			st = con.prepareStatement(sqlSt); 
			st.setString(1,emailCurrent);
			rs=st.executeQuery();
			rs.next();
			
			s.setSessionAttr(sess,rs); // SET SESSION ATTRIBUTES BASED ON RESULTSET 
			
			db.close(con, rs, st);		
			
			request.setAttribute("err", "");
			request.setAttribute("msg", "Changes have been saved.");
			request.getRequestDispatcher("profile.jsp").forward(request, response);  // or forward to profile
			return;		
			
		} catch(Exception e) {System.out.println(e);}
	}
}