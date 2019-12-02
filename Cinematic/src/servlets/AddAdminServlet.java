package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class AddMovieServlet
 */
@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB();
			String sqlSt="SELECT * FROM Users WHERE email=?";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			st.setString(1,email);
			ResultSet rs=st.executeQuery();

			if(rs.next()) { 	// EXISTING USER ENTERED. REDIRECT TO REGISTER JSP
				request.setAttribute("err","This user already exists");
				request.setAttribute("msg", "");
				request.getRequestDispatcher("admin.jsp").forward(request, response); 
				return;
			}
			
			sqlSt="INSERT INTO Users (email,pass,fname,lname,isAdmin) VALUES (?,?,?,?,true)";
			st=con.prepareStatement(sqlSt); 
			st.setString(1,email);
			st.setString(2, pass);
			st.setString(3, fname);
			st.setString(4, lname);
			st.executeUpdate();
			
			request.setAttribute("err", "");
			request.setAttribute("msg", "The user has been added");
			request.getRequestDispatcher("profile.jsp").forward(request, response);
			
		}catch(Exception e) {System.out.println(e);}
	}

}
