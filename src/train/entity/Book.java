package train.entity;

import java.io.Serializable;
import java.util.Date;

public class Book implements Serializable {
    private String b_id;
    private String b_name;
    private String b_class;
    private int b_no;
    private String b_author;
    private String b_publisher;
    private Date b_pubDate;
    private String b_comment;

    public Book() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_class() {
        return b_class;
    }

    public void setB_class(String b_class) {
        this.b_class = b_class;
    }

    public int getB_no() {
        return b_no;
    }

    public void setB_no(int b_no) {
        this.b_no = b_no;
    }

    public String getB_author() {
        return b_author;
    }

    public void setB_author(String b_author) {
        this.b_author = b_author;
    }

    public String getB_publisher() {
        return b_publisher;
    }

    public void setB_publisher(String b_publisher) {
        this.b_publisher = b_publisher;
    }

    public Date getB_pubDate() {
        return b_pubDate;
    }

    public void setB_pubDate(Date b_pubDate) {
        this.b_pubDate = b_pubDate;
    }

    public String getB_comment() {
        return b_comment;
    }

    public void setB_comment(String b_comment) {
        this.b_comment = b_comment;
    }
}
