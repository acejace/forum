<%@ page language="java" 
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<%@ include file="accessJDBC.jsp" %>

<!DOCTYPE html>
<html>
   <head>
   <% 
   %>
      <title>Using GET Method to Read Form Data</title>
   </head>
   
   <body>
      <h1>Using GET Method to Read Form Data</h1>
      <ul>
         <li><p><b>First Name:</b>
            <%= request.getAttribute("first_name")%>
         </p></li>
         <li><p><b>Last  Name:</b>
            <%= request.getAttribute("last_name")%>
         </p></li>
      </ul>
   
   </body>
</html>