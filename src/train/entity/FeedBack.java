package train.entity;

// 用户反馈
public class FeedBack {
    private int uId;
    private String type;
    private String content;

    public FeedBack(){

    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "FeedBack{" +
                "uId=" + uId +
                ", type='" + type + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
