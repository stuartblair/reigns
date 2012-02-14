package com._5values.dummy.model;

import java.io.Serializable;

public class Person implements Serializable {
    private static final long serialVersionUID = 1513207428686438208L;
    private String name;
    private String address;
    
    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getAddress() {
	return address;
    }

    public void setAddress(String address) {
	this.address = address;
    }
}
