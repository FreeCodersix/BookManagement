package train.entity;

import java.io.Serializable;

public class Company implements Serializable {

    private int id;
    private String name;
    private String c_boss;
    private String c_city;
    private int c_year;


    public Company() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Company(int id, String name, String c_boss, String c_city, int c_year) {
        super();
        this.id = id;
        this.name = name;
        this.c_boss = c_boss;
        this.c_city = c_city;
        this.c_year = c_year;
    }


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getname() {
        return name;
    }
    public void setname(String name) {
        this.name = name;
    }
    public String getC_boss() {
        return c_boss;
    }
    public void setC_boss(String c_boss) {
        this.c_boss = c_boss;
    }
    public String getC_city() {
        return c_city;
    }
    public void setC_city(String c_city) {
        this.c_city = c_city;
    }
    public int getC_year() {
        return c_year;
    }
    public void setC_year(int c_year) {
        this.c_year = c_year;
    }

    @Override
    public String toString() {
        return "raky.train.entity.Company [id=" + id + ", name=" + name + ", c_boss=" + c_boss + ", c_city=" + c_city
                + ", c_year=" + c_year + "]";
    }

}
