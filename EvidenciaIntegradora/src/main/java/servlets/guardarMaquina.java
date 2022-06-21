/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controlador.AccionesParaMaquina;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DEquipo;

/**
 *
 * @author Rogelio Colunga R
 */
public class guardarMaquina extends HttpServlet {

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
            String etiqueta, cpu, monitor, config;
            int lab, marca, accesorio, estado;
            
            etiqueta = request.getParameter("etiqueta");
            lab = Integer.parseInt(request.getParameter("lab"));
            marca = Integer.parseInt(request.getParameter("marca"));
            cpu = request.getParameter("cpu");
            accesorio = Integer.parseInt(request.getParameter("accesorio"));
            monitor = request.getParameter("monitor");
            config = request.getParameter("config");
            estado = Integer.parseInt(request.getParameter("edo"));
            
            DEquipo e = new DEquipo();
            
            e.setEquipo_etiqueta(etiqueta);
            e.setLab_id(lab);
            e.setMarca_id(marca);
            e.setCpu_serial(cpu);
            e.setAccesorio_id(accesorio);
            e.setMonitor_id(monitor);
            e.setConfig_id(config);
            e.setEdoEquipo_id(estado);
            
            int estatus = AccionesParaMaquina.registrarMaquina(e);
            
            if(estatus > 0){
                response.sendRedirect("maquinasAdmin.jsp");
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
