
package All_Servles;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entiries.Message;
import com.tech.blog.entiries.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
           String userEmail=request.getParameter("email");
           String userPassword=request.getParameter("pswd");
         
             // USerDao object
           
           UserDao dao=new UserDao(ConnectionProvider.getConnection());
           User u=dao.getUserByEmailAndPassword(userEmail,userPassword);
           if(u==null)
           {
               //login ...........
                // out.println("Invalid email id or password... try again");
             Message msg=new Message("Invalid Detailes ! try with another","error","alert-danger");
             HttpSession s=request.getSession();
             s.setAttribute("msg",msg);
             response.sendRedirect("login_page.jsp");
           }
           else
           {
               HttpSession s=request.getSession();
               s.setAttribute("user", u);
               response.sendRedirect("profile.jsp");
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
