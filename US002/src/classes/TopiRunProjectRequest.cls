/**
 * @author mateus-os
 */
public class TopiRunProjectRequest {
    public String name;
    public String code;
    public String status;
    public Date startDate;
    public Date endDate;
    public Double budget;

    override
    public String toString() {
        return JSON.serialize(this);
    }
}