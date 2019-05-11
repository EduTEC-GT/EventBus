package edu.fjbatresv.edutec.librariesapplication.main.DI;

import javax.inject.Singleton;

import dagger.Component;
import edu.fjbatresv.edutec.librariesapplication.AppModule;
import edu.fjbatresv.edutec.librariesapplication.lib.DI.LibModule;
import edu.fjbatresv.edutec.librariesapplication.main.MainActivity;

@Singleton
@Component(modules = {AppModule.class, LibModule.class, MainModule.class})
public interface MainComponent {
    void inject(MainActivity activity);
    //void inject(LoginActivity activity);
}
