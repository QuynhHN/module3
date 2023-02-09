import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "calculatorServlet" , value = "/calculatorServlet")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("productDescription");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        double discountAmount = listPrice*discountPercent*0.01;
        double price = listPrice - discountAmount;
        request.setAttribute("n1","Product Description:" + productDescription);
        request.setAttribute("n2","List Price:" + listPrice);
        request.setAttribute("n3","Discount Percent:" + discountPercent);
        request.setAttribute("n4","Discount Amount:" + discountAmount);
        request.setAttribute("n5","Product total:" +price);
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }
}
