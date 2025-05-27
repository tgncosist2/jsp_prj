package day0515;

public class Review {
    private String category;
    private String content;
    private String date;
    
    public Review(String category, String content, String date) {
        this.category = category;
        this.content = content;
        this.date = date;
    }
    
    // Getters and setters
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getDate() {
        return date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
}