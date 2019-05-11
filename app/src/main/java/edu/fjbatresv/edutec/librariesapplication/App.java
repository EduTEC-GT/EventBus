package edu.fjbatresv.edutec.librariesapplication;

import android.app.Application;

import edu.fjbatresv.edutec.librariesapplication.lib.DI.LibModule;
import edu.fjbatresv.edutec.librariesapplication.main.DI.DaggerMainComponent;
import edu.fjbatresv.edutec.librariesapplication.main.DI.MainComponent;
import edu.fjbatresv.edutec.librariesapplication.main.DI.MainModule;
import edu.fjbatresv.edutec.librariesapplication.main.MainActivity;
import edu.fjbatresv.edutec.librariesapplication.main.MainView;

public class App extends Application {

    AppModule appModule;
    LibModule libModule;

    @Override
    public void onCreate() {
        super.onCreate();
        initModules();
    }

    private void initModules() {
        appModule = new AppModule(this);
        libModule = new LibModule();
    }

    public MainComponent main(MainView view) {
        return DaggerMainComponent.builder()
                .libModule(libModule)
                .appModule(appModule)
                .mainModule(new MainModule(view))
                .build();
    }

}
