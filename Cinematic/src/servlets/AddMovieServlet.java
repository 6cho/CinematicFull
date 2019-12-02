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
@WebServlet("/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMovieServlet() {
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
		String title=request.getParameter("title");
		java.util.Date selectedDate = null;
		try {
			selectedDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String synopsis=request.getParameter("synopsis");
		String poster=request.getParameter("poster");
		String trailer=request.getParameter("trailer");
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB();
			String sqlSt="SELECT * FROM Movies WHERE title=?";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			st.setString(1,title);
			ResultSet rs=st.executeQuery();

			if(rs.next()) { 	// EXISTING MOVIE ENTERED. REDIRECT TO REGISTER JSP
				request.setAttribute("err","This movie already exists");
				request.setAttribute("msg", "");
				request.getRequestDispatcher("register.jsp").forward(request, response); 
				return;
			}
			
			sqlSt="INSERT INTO Movies (title, releaseDate, synopsis, poster, trailer) VALUES (?,?,?,?,?)";
			st=con.prepareStatement(sqlSt); 
			st.setString(1,title);
			st.setDate(2, (Date) selectedDate);
			st.setString(3,synopsis);
			st.setString(4,poster);
			st.setString(5,trailer);
			st.executeUpdate();
			
			request.setAttribute("err", "");
			request.setAttribute("msg", "The movie has been added");
			request.getRequestDispatcher("profile.jsp").forward(request, response);
			
		}catch(Exception e) {System.out.println(e);}
	}

}
