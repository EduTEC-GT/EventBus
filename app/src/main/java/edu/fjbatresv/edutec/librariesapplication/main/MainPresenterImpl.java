package edu.fjbatresv.edutec.librariesapplication.main;

import org.greenrobot.eventbus.Subscribe;

import edu.fjbatresv.edutec.librariesapplication.Event;
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
    public void onEvent(Event event) {
        if (event.getError() != null && !event.getError().isEmpty()) {
            this.view.showError(event.getError());
        } else {
            if (event.getMensaje() != null && !event.getMensaje().isEmpty()) {
                this.view.showMessage(event.getMensaje());
            }
            switch (event.getTipo()) {
                case Event.toUpper:
                    this.view.toUpper(event.getObj().toString());
                    break;
                default:
                    //TODO: Mostrar mensaje de evento invalido en la vista
                    break;
            }
        }
    }

    @Override
    public void toUpper(String text) {
        this.model.toUpper(text);
    }
}
