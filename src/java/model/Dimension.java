
package model;


public class Dimension {
    private int id;
    private String name;
    private DimensionType type;
    private String description;

    public Dimension() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public DimensionType getType() {
        return type;
    }

    public void setType(DimensionType type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Dimension{" + "id=" + id + ", name=" + name + ", type=" + type + ", description=" + description + '}';
    }
    
    
}