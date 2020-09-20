/**
 * @author mateus-os
 */
public virtual class EventPresentationScheduler {

    EventRepository repository;

    List<Account> newAccounts;

    List<Event> newEvents;

    public EventPresentationScheduler (List<Account> newAccounts) {
        this.newEvents = new List<Event>();
        this.repository = new EventRepository();

        this.newAccounts = newAccounts;
        prepareEventFromAccount(newAccounts);
    }

    virtual
    public void prepareEventFromAccount(List<Account> newAccounts) {        
        for (Account account : newAccounts) {
            Event event = prepareEvent();
            event = completeEventWithAccountInformation(event, account);

            this.newEvents.add(event);
        }
    }

    public Event prepareEvent() {
        Event event = new Event();

        event.Description = 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium';
        event.Subject = 'Apresentação instucional dos produtos Premium';
        event.ContactType__c = 'Telefônico';

        return event;
    }

    public Event completeEventWithAccountInformation(Event event, Account account) {        
        DateTime eventCreateDate = account.CreatedDate;

        event.StartDateTime = eventCreateDate.addDays(1);
        event.EndDateTime = eventCreateDate.addDays(1).addHours(1);

        event.WhatId = account.Id;

        return event;
    }

    public void createEvents(){
        repository.create(this.newEvents);
    }
}