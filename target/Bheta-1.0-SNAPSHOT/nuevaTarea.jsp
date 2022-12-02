<%-- 
    Document   : nuevaTarea
    Created on : 1/12/2022, 8:15:56 a. m.
    Author     : user
--%>

<%@page import="java.sql.*
        "%>
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
            <h2>Hola <%= nombre %> aqui puedes ingresar tus tareas</h2>
            <a href="tareas.jsp?name=<%=nombre%>">
                Volver
            </a>            
   </nav>
      <div class="container">
      <div class="row my-5">
        <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <!-- FORM TO ADD TASKS -->
              <form accion="">
                <div class="form-group">
                    <%!//String nombre; %>
                    <%// nombre = request.getParameter("nombre"); %>
                    <!--<h4>Hola <%//= nombre %> aqui puedes ingresar tus tareas</h4>-->
                  <input type="text" name="titulo" placeholder="Titulo" class="form-control">
                </div>
                <div class="form-group">
                  <input type="text" name="descripcion" cols="30" rows="10" class="form-control" placeholder = "descripcion de la tarea">
                </div>
                <div class="form-group">
                  <input type="text" name="estado" placeholder="Estado de la tarea" class="form-control">
                </div>
                  <br>
                   <%!
                    /*String titulo;
                    String descripcion;
                    String estado;
                    String nombre;*/                    
        %>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariostareas","root","");
                Statement stmt =con.createStatement();
                            
                String titulo = request.getParameter("titulo");
                String descripcion = request.getParameter("descripcion");
                String estado = request.getParameter("estado");
                String tareaNueva = "INSERT INTO `"+nombre+"`(`titulo`, `descripcion`, `estado`) VALUES ('"+titulo+"','"+descripcion+"','"+estado+"');";
                stmt.executeUpdate(tareaNueva);
                stmt.close();
                //response.sendRedirect("tareas.jsp");
                            
            }
            catch(Exception e){
                out.println(e);
            }
        %>
               <a href="tareas.jsp?nombre=<%=request.getParameter("nombre")%>" class="btn btn-primary btn-block" >Guardar</a>
               
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    </body>
</html>
