/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.MUsuario;

/**
 *
 * @author Rogelio Colunga R
 */
public class iniciarSesion extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String persona_user, persona_pass;
            
            persona_user = request.getParameter("usuariois");
            persona_pass = request.getParameter("contrais");
            
            MUsuario usuario = new MUsuario();
            
            //verificar al usuario
            usuario = usuario.verificarUsuario(persona_user, persona_pass);
            
            //hay que crear la sesion
            
            if(usuario != null){
                //si existe en la BD
                //se crea la sesion de la bd
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", usuario);
                
                //otra sesion que obtendra solo el parametro
                HttpSession sesionUser = request.getSession();
                sesionUser.setAttribute("usuario", persona_user);
                
                HttpSession sesionRol = request.getSession();
                sesionRol.setAttribute("rol", usuario.getRol_id());
                
                HttpSession sesionNombre = request.getSession();
                sesionNombre.setAttribute("nombre", usuario.getPersona_nombre());
                
                HttpSession sesionId = request.getSession();
                sesionId.setAttribute("id_persona", usuario.getPersona_id());
                
                HttpSession sesionGrupo = request.getSession();
                sesionGrupo.setAttribute("grupo_id", usuario.getGrupo_id());
                
                //saber el privilegio switch
                switch (usuario.getRol_id()) {
                    case 5:
                        response.sendRedirect("misReportes.jsp");
                        break;
                    case 6:
                        response.sendRedirect("alumnosDoc.jsp");
                        break;
                    default:
                        response.sendRedirect("principal.jsp");
                        break;
                }
                
            
            }else{
                response.sendRedirect("registrarse.jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(iniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(iniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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