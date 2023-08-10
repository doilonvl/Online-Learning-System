/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class Course {

    private int course_id;
    private String name;
    private String title;
    private double original_price;
    private double sale_price;
    private String original_priceString;
    private String sale_priceString;
    private String brief_infor;
    private int cate_id;
    private int sale_id;
    private String image;
    private Date course_date;
    private int user_id;
    private String cateName;
    private int lessons;
    private boolean status;
    private String user_name;

    public Course() {
    }
    public Course(int course_id, String name, String title, double original_price, String brief_infor, String image, Date course_date) {
        this.course_id = course_id;
        this.name = name;
        this.title = title;
        this.original_price = original_price;
        this.brief_infor = brief_infor;
        this.image = image;
        this.course_date = course_date;
    }
    public Course(int course_id, String name, String cateName, int lessons, String user_name, boolean status) {
        this.course_id = course_id;
        this.name = name;
        this.cateName = cateName;
        this.lessons = lessons;
        this.user_name = user_name;
        this.status = status;
    }

  public Course(int course_id, String name, String title, double original_price, double sale_price, String brief_infor, int cate_id, int sale_id, String image, Date course_date, String user_name) {
        this.course_id = course_id;
        this.name = name;
        this.title = title;
        this.original_price = original_price;
        this.sale_price = sale_price;
        this.brief_infor = brief_infor;
        this.cate_id = cate_id;
        this.sale_id = sale_id;
        this.image = image;
        this.course_date = course_date;
        this.user_name = user_name;
    }

    public Course(int course_id, String name, String title, double original_price, String brief_infor, String image) {
        this.course_id = course_id;
        this.name = name;
        this.title = title;
        this.original_price = original_price;
        this.brief_infor = brief_infor;
        this.image = image;
    }

    public Course(int course_id, String title, double original_price, double sale_price, String brief_infor, int cate_id, String image, Date course_date) {
        this.course_id = course_id;
        this.title = title;
        this.original_price = original_price;
        this.sale_price = sale_price;
        this.brief_infor = brief_infor;
        this.cate_id = cate_id;
        this.image = image;
        this.course_date = course_date;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getLessons() {
        return lessons;
    }

    public void setLessons(int lessons) {
        this.lessons = lessons;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public int getSale_id() {
        return sale_id;
    }

    public void setSale_id(int sale_id) {
        this.sale_id = sale_id;
    }

    public Date getCourse_date() {
        return course_date;
    }

    public void setCourse_date(Date course_date) {
        this.course_date = course_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(double original_price) {
        this.original_price = original_price;
    }

    public String getBrief_infor() {
        return brief_infor;
    }

    public void setBrief_infor(String brief_infor) {
        this.brief_infor = brief_infor;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getOriginal_priceString() {
        return original_priceString;
    }

    public void setOriginal_priceString(String original_priceString) {
        this.original_priceString = original_priceString;
    }

    public String getSale_priceString() {
        return sale_priceString;
    }

    public void setSale_priceString(String sale_priceString) {
        this.sale_priceString = sale_priceString;
    }

}
