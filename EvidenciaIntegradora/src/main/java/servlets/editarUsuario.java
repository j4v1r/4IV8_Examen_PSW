/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controlador.AccionesUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.MUsuario;

/**
 *
 * @author Rogelio Colunga R
 */
public class editarUsuario extends HttpServlet {

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
            String nom, appat, apmat, sexo, fecha, usuario, contrasena;
            int identificador, persona_id;
            
            persona_id = parseInt(request.getParameter("persona_id"));
            nom = request.getParameter("nombre");
            appat = request.getParameter("appat");
            apmat = request.getParameter("apmat");
            sexo = request.getParameter("sexo");
            fecha = request.getParameter("fnac");
            usuario = request.getParameter("user");
            contrasena  = request.getParameter("pass");
            identificador = parseInt(request.getParameter("No-emp"));
            
            MUsuario e = new MUsuario();
            
            e.setPersona_id(persona_id);
            e.setPersona_nombre(nom);
            e.setPersona_appat(appat);
            e.setPersona_apmat(apmat);
            e.setPersona_sexo(sexo);
            e.setPersona_fecha(fecha);
            e.setPersona_user(usuario);
            e.setPersona_pass(contrasena);
            e.setIdentificador(identificador);
            
            int estatus = AccionesUsuario.actualizarUsuario(e);
            
            if(estatus>0){
                response.sendRedirect("editarP.jsp");
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
