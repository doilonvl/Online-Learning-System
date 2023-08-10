/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class User {
    private int user_id;
    private String full_name;
    private String email;
    private String password;
    private boolean gender;
    private String address;
    private String phone_number;
    private String verification_code;
    private boolean is_verified;
    private Role role;
    private String image;

    public User(int user_id, String full_name, String email, String password, boolean gender, String address, String phone_number, String verification_code, boolean is_verified, Role role, boolean status, int role_id, String image) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.address = address;
        this.phone_number = phone_number;
        this.verification_code = verification_code;
        this.is_verified = is_verified;
        this.role = role;
        this.status = status;
        this.role_id = role_id;
        this.image = image;
    }

    
    
    public String getVerification_code() {
        return verification_code;
    }

    public void setVerification_code(String verification_code) {
        this.verification_code = verification_code;
    }

    public boolean isIs_verified() {
        return is_verified;
    }

    public void setIs_verified(boolean is_verified) {
        this.is_verified = is_verified;
    }
    private boolean status;
    private int role_id;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
    
    

    public User(int user_id, String full_name, String email, String password, boolean gender, String address, String phone_number, String verification_code, boolean is_verified, boolean status, int role_id) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.address = address;
        this.phone_number = phone_number;
        this.verification_code = verification_code;
        this.is_verified = is_verified;
        this.status = status;
        this.role_id = role_id;
    }

    public User(String full_name, String email, String password, boolean gender, String address, String phone_number, String verification_code, boolean is_verified, boolean status, int role_id) {
        this.full_name = full_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.address = address;
        this.phone_number = phone_number;
        this.verification_code = verification_code;
        this.is_verified = is_verified;
        this.status = status;
        this.role_id = role_id;
    }

    public User() {
    }


   
}
