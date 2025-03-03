<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arithmetic Operations</title>
    </head>
    <body>
        <h2>Arithmetic Operations</h2>
        <form method="post">
            Enter First Number: 
            <input type="text" name="num1" required><br><br>
            
            Enter Second Number: 
            <input type="text" name="num2" required><br><br>
            
            Select Operation:
            <select name="operation">
                <option value="add">Addition</option>
                <option value="subtract">Subtraction</option>
                <option value="multiply">Multiplication</option>
                <option value="divide">Division</option>
            </select><br><br>
            
            <input type="submit" value="Calculate">
        </form>

        <%
            // Get the parameters from the form submission
            String num1Str = request.getParameter("num1");
            String num2Str = request.getParameter("num2");
            String operation = request.getParameter("operation");

            if (num1Str != null && num2Str != null && operation != null) {
                try {
                    // Convert input strings to integers
                    int num1 = Integer.parseInt(num1Str);
                    int num2 = Integer.parseInt(num2Str);
                    double result = 0;
                    boolean validOperation = true;

                    // Replacing the switch statement with if-else block
                    if ("add".equals(operation)) {
                        result = num1 + num2;
                        out.println("<h3>Result: " + num1 + " + " + num2 + " = " + result + "</h3>");
                    } else if ("subtract".equals(operation)) {
                        result = num1 - num2;
                        out.println("<h3>Result: " + num1 + " - " + num2 + " = " + result + "</h3>");
                    } else if ("multiply".equals(operation)) {
                        result = num1 * num2;
                        out.println("<h3>Result: " + num1 + " * " + num2 + " = " + result + "</h3>");
                    } else if ("divide".equals(operation)) {
                        if (num2 == 0) {
                            out.println("<h3>Error: Division by zero is not allowed.</h3>");
                        } else {
                            result = (double) num1 / num2;
                            out.println("<h3>Result: " + num1 + " / " + num2 + " = " + result + "</h3>");
                        }
                    } else {
                        validOperation = false;
                    }

                    if (!validOperation) {
                        out.println("<h3>Error: Invalid operation selected.</h3>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<h3>Error: Please enter valid numbers.</h3>");
                }
            }
        %>
    </body>
</html>
