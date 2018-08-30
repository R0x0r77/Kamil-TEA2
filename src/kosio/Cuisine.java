package kosio;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosio.dto.MenuItem;


@WebServlet(description = "Get chosen cuisine from db", urlPatterns = { "/Cuisine" })
public class Cuisine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cuisine = Integer.parseInt(request.getParameter("menuPage"));
		Process proc = new Process();
		
		List<MenuItem> items = proc.getMenuPage(cuisine);
		request.setAttribute("items", items);
		
		List<MenuItem> drinks = proc.getDrinks();
		request.setAttribute("drinks", drinks);
		
		List<MenuItem> desserts = proc.getDesserts();
		request.setAttribute("desserts", desserts);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Menu.jsp");
		dispatcher.forward(request,response);
	}

}