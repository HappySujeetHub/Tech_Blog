package All_Servles;

import com.sun.jmx.mbeanserver.MXBeanMappingFactory;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entiries.Message;
import com.tech.blog.entiries.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String user_email = request.getParameter("user_email");
            String user_name = request.getParameter("user_name");
            String user_password = request.getParameter("user_password");
            String user_about = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imagename = part.getSubmittedFileName();
            

            // getting session value
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("user");
            // Set Value in user
            user.setEmail(user_email);
            user.setName(user_name);
            user.setPassword(user_password);
            user.setAbout(user_about);
            String oldfile=user.getProfile();
            user.setProfile(imagename);

            // Update database
            UserDao userdao = new UserDao(ConnectionProvider.getConnection());

            boolean ans = userdao.updateUser(user);
            // uploding...
            if (ans) {
                String OldPath = request.getRealPath("/") + File.separator + "img" + File.separator +oldfile;
                if(!oldfile.equals("default.png"))
                {
                Helper.deletFile(OldPath);
                }
                String path = request.getRealPath("/") + File.separator + "img" + File.separator + user.getProfile();

       

                if (Helper.saveFile(part.getInputStream(), path));
                {
                    Message msg = new Message("Profile Details Updated...", "sucess", "alert-success");
                    s.setAttribute("msg", msg);
                    response.sendRedirect("profile.jsp");
                }
            } else {
                Message msg = new Message("Something Went Wrong...", "error", "alert-danger");
                s.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
