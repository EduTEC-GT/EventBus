package edu.fjbatresv.edutec.librariesapplication.main;

import edu.fjbatresv.edutec.librariesapplication.Event;
import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;

public class MainModelImpl implements MainModel {
    private EventBus bus;

    public MainModelImpl(EventBus bus) {
        this.bus = bus;
    }

    @Override
    public void toUpper(String text) {
        try {
            //throw new Exception("No mayus");
            bus.post(new Event(Event.toUpper, "Texto a mayusculas!", text.toUpperCase()));
        } catch (Exception ex) {
            bus.post(new Event(ex.getLocalizedMessage()));
        }
    }
}
