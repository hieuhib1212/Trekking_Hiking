/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Hiệu Bùi
 */
public class Page {
    private int pageID;
    private String pageName;
    private String pageImage;
    private String pageDes;
    private String pageUrl;

    public Page() {
    }

    public Page(int pageID, String pageName, String pageImage, String pageDes, String pageUrl) {
        this.pageID = pageID;
        this.pageName = pageName;
        this.pageImage = pageImage;
        this.pageDes = pageDes;
        this.pageUrl = pageUrl;
    }

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }

    public int getPageID() {
        return pageID;
    }

    public void setPageID(int pageID) {
        this.pageID = pageID;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getPageImage() {
        return pageImage;
    }

    public void setPageImage(String pageImage) {
        this.pageImage = pageImage;
    }

    public String getPageDes() {
        return pageDes;
    }

    public void setPageDes(String pageDes) {
        this.pageDes = pageDes;
    }
    
}
