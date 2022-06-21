/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controlador.AccionesReporte;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DReporte;

/**
 *
 * @author Rogelio Colunga R
 */
public class editarReporte extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String fecha, hora, problema, etiqueta;
            int prioridad, estadorep, asignatura, persona, reporte_id;
            
            fecha = request.getParameter("fecha");
            hora = request.getParameter("hora");
            problema = request.getParameter("descripcion");
            etiqueta = request.getParameter("equipo");
            prioridad = parseInt(request.getParameter("prioridad"));
            estadorep = parseInt(request.getParameter("ereporte"));
            asignatura = parseInt(request.getParameter("asignatura"));
            persona = parseInt(request.getParameter("persona_id"));
            reporte_id = parseInt(request.getParameter("reporte_id"));
            
            DReporte e = new DReporte();
            
            e.setPrioridad_id(prioridad);
            e.setEdoRe_id(estadorep);
            e.setAsignatura_id(asignatura);
            e.setDetalleReporte_fecha(fecha);
            e.setDetalleReporte_hora(hora);
            e.setProblema(problema);
            e.setPersona_id(persona);
            e.setEquipo_etiqueta(etiqueta);
            e.setDetalleReporte_id(reporte_id);
            
            int estatus = AccionesReporte.actualizarDReporte(e);
            
            if(estatus>0){
                response.sendRedirect("editReporte.jsp?id_reporte="+reporte_id);
            }else{
                response.sendRedirect("error.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
