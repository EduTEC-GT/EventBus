package edu.fjbatresv.edutec.librariesapplication.main;

import org.greenrobot.eventbus.Subscribe;

import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;

public class MainPresenterImpl implements MainPresenter {

    private MainModel model;
    private MainView view;
    private EventBus bus;

    public MainPresenterImpl(MainModel model, MainView view, EventBus bus) {
        this.model = model;
        this.view = view;
        this.bus = bus;
    }

    @Override
    public void onCreate() {
        this.bus.register(this);
    }

    @Override
    public void onDestroy() {
        this.bus.unRegister(this);
    }

    @Override
    @Subscribe
    public void onEvent(String upper) {
        this.view.toUpper(upper);
    }

    @Override
    public void toUpper(String text) {
        this.model.toUpper(text);
    }
}
