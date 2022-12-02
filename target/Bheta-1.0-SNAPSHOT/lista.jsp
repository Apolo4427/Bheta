<%-- 
    Document   : lista
    Created on : 1/12/2022, 12:58:01 a. m.
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <%!
                    String nombre;
                %>
                <% //nombre = request.getParameter("name");
                    nombre = request.getParameter("txtnom");
                    if (nombre ==null){
                        nombre = request.getParameter("nombre");
                        if (nombre == null){
                            nombre = request.getParameter("name");
                        }
                    }%>
            <h1>Este es tu listado de tareas <%=nombre%></h1>
            <a href="tareas.jsp?name=<%=nombre%>">
                Volver
            </a>            
        </nav>
        <br>    
        <div class ="container">
            
            <table border ="1" width="600">
                <tr bgcolor="skyblue">
                    <th>TITULO</th><th>DESCRIPCION</th><th>ESTADO</th>                    
                </tr>
                <%
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariostareas","root","");
                        Statement stmt =con.createStatement();
                        ResultSet consulta = stmt.executeQuery("SELECT * FROM "+nombre+"");
                            
                        ArrayList<String> listaDatos = new ArrayList();
                        while (consulta.next()){
                            listaDatos.add(consulta.getString("titulo"));
                            listaDatos.add(consulta.getString("descripcion"));
                            listaDatos.add(consulta.getString("estado"));    
                        }
                        if (listaDatos.size()==0){%>
                        <h2>AUN NO HAS INCERTADO NINGUNA TAREA</h2>  
                      <%}
                        else if (listaDatos.size()>0){
                            while(consulta.next()){
                                %>
                                <tr>
                                    <th><%=consulta.getString(1)%></th>
                                    <th><%=consulta.getString(2)%></th>
                                    <th><%=consulta.getString(3)%></th>
                                </tr>                                 
                                <%
                            }
                        }
                    consulta.close();
                    stmt.close();
                    }    
                    catch(Exception e){
                        out.println(e);
                    }
                %>
            </table>
            
        </div>
    </body>
</html>
