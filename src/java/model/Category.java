
package model;

/**
 *
 * @author RIFAT
 */
public class Category {
    
    int id;
    String name;
    String details;

    public Category(int id, String name, String details) {
        this.id = id;
        this.name = name;
        this.details = details;
    }

    public Category(String name, String details) {
        this.name = name;
        this.details = details;
    }

    public Category() {
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

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
    
    
    
}
