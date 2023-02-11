import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "calculatorServlet" , value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("productDescription");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        double discountAmount = listPrice*discountPercent*0.01;
        double price = listPrice - discountAmount;
        request.setAttribute("product","Product Description:" + productDescription);
        request.setAttribute("price","List Price:" + listPrice);
        request.setAttribute("percent","Discount Percent:" + discountPercent);
        request.setAttribute("amount","Discount Amount:" + discountAmount);
        request.setAttribute("total","Product total:" +price);
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }
}
