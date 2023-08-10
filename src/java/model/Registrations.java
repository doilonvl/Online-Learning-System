
package model;

import java.sql.Date;


public class Registrations {
    private int id;
    private String email;
    private Date registration_time;
    private int course_id;
    private String course_name;
    private PricePackage pricePackage;
    private int status;
    private Date valid_from;
    private Date valid_to;
    private String update_by;

    public Registrations() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegistration_time() {
        return registration_time;
    }

    public void setRegistration_time(Date registration_time) {
        this.registration_time = registration_time;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public PricePackage getPricePackage() {
        return pricePackage;
    }

    public void setPricePackage(PricePackage pricePackage) {
        this.pricePackage = pricePackage;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getValid_from() {
        return valid_from;
    }

    public void setValid_from(Date valid_from) {
        this.valid_from = valid_from;
    }

    public Date getValid_to() {
        return valid_to;
    }

    public void setValid_to(Date valid_to) {
        this.valid_to = valid_to;
    }

    public String getUpdate_by() {
        return update_by;
    }

    public void setUpdate_by(String update_by) {
        this.update_by = update_by;
    }

    @Override
    public String toString() {
        return "Registrations{" + "id=" + id + ", email=" + email + ", registration_time=" + registration_time + ", course_id=" + course_id + ", course_name=" + course_name + ", pricePackage=" + pricePackage + ", status=" + status + ", valid_from=" + valid_from + ", valid_to=" + valid_to + ", update_by=" + update_by + '}';
    }
    
    
}