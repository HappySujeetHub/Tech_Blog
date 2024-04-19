
package All_Servles;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entiries.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@MultipartConfig
public class Singup extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String check=request.getParameter("check");
             if(check==null)
            {
                out.println("please check term and condition");
            }
            else
            {
             String name=request.getParameter("user_name");
            String email=request.getParameter("email");
            String password=request.getParameter("pswd");
            String gender=request.getParameter("gender");
            String about=request.getParameter("about");
            
            // creating user object and set all data to this object
            User user=new User(name,email,password,gender,about);
            // Create UserDao object
           UserDao dao=new UserDao(ConnectionProvider.getConnection());
           
           if(dao.saveUser(user))
           {
               out.println("done");
           }
           else
           {
               out.println("error");
           }
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
