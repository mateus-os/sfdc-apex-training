/**
 * @author mateus-os
 */
public virtual class EventRepository {

    virtual
    public List<Event> create (List<Event> events) {
        insert events;
        return events;
    }
}