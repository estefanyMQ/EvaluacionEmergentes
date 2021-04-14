<%-- 
    Author     : Estefany Mamani Quiquisani
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Gestion"%>

<%
    if(session.getAttribute("listaper")==null){
        ArrayList<Gestion> la = new ArrayList<Gestion>();
        session.setAttribute("listaper", la);
    }
    ArrayList<Gestion> lista = (ArrayList<Gestion>) session.getAttribute("listaper");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión Vacunas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body class="row justify-content-center" align="center">
        <div align="center" style="margin-top: 10px;">
            <div class="col-4">
                <div class="card card-body">
                  <b>PRIMER PARCIAL TEM-742</b>
                  <b>Nombre:</b> Estefany Mamani Quiquisani<br>
                  <b>Carnet:</b>12764616
                </div>
            </div>
        </div>
        <h1 align="center">Listado de Vacunas</h1>
        <div align="center" style="margin-bottom: 10px;">
            <a href="MainServlet?op=nuevo">
                <button type="button" class="btn btn-primary">
                    Nuevo Registro
                </button>
            </a>
        </div>
        <div class="col-md-6">
        <table border="1" class="table">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Peso</th>
                <th>Talla</th>
                <th>Vacuna</th>
                <th class="text-center">Acciones</th>
            </tr>
            <%
                if(lista != null){
                    for(Gestion item : lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getPeso()%></td>
                <td><%= item.getTalla()%></td>
                <td><%= item.getVacuna()%></td>
                <td class="text-center">
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>" 
                       class="btn btn-info">Editar</a>
                
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>" 
                       onclick="return (confirm('Esta seguro de eliminar??'))" 
                       class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        </div>
    </body>
</html>
