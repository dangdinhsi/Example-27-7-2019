package admincontroller;

import com.google.gson.Gson;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import utility.String_Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class AddSpecialContent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/special-content.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String contentString = String_Util.convertInputStreamToString(req.getInputStream());
        JSONObject jsonObject = new JSONObject(contentString);
        String url = jsonObject.getString("url");
        String titleSelector =jsonObject.getString("titleSelector");
        String descriptionSelector =jsonObject.getString("descriptionSelector");
        String contentSelector = jsonObject.getString("contentSelector");
        Document document = Jsoup.connect(url).ignoreContentType(true).get();
        String title =document.select(titleSelector).text();
        String description =document.select(descriptionSelector).text();
        String content =document.select(contentSelector).html();
        HashMap<String,String> hashMap = new HashMap<>();
        hashMap.put("title",title);
        hashMap.put("description",description);
        hashMap.put("content",content);
        resp.getWriter().println(new Gson().toJson(hashMap));
    }
}
