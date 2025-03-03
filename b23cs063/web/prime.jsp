<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prime Number Checker</title>
    </head>
    <body>
        <form method="post">
            Enter any number:
            <input type="text" name="t1" required>
            <br>
            <input type="submit" value="Check">
        </form>
        
        <%
            // Only process if form is submitted
            String t1 = request.getParameter("t1");
            
            if (t1 != null && !t1.isEmpty()) {
                try {
                    int n = Integer.parseInt(t1);
                    out.println("Given number is: " + n);

                    if (n < 2) {
                        out.println("<br>" + n + " is not a prime number (Prime numbers are greater than 1).");
                    } else {
                        int d = 2;
                        while (d < n) {
                            if (n % d == 0) {
                                out.println("<br>" + n + " is not a prime number.");
                                break;
                            }
                            d++;
                        }

                        if (d == n) {
                            out.println("<br>" + n + " is a prime number.");
                        }
                    }
                } catch (NumberFormatException e) {
                    out.println("<br>Please enter a valid integer.");
                }
            }
        %>
    </body>
</html>
