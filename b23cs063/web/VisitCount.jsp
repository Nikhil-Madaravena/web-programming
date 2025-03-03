<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession userSession = request.getSession(); // using userSession here
            Integer visitorCount = (Integer) userSession.getAttribute("visitorCount"); // use userSession instead of session
            
            if(visitorCount == null){
                visitorCount = 1;
            } else {
                visitorCount++;
            }
            userSession.setAttribute("visitorCount", visitorCount); // use userSession here too
         %>
         <p>Visitor Count : <%= visitorCount %> </p>
        <h1>Hello World!</h1>
    </body>
</html>
