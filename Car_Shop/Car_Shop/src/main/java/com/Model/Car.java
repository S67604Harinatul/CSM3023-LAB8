/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author User
 */

public class Car {
    private int Car_id;
    private String Brand;
    private String Model;
    private String Cyclinder;
    private String Price;

    // Constructor for insert
    public Car(String Brand, String Model, String Cyclinder, String Price) {
        this.Brand = Brand;
        this.Model = Model;
        this.Cyclinder = Cyclinder;
        this.Price = Price;
    }

    // Constructor for update and select by ID
    public Car(int Car_id, String Brand, String Model, String Cyclinder, String Price) {
        this.Car_id = Car_id;
        this.Brand = Brand;
        this.Model = Model;
        this.Cyclinder = Cyclinder;
        this.Price = Price;
    }

    // Getters and Setters
    public int getCar_id() {
        return Car_id;
    }

    public void setCar_id(int Car_id) {
        this.Car_id = Car_id;
    }

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String model) {
        this.Model = Model;
    }

    public String getCyclinder() {
        return Cyclinder;
    }

    public void setCyclinder(String Cyclinder) {
        this.Cyclinder = Cyclinder;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String price) {
        this.Price = Price;
    }
}
