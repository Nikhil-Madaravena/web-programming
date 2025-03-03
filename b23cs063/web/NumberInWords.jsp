<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Number to Words Converter</title>
    </head>
    <body>
        <form method="post">
            Enter a number:
            <input type="text" name="number" required>
            <br>
            <input type="submit" value="Convert to Words">
        </form>
        <%!
                        // Function to convert numbers to words
            public String convertToWords(int number) {
                if (number == 0) {
                    return "Zero";
                }

                String[] ones = { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
                String[] tens = { "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
                String[] thousands = { "", "Thousand", "Million", "Billion", "Trillion" };

                String words = "";
                int i = 0;

                while (number > 0) {
                    if (number % 1000 != 0) {
                        words = helper(number % 1000) + thousands[i] + " " + words;
                    }
                    number /= 1000;
                    i++;
                }

                return words.trim();
            }

            String helper(int number) {
                String[] ones = { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
                String[] tens = { "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
                
                String result = "";

                if (number >= 100) {
                    result += ones[number / 100] + " Hundred ";
                    number %= 100;
                }

                if (number >= 20) {
                    result += tens[number / 10] + " ";
                    number %= 10;
                }

                if (number > 0) {
                    result += ones[number] + " ";
                }

                return result;
            }
        %>

        <%
            // Handle the form submission and convert the number to words
            String numberStr = request.getParameter("number");
            if (numberStr != null && !numberStr.isEmpty()) {
                try {
                    int number = Integer.parseInt(numberStr);
                    out.println("<p>The number " + number + " in words is: </p>");
                    out.println("<p><strong>" + convertToWords(number) + "</strong></p>");
                } catch (NumberFormatException e) {
                    out.println("<p>Please enter a valid number.</p>");
                }
            }
        %>
    </body>
</html>
