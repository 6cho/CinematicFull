package sn;
import java.sql.*;

import javax.servlet.http.HttpSession;

public class Session {
	
	public boolean getSessionStatus(String loc,HttpSession session) {
		
		System.out.println(loc);
		
		if (session==null) {
			System.out.println("\tSESSION STATE : invalidated session");
			System.out.println("\tVALID SESSION : false\n");
			return false;
		}
		
		if (session.getAttribute("email")==null) {
			System.out.println("\tSESSION STATE : invalid session");
			System.out.println("\tVALID SESSION : false\n");
			session.invalidate();
			return false;
		}
		
		System.out.println("\tSESSION STATE : active session. user "+session.getAttribute("email"));
		System.out.println("\tVALID SESSION : true\n");
		return true;
	}
	
	public void printStatus(String status,boolean expected, boolean actual) {
		System.out.println("\tSTATUS MESSAGE   : "+status);
		System.out.println("\tSESSION EXPECTED : "+expected);
		System.out.println("\tSESSION ACTUAL   : "+actual+"\n");
	}
	
	public void setSessionAttr(HttpSession sess, ResultSet rs) throws SQLException {
		String sessEmail   = rs.getString("email"  );
		String sessPass    = rs.getString("pass"   );
		String sessFname   = rs.getString("fname"  );
		String sessLname   = rs.getString("lname"  );
		String sessAddress = rs.getString("address");
		String sessCity    = rs.getString("city"   );
		String sessState   = rs.getString("state"  );
		String sessZip     = (new Integer(rs.getInt("zip"))).toString();
		String sessIsAdmin = String.valueOf(rs.getBoolean("isAdmin"));
		
		if (sessZip.contentEquals("0"))sessZip="N/A";
		
		sess.setAttribute("email"  ,sessEmail  );  
		sess.setAttribute("pass"   ,sessPass   ); 
		sess.setAttribute("fname"  ,sessFname  ); 
		sess.setAttribute("lname"  ,sessLname  ); 
		sess.setAttribute("address",sessAddress);  
		sess.setAttribute("city"   ,sessCity   ); 
		sess.setAttribute("state"  ,sessState  ); 
		sess.setAttribute("zip"    ,sessZip    ); 
		sess.setAttribute("isAdmin",sessIsAdmin); 
		
		String [] cols = {"EMAIL","PASSWORD","FIRST NAME","LAST NAME","ADDRESS","CITY","STATE","ZIP"};
		String [] vals = {sessEmail,sessPass,sessFname,sessLname,sessAddress,sessCity,sessState,sessZip};
	   	
	    sess.setAttribute("cols", cols);
	    sess.setAttribute("vals", vals);
		
	}
}