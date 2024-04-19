
package All_Servles;

import com.tech.blog.entiries.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
           HttpSession s=request.getSession();
          
           s.removeAttribute("user");
           
           Message msg=new Message("Logout Sucessfully","sucess","alert-success");
           s.setAttribute("msg", msg);
           response.sendRedirect("login_page.jsp");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
