
package model;


public class Lesson {
    private int id;
    private int subject_id;
    private String subject_name;
    private int topic_id;
    private String topic_name;
    private String name;
    private int type_id;
    private String type_name;
    private int order;
    private String videoLink;
    private String htmlContent;
    private boolean status;
    
    
    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public String getTopic_name() {
        return topic_name;
    }

    public void setTopic_name(String topic_name) {
        this.topic_name = topic_name;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }
    

    public Lesson() {
    }

    public Lesson(int id, int subject_id, int topic_id, String name, int type_id, int order, String videoLink, String htmlContent) {
        this.id = id;
        this.subject_id = subject_id;
        this.topic_id = topic_id;
        this.name = name;
        this.type_id = type_id;
        this.order = order;
        this.videoLink = videoLink;
        this.htmlContent = htmlContent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public String getName() {
        return name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getVideoLink() {
        return videoLink;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }

    @Override
    public String toString() {
        return "Lesson{" + "id=" + id + ", subject_id=" + subject_id + ", topic_id=" + topic_id + ", name=" + name + ", type_id=" + type_id + ", order=" + order + ", videoLink=" + videoLink + ", htmlContent=" + htmlContent + '}';
    }
    
}
