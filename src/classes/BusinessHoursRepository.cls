/**
 * @author mateus-os
 */
public virtual class BusinessHoursRepository {

    virtual
    public List<BusinessHours> findActive() {
        return [ SELECT Id, Name
        FROM BusinessHours 
        WHERE IsActive = true ];
    }
}