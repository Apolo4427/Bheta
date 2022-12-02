<%-- 
    Document   : Bheta
    Created on : 21/11/2022, 11:37:04 p. m.
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <div    class="container" col-lg.2>
            <form accion ="" mothod="POST">
                <div class="from-group">
                    <p><strong>Bienvenidos al administrador de tareas</strong></p>
                </div>
                <div class="from-group">
                    <label>nombres:</label>
                    <input class="from-control" type="text" name="txtnom" placeholder="ingrese nombres">
                </div>
                <div class="from-group">
                    <label>contraseña:</label>
                    <input type="password" name="txtcontraseña" placeholder="ingrese su contraseña" class="from-control">
                </div>
                <input class="btn btn-danger btn-block" type="submit" name="registrar" value="registarse">  
                <br>
                <input class="btn btn-danger btn-block" type="submit" name="ingresar" value="ingresar" >
            </form>
            <br>
            
            <% if (request.getParameter("registrar")!=null){
                String nombre = request.getParameter("txtnom");
                String contraseña = request.getParameter("txtcontraseña");
                /*String URL="jdbc:mysql://localhost:3306/usuariostareas";
                String USER= "root";
                String CLAVE= "";*/
                try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariostareas","root","");
                Statement stmt =con.createStatement();
                
                //stmt.executeUpdate("CREATE TABLE IF NOT EXISTS usuarios(nombre varchar(100) PRIMARY KEY,"
                //        + " contraseña varchar(100));");
                //int  nomexists = stmt.executeUpdate("SELEC*FROM usuarios WHERE nombre ='"+nombre+"';" );
                
                //if (nomexists => 1){    
                String incert = "INSERT INTO `usuarios`(`nombre`, `contraseña`) VALUES ('"+nombre+"','"+contraseña+"');";                
                stmt.executeUpdate(incert);
                String tablaNueva = "CREATE TABLE IF NOT EXISTS "+nombre+" (titulo VARCHAR(100) NOT NULL, descripcion TEXT NOT NULL, estado VARCHAR(30) NOT NULL); ";
                stmt.executeUpdate(tablaNueva);                
                out.println("Se ha registrado correctamente");
                stmt.close();
                
                
                
                }
                catch(Exception e){
                out.println(e);
                }
                }
                if (request.getParameter("ingresar")!=null){
                
                String nombre = request.getParameter("txtnom");
                String contraseña = request.getParameter("txtcontraseña");
                //out.print(nombre+"\n");
                //out.print(contraseña+"\n");
                    try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuariostareas","root","");
                    Statement stmt = con.createStatement();
                    String val = "SELECT * FROM `usuarios` WHERE nombre = '"+nombre+"' and contraseña = '"+contraseña+"';" ;
                    ResultSet consulta = stmt.executeQuery(val);
                    //out.print(consulta);
                    /*if (consulta != null){
                        RequestDispatcher rd = request.getRequestDispatcher("tareas.jsp");
                            rd.forward(request, response);
                    }
                    else{out.print("usuario o contraseña incorrectos");}*/
                    ArrayList<String> listaDatos = new ArrayList();
                    while (consulta.next()){
                        listaDatos.add(consulta.getString("nombre"));
                        listaDatos.add(consulta.getString("contraseña"));
                    }
                    //out.print(listaDatos.get(1)+","+"\n");
                    //out.print(nombre+"\n");
                    boolean acceso = false;
                    //if(listaDatos.get(2)==nombre){out.print("sisas");}
                    //for (int i =0; i < listaDatos.size();i++){
                        //out.print(listaDatos.get(i));
                        if ( /*listaDatos.get(i) == nombre && listaDatos.get(i+1)== contraseña*/
                             listaDatos.size() == 2){
                            acceso = true;
                            
                        }
                        else{
                            out.print("Nombre o Contraseña incorrectos"+"\n");
                            acceso = false;
                        }
                       
                    //}
                    if (acceso){
                        RequestDispatcher rd = request.getRequestDispatcher("tareas.jsp");
                        rd.forward(request, response);
                    }
                    //out.print(listaDatos);
                    consulta.close();
                    stmt.close();
                    //out.println(acceso);
                    }
                    catch(Exception e){
                    out.println(e);
                    }
                    
                }
            %>
        </div>    
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
