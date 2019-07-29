package admincontroller;

import entity.Article;
import org.json.JSONObject;
import utility.String_Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class SaveSpecialContent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String contentString = String_Util.convertInputStreamToString(req.getInputStream());
        JSONObject jsonObject = new JSONObject(contentString);
        String url = jsonObject.getString("url");
        String title = jsonObject.getString("title");
        String description =jsonObject.getString("description");
        String content =jsonObject.getString("content");
        Article article = new Article(url);
        article.setTitle(title);
        article.setDescription(description);
        article.setContent(content);
        ofy().save().entity(article).now();
        resp.getWriter().println("OK!!!!");
    }
}
