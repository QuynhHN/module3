import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        int firstOperand = Integer.parseInt(request.getParameter("first-operand"));
        int secondOperand = Integer.parseInt(request.getParameter("second-operand"));
        String operator = request.getParameter("operator");
        int result = 0;
        switch (operator) {
            case "+":
                result = firstOperand + secondOperand;
                break;
            case "-":
                result = firstOperand - secondOperand;
                break;
            case "*":
                result = firstOperand * secondOperand;
                break;
            case "/":
                if (secondOperand == 0) {
                    throw new ArithmeticException("Second operand not zero");
                } else {
                    result = firstOperand / secondOperand;
                    break;
                }
        }
        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}

