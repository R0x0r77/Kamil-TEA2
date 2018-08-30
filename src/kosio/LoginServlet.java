package kosio;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosio.dto.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		Process proc = new Process();
		
		User user = (User) proc.getUserFromDB(userName);
		request.getSession().setAttribute("user", user);
		
		if (userName.equals(user.getLoginName()) && password.equals(user.getPassword()) ) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
			dispatcher.forward(request, response);
		} else {
			
			response.sendRedirect("LoginFailed.jsp");
		}
		
	}

}