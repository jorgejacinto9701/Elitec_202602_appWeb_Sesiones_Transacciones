package controlador;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import dao.UsuarioDAO;
import entidad.Enlace;
import entidad.Usuario;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(ServletLogin.class.getName());
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
	}

}








