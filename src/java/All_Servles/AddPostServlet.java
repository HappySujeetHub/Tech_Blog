package All_Servles;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entiries.Message;
import com.tech.blog.entiries.Post;
import com.tech.blog.entiries.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("image");
//          String imagename = part.getSubmittedFileName();
            // getting Currentuser id
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());

            PostDao pd = new PostDao(ConnectionProvider.getConnection());
            if (pd.savePost(p)) {
                String path = request.getRealPath("/") + File.separator + "blogs_pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                out.println("done");
            } else {
                out.println("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
