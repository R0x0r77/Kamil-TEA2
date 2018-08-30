package kosio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Process proc = new Process();
		
		String loginName = request.getParameter("loginName");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String repeatPassword = request.getParameter("repeatPassword");
		
		if (!password.equals(repeatPassword) || loginName.length() < 1 
			|| firstName.length() < 1 || lastName.length() < 1 || password.length() < 1) {
			
			request.setAttribute("incorrect input", "incorrect input");
			request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
		} else {
		
		proc.createNewAccount(loginName, firstName, lastName, password);
		
		request.setAttribute("accountCreated", "Account successfully created!");
		request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
		}
	}

}