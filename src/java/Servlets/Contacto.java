package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Contacto", urlPatterns = {"/Contacto"})
public class Contacto extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      /* TODO output your page here. You may use following sample code. */
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet Contacto</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet Contacto at " + request.getContextPath() + "</h1>");
      out.println("</body>");
      out.println("</html>");
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.sendRedirect("index.jsp");
    
    /*
    Properties properties = new java.util.Properties();
    properties.setProperty("mail.smtp.host", "localhost");
    Session session = Session.getDefaultInstance(properties);
    
    String apenom = request.getParameter("apenom");
    String from = request.getParameter("email");
    String to = "alvfacu@gmail.com";
    String tel = request.getParameter("telefono");
    String subject = request.getParameter("asunto");
    String text = request.getParameter("mensaje");
    
    try {
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(from));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
      message.setSubject(subject);
      message.setText(text);
      Transport.send(message);
      } catch (MessagingException mex) {
      mex.printStackTrace();
    }*/

  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
