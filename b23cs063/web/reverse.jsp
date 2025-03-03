<%-- 
    Document   : reverse
    Created on : Feb 8, 2024, 11:12:52 AM
    Author     : VC LAB 72
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            enter string:<input type="text" name="str"><br>
            <input type="submit" value="reverse">
        </form>
        
        <br>
        <% String inputstr = request.getParameter("str");
        if(inputstr!=null&&!inputstr.isEmpty()){
            String reversed = new StringBuilder(inputstr).reverse().toString();
            out.println("original string is "+inputstr+"<br>");
            out.println("reversed string is "+reversed);
        }
        
        %>
    </body>
</html>
