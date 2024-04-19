package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registration_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Nav_Bar.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Registration page</title>\n");
      out.write("        <!-- css file-->\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <!-- BootStrap -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <style>\n");
      out.write("            .banner-background{\n");
      out.write("                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 93%, 35% 100%, 0 93%, 0 0);\n");
      out.write("            }\n");
      out.write("        </style> \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!--NavBar-->\n");
      out.write("        ");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-dark primary-background\">\n");
      out.write("    <a class=\"navbar-brand\" href=\"index.jsp\"><span class=\"fa fa-certificate\"> </span> Tech Blog</a>\n");
      out.write("  <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("  </button>\n");
      out.write("\n");
      out.write("  <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("    <ul class=\"navbar-nav mr-auto\">\n");
      out.write("      <li class=\"nav-item active\">\n");
      out.write("          <a class=\"nav-link\" href=\"#\"><span class=\"fa fa-bolt\"> </span> Home <span class=\"sr-only\">(current)</span></a>\n");
      out.write("      </li>\n");
      out.write("      \n");
      out.write("      <li class=\"nav-item dropdown\">\n");
      out.write("        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("            <span class=\"fa fa-check-square-o\"> </span> Categories\n");
      out.write("        </a>\n");
      out.write("        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("          <a class=\"dropdown-item\" href=\"#\">Programming Language</a>\n");
      out.write("          <a class=\"dropdown-item\" href=\"#\">Project Implementation</a>\n");
      out.write("          <div class=\"dropdown-divider\"></div>\n");
      out.write("          <a class=\"dropdown-item\" href=\"#\">Data Structure</a>\n");
      out.write("        </div>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("          <a class=\"nav-link\" href=\"#\"><span class=\"fa fa-address-book-o\"> </span> Contact</a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("          <a class=\"nav-link\" href=\"login_page.jsp\"><span class=\"fa fa-user-circle\"> </span> Login</a>\n");
      out.write("      </li>\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("          <a class=\"nav-link\" href=\"registration_page.jsp\"><span class=\"fa fa-user-circle\"> </span> Sign up</a>\n");
      out.write("      </li>\n");
      out.write("      \n");
      out.write("    </ul>\n");
      out.write("    <form class=\"form-inline my-2 my-lg-0\">\n");
      out.write("      <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("      <button class=\"btn btn-outline-light my-2 my-sm-0\" type=\"submit\">Search</button>\n");
      out.write("    </form>\n");
      out.write("  </div>\n");
      out.write("</nav>");
      out.write("\n");
      out.write("\n");
      out.write("        <!--Form Tag-->\n");
      out.write("        <main class=\"banner-background\" id=\"primary-background1\" style=\"padding-bottom:50px;\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <div class=\"col-md-4 offset-md-4\">\n");
      out.write("\n");
      out.write("                    <div class=\"card\">\n");
      out.write("\n");
      out.write("                        <div class=\"card-header text-center text-white\" id=\"primary-background1\">\n");
      out.write("                            <span class=\"fa fa-user-circle fa-3x\"></span>\n");
      out.write("                            <p>Register Hear</p>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("\n");
      out.write("                            <form id=\"reg-form\" action=\"Singup\" method=\"POST\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"exampleInputEmail1\">User Name</label>\n");
      out.write("                                    <input type=\"user_name\" name=\"user_name\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"Enter user name\">                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                                    <input type=\"email\" name=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"Enter email\">\n");
      out.write("                                    <small id=\"emailHelp\" class=\"form-text text-muted\">We'll never share your email with anyone else.</small>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                                    <input type=\"password\" name=\"pswd\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\" />\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"gender\">Select Gender</label><br>\n");
      out.write("                                    <input type=\"radio\" id=\"gender\" name=\"gender\" value=\"Male\">Male\n");
      out.write("                                    <input type=\"radio\" id=\"gender\" name=\"gender\" value=\"Female\">Female\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"from-group\">\n");
      out.write("                                    <input type=\"textarea\" name=\"about\" class=\"form-control\" id=\"\" rows=\"5\" placeholder=\"Enter something about your self\"><br> \n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"form-check\">\n");
      out.write("                                    <input type=\"checkbox\" name=\"check\" class=\"form-check-input\" id=\"exampleCheck1\">\n");
      out.write("                                    <label class=\"form-check-label\" for=\"exampleCheck1\">agree terms and condition</label>\n");
      out.write("                                </div><br>\n");
      out.write("                                <div class=\"container text-center\" id=\"loder\" style=\"display:none\">\n");
      out.write("                                <span class=\"fa fa-refresh fa-spin fa-3x\"></span>\n");
      out.write("                                <h4>Please wait...</h4>\n");
      out.write("                                </div>\n");
      out.write("                                <button id=\"submit-btn\" type=\"submit\" class=\"btn btn-primary\">Submit</button>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Java Script --> \n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.4.1.js\" integrity=\"sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"js/myjs.js\" type=\"text/javascript\"></script>\n");
      out.write("       <script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("                \n");
      out.write("                 console.log(\"loding...\");\n");
      out.write("                 $('#reg-form').on('submit',function(event){\n");
      out.write("                    event.preventDefault();\n");
      out.write("                    let form=new FormData(this);\n");
      out.write("                    \n");
      out.write("                    $(\"#submit-btn\").hide();\n");
      out.write("                    $(\"#loder\").show();\n");
      out.write("                // Send to servlet\n");
      out.write("                    \n");
      out.write("                    $.ajax({\n");
      out.write("                        url:\"Singup\",\n");
      out.write("                        type:\"POST\",\n");
      out.write("                        data:form,\n");
      out.write("                        success: function (data,textStatus,jqXHR){\n");
      out.write("                          console.log(data); \n");
      out.write("                          $(\"#submit-btn\").show();\n");
      out.write("                           $(\"#loder\").hide();\n");
      out.write("                          \n");
      out.write("                          if(data.trim()=== 'done')\n");
      out.write("                          {\n");
      out.write("                              swal(\"Registration Sucessfully\", \"You clicked the button!\", \"success\")\n");
      out.write("                                   .then((value)=>{\n");
      out.write("                                       window.location=\"login_page.jsp\";\n");
      out.write("                                   });\n");
      out.write("                           }\n");
      out.write("                         else\n");
      out.write("                         {\n");
      out.write("                           swal(data);\n");
      out.write("                         }\n");
      out.write("                        },\n");
      out.write("                        error: function (jqXHR,textStatus,errorThrown){\n");
      out.write("                          console.log(jqXHR); \n");
      out.write("                          $(\"#submit-btn\").show();\n");
      out.write("                           $(\"#loder\").hide();\n");
      out.write("                           swal(\"Something went wrong\", \"Try again!\", \"success\");\n");
      out.write("                        },\n");
      out.write("                        processData: false,  \n");
      out.write("                        contentType: false,\n");
      out.write("    \n");
      out.write("                       \n");
      out.write("                    });\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                })\n");
      out.write("                \n");
      out.write("              })\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
