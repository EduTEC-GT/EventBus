package edu.fjbatresv.edutec.librariesapplication.main;

import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;

public class MainModelImpl implements MainModel {
    private EventBus bus;

    public MainModelImpl(EventBus bus) {
        this.bus = bus;
    }

    @Override
    public void toUpper(String text) {
        bus.post(text.toUpperCase());
    }
}
