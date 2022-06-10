/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBContext;
import dao.HomeDAO;
import dao.LinkDAO;
import dao.ViewDAO;
import entity.Page;
import entity.Share;
import entity.TrekkingLink;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hiệu Bùi
 */
public class LinksController extends HttpServlet {

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
        try {
            LinkDAO ldao = new LinkDAO();
            HomeDAO hdao = new HomeDAO();
            DBContext db = new DBContext();

            //get imagePath
            String imagePath = db.getImagePath();
            request.setAttribute("imagePath", imagePath);
            //get share panel
            ArrayList<Share> share = hdao.getSharePanel();
            request.setAttribute("sharePanel", share);
            //get pages
            ArrayList<Page> pages = hdao.getPages();
            request.setAttribute("pageList", pages);
            //count link number
            int count = ldao.countLink();
            if (count <= 0) {
                request.setAttribute("error", "Trekking Links is not available");
            }
            //get pageSize of GalleryPage
            int pageSize = db.getdiaryPagingSize();
            int endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            request.setAttribute("endPage", endPage);

            //get index from TrekkingLink.jsp
            String indexx = request.getParameter("index");
            int index = 0;
            if (indexx == null) {
                index = 1;
            } else {
                try {
                    index = Integer.parseInt(indexx);
                    //check range of index in [1;endPage] or not
                    if (index > endPage || index < 1) {
                        request.setAttribute("error", "Invalid range of index on paging");
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid index");
                }
            }

            request.setAttribute("index", index);
            
            //get view 
            ViewDAO vDao = new ViewDAO();
            HttpSession session = request.getSession();
            if (session.isNew()) {
                vDao.updateView();
            }
            int view = vDao.getView();
            String formatted = String.format("%06d", view);
            ArrayList<String> number = new ArrayList<>();
            Collections.addAll(number, formatted.split(""));
            session.setAttribute("view", number);
            //get list link with paging
            ArrayList<TrekkingLink> listTrekking = ldao.getLinkWithPaging(index);
            request.setAttribute("listLink", listTrekking);
            //set active page
            request.setAttribute("active", "Trekking Links");
            request.getRequestDispatcher("TrekkingLink.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("error", ex);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
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
