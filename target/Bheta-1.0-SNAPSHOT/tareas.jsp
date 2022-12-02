<%-- 
    Document   : principal
    Created on : 22/11/2022, 10:06:47 a. m.
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador_Tareas</title>
        <link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <div class="container">
                <%!
                    String nombre;
                %>
                <%  nombre = request.getParameter("txtnom");
                    if (nombre ==null){
                        nombre = request.getParameter("nombre");
                        if (nombre == null){
                            nombre = request.getParameter("name");
                        }
                    }
                    
                
                %>
                        <h1>Bienbenido <%= nombre %> </h1>
                        <a href="Bheta.jsp">
                            salir
                        </a>
                        <!--<p><strong>Administra tu lista de tareas:</strong></p>
                        <input type ="submit" name="crear" value="CREAR MI LISTA"> 
                        <input type="submit" name="agregar" value="AGREGAR TAREA">-->               
            </div>
        </nav>
     <div class="container">
      <div class="row my-5">
        <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <!-- FORM TO ADD TASKS -->
              <form accion="">
                <!--<div class="form-group">
                  <input type="text" name="title" placeholder="Titulo" class="form-control">
                </div>
                <div class="form-group">
                  <textarea name="description" cols="30" rows="10" class="form-control" placeholder = "descripcion de la tarea"></textarea>
                </div>
                <div class="form-group">
                  <input type="text" name="estado" placeholder="Astado de la tarea" class="form-control">
                </div>-->
                  <br>
                  <a href="nuevaTarea.jsp?nombre=<%=nombre%>" class="btn btn-primary btn-block" >Crear nueva tarea</a>
                  <!--<input type="submit" class="btn btn-primary btn-block" name= "Save" value="save"  >-->
                  <!-- CREAR TABLA CON EL NOMBRE DEL USUARIO, Y AGREGAR ESTA TAREA COMO PRIMERA FILA -->
                  <%                      
                      /*if(request.getParameter( "Save" )!= null){
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariostareas","root","");
                            Statement stmt =con.createStatement();
                            
                            String titulo = request.getParameter("title");
                            String descripcion = request.getParameter("description");
                            String estado = request.getParameter("estado");
                            String tareaNueva = "INSERT INTO `usuarios`(`titulo`, `descripcion`, estado) "
                            + "VALUES ('"+titulo+"','"+descripcion+"','"+estado+"');";
                            stmt.executeUpdate(tareaNueva); 
                                
                            
                        }
                        catch(Exception e){
                            out.println(e);
                        }
                      }*/
                  %>
                  <br>
                  <a href="lista.jsp?name=<%=nombre%>" class="btn btn-primary btn-block" >Lista de tareas</a>
                  <!--<input type="button" class="btn btn-primary btn-block" name="tareas" value="Lista tareas">
                  <!-- IR A LA PAGINA LISTA DONDE SE VISUALISARA, LAS TAREAS DEL USUARIO -->
                  <%/*
                      if (request.getParameter("tareas")!=null){
                        RequestDispatcher rd = request.getRequestDispatcher("lista.jsp");
                        rd.forward(request, response);
                      }*/
                  %>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    </body>
</html>


