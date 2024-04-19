
package All_Servles;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LikeServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
          String operation=request.getParameter("operation");
          int uid=Integer.parseInt(request.getParameter("uid"));
          int pid=Integer.parseInt(request.getParameter("pid"));
            LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
         if(operation.equals("like"))
         {
             boolean f=ldao.insertlike(pid, uid);
             out.println(f);
         }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
