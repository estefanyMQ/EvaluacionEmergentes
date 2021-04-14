package com.emergentes.controller;

import com.emergentes.modelo.Gestion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Estefany
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcion  = request.getParameter("op");
        Gestion objper = new Gestion();
        int id, pos;
        HttpSession ses     = request.getSession();
        List<Gestion> lista = (List<Gestion>)ses.getAttribute("listaper");
        switch(opcion){
            case "nuevo":
                request.setAttribute("miobjper", objper);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id  = Integer.parseInt(request.getParameter("id"));
                // Obtener la posición del elemento de la colección
                pos = buscarPorIndice(request, id);
                // Obtener el objeto
                objper = lista.get(pos);
                // Enviarlo para edición
                request.setAttribute("miobjper", objper);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                // Obtener posición del elemento en la colección
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request, id);
                if(pos>=0){
                    lista.remove(pos);
                }
                //Actualizamos la lista debido a la elimincación
                request.setAttribute("listaper", lista);
                response.sendRedirect("index.jsp");
                break;
            default:
                request.setAttribute("listaper", lista);
                response.sendRedirect("index.jsp");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id              = Integer.parseInt(request.getParameter("id"));
        HttpSession ses     = request.getSession();
        ArrayList<Gestion> lista = (ArrayList<Gestion>)ses.getAttribute("listaper");
        Gestion objper = new Gestion();
        objper.setId(id);
        objper.setNombre(request.getParameter("nombre"));
        objper.setPeso(Float.parseFloat(request.getParameter("peso")));
        objper.setTalla(Float.parseFloat(request.getParameter("talla")));
        objper.setVacuna(request.getParameter("vacuna"));
        System.out.println("El ID es "+id);
        if(id == 0){
            int idNuevo = obtenerId(request);
            objper.setId(idNuevo);
            
            lista.add(objper);
            System.out.println(objper.toString());
        }else{
            int pos = buscarPorIndice(request, id);
            lista.set(pos, objper);
            System.out.println(objper.toString());
        }
        System.out.println("Enviando as Index");
        request.setAttribute("listaper", lista);
        response.sendRedirect("index.jsp");
    }
    
    public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        List<Gestion> lista = (List<Gestion>)ses.getAttribute("listaper");
        
        int pos = -1;
        
        if(lista != null){
            for(Gestion ele : lista){
                ++pos;
                if(ele.getId() == id){
                    break;
                }
            }
        }
        return pos;
    }
    
    public int obtenerId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Gestion> lista = (ArrayList<Gestion>)ses.getAttribute("listaper");
        int idn = 0;
        for (Gestion ele : lista){
            idn = ele.getId();
        }
        return idn+1;
    }

}
