<%-- 
    Author     : Estefany Mamani Quiquisani
--%>

<%@page import="com.emergentes.modelo.Gestion"%>
<%
   Gestion reg = (Gestion)request.getAttribute("miobjper");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión Vacuna</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    </head>
    <body class="row justify-content-center">
        <h1 align="center">Registro de Vacuna</h1>
        <div class="col-md-4">
            <form action="MainServlet" method="post" class="form-control p-3">
            <div class="mb-3">
                <label class="form-label">ID:</label>
                <input type="text" name="id" class="form-control" readonly="readonly" value="<%= reg.getId()%>">
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <input type="text" class="form-control"  name="nombre" value="<%= reg.getNombre()%>">
            </div>
            <div class="mb-3">
                <label class="form-label">Peso</label>
                <input type="text" class="form-control" name="peso" value="<%= reg.getPeso()%>">
            </div>
            <div class="mb-3">
                <label class="form-label">Talla</label>
                <input type="text" class="form-control" name="talla" value="<%= reg.getTalla()%>">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Vacuna</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="vacuna" id="exampleRadios1" value="Si">
                    <label class="form-check-label" for="exampleRadios1">
                      Si
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="vacuna" id="exampleRadios2" value="No">
                    <label class="form-check-label" for="exampleRadios2">
                      No
                    </label>
                </div>
            </div>
            <input type="submit" class="btn btn-primary" value="Enviar">
        </form>
        </div>
    </body>
</html>
