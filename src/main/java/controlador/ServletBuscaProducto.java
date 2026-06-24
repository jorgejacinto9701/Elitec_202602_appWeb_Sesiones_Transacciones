package controlador;

import java.io.IOException;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/buscaProducto")
public class ServletBuscaProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(ServletBuscaProducto.class.getName());

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		log.info("En ServletBuscaProducto");
		


	}

}
