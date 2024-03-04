package com.mycompany.studentmanagementapp.web.entities;

public class Student {

    private int id;
    private String name;
    private String number;
    private String city;

    public Student(int id, String name, String number, String city) {
        this.id = id;
        this.name = name;
        this.number = number;
        this.city = city;
    }

    public Student(String name, String number, String city) {

        this.name = name;
        this.number = number;
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getNumber() {
        return number;
    }

    public String getCity() {
        return city;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + name + ", number=" + number + ", city=" + city + '}';
    }
    
    
    

}
