/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ACER
 */
public class Blog {

    private int blog_id;
    private String title;
    private String author;
    private String image;
    private String brief_info;
    private Date createDate;
    private String blog_content;
    private int cate_id;
    private Boolean status;
    private String category;
    private String thumbnail;
    private String flag;
    private Date dateModified;
    private int numberOfAccess;

    public Blog(int blog_id, String title, String author, String image, String brief_info, Date createDate, String blog_content, int cate_id, Boolean status, String category, String thumbnail, String flag, Date dateModified, int numberOfAccess) {
        this.blog_id = blog_id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.brief_info = brief_info;
        this.createDate = createDate;
        this.blog_content = blog_content;
        this.cate_id = cate_id;
        this.status = status;
        this.category = category;
        this.thumbnail = thumbnail;
        this.flag = flag;
        this.dateModified = dateModified;
        this.numberOfAccess = numberOfAccess;
    }

    public int getNumberOfAccess() {
        return numberOfAccess;
    }

    public void setNumberOfAccess(int numberOfAccess) {
        this.numberOfAccess = numberOfAccess;
    }

    public Blog() {
    }

    public Blog(int blog_id, String title, String author, String image, String brief_info, Date createDate, String blog_content, int cate_id, boolean status) {
        this.blog_id = blog_id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.brief_info = brief_info;
        this.createDate = createDate;
        this.blog_content = blog_content;
        this.cate_id = cate_id;
        this.status = status;
    }

    public Blog(int blog_id, String title, String author, String image, String brief_info, Date createDate, String blog_content) {
        this.blog_id = blog_id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.brief_info = brief_info;
        this.createDate = createDate;
        this.blog_content = blog_content;
    }

    public Blog(int blog_id, String title, String author, String image, String brief_info, Date createDate, String blog_content, int cate_id, boolean status, String category) {
        this.blog_id = blog_id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.brief_info = brief_info;
        this.createDate = createDate;
        this.blog_content = blog_content;
        this.cate_id = cate_id;
        this.status = status;
        this.category = category;
    }

    public Blog(int blog_id, String title, String author, String image, String brief_info, Date createDate, String blog_content, int cate_id, boolean status, String category, String thumbnail, String flag, Date dateModified) {
        this.blog_id = blog_id;
        this.title = title;
        this.author = author;
        this.image = image;
        this.brief_info = brief_info;
        this.createDate = createDate;
        this.blog_content = blog_content;
        this.cate_id = cate_id;
        this.status = status;
        this.category = category;
        this.thumbnail = thumbnail;
        this.flag = flag;
        this.dateModified = dateModified;
    }
    
    

    public int getBlog_id() {
        return blog_id;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public String getImage() {
        return image;
    }

    public String getBrief_info() {
        return brief_info;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public String getBlog_content() {
        return blog_content;
    }

    public int getCate_id() {
        return cate_id;
    }

    public Boolean isStatus() {
        return status;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setBrief_info(String brief_info) {
        this.brief_info = brief_info;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setBlog_content(String blog_content) {
        this.blog_content = blog_content;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Date getDateModified() {
        return dateModified;
    }

    public void setDateModified(Date dateModified) {
        this.dateModified = dateModified;
    }

    public boolean getStatus() {
        return status;
    }
    
    

}
