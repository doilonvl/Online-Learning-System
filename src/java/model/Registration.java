/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Huy Linh
 */
public class Registration {
    private int registration_id;
    private Course course_id;
    private Price_package price_package_id;
    private User user_id;
    private Timestamp created;
    private String regis_status;
    
    public Registration() {
    }

    public Registration(int registration_id, Course course_id, Price_package price_package_id, User user_id, Timestamp created, String regis_status) {
        this.registration_id = registration_id;
        this.course_id = course_id;
        this.price_package_id = price_package_id;
        this.user_id = user_id;
        this.created = created;
        this.regis_status = regis_status;
    }

    public int getRegistration_id() {
        return registration_id;
    }

    public void setRegistration_id(int registration_id) {
        this.registration_id = registration_id;
    }

    public Course getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Course course_id) {
        this.course_id = course_id;
    }

    public Price_package getPrice_package_id() {
        return price_package_id;
    }

    public void setPrice_package_id(Price_package price_package_id) {
        this.price_package_id = price_package_id;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public String getRegis_status() {
        return regis_status;
    }

    public void setRegis_status(String regis_status) {
        this.regis_status = regis_status;
    }

    @Override
    public String toString() {
        return "Registration{" + "registration_id=" + registration_id + ", course_id=" + course_id + ", price_package_id=" + price_package_id + ", user_id=" + user_id + ", created=" + created + ", regis_status=" + regis_status + '}';
    }

    
}