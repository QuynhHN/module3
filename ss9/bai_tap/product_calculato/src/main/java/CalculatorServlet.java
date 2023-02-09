import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet" , value = "/calculators")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("productDescription");
        double  listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double  discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        double discountAmount = listPrice*discountPercent*0.01;
        double discountPrice = listPrice - discountAmount;
        request.setAttribute("p1",productDescription);
        request.setAttribute("p2",listPrice);
        request.setAttribute("p3",discountPercent);
        request.setAttribute("p4",discountAmount);
        request.setAttribute("p5",discountPrice);
        request.getRequestDispatcher("test.jsp").forward(request,response);
    }
}
