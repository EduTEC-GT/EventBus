package edu.fjbatresv.edutec.librariesapplication.main;

public interface MainPresenter {
    void onCreate();
    void onDestroy();
    void onEvent(String upper);
    void toUpper(String text);
}
