package edu.fjbatresv.edutec.librariesapplication.main;

import edu.fjbatresv.edutec.librariesapplication.Event;

public interface MainPresenter {
    void onCreate();
    void onDestroy();
    void onEvent(Event event);
    void toUpper(String text);
}
