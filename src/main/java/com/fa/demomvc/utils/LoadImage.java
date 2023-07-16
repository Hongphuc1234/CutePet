package com.fa.demomvc.utils;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class LoadImage
 */
@WebServlet(urlPatterns = "/img/*")
public class LoadImage extends HttpServlet {
    private String imagePath;
    @Override
    public void init() throws ServletException {
         imagePath = System.getProperty("catalina.home")+ File.separator + "user/img";
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedImage = request.getPathInfo();
        if(requestedImage == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        File image = new File(imagePath,URLDecoder.decode(requestedImage, "UTF-8"));
        if(!image.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        String contentType = getServletContext().getMimeType(image.getName());
        if(contentType == null || !contentType.startsWith("image")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        response.reset();
        response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(image.length()));
        Files.copy(image.toPath(),response.getOutputStream());  
    }
}