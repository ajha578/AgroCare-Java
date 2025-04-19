package model;

public class Product {
    private int id;
    private String name;
    private String description;
    private int price;
    private String imagePath;
    private String category;

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getDescription() { return description; }
    public int getPrice() { return price; }
    public String getImagePath() { return imagePath; }
    public String getCategory() { return category; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setDescription(String description) { this.description = description; }
    public void setPrice(int price) { this.price = price; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
    public void setCategory(String category) { this.category = category; }
}
