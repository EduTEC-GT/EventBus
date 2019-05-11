package edu.fjbatresv.edutec.librariesapplication.main.DI;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;
import edu.fjbatresv.edutec.librariesapplication.main.MainModel;
import edu.fjbatresv.edutec.librariesapplication.main.MainModelImpl;
import edu.fjbatresv.edutec.librariesapplication.main.MainPresenter;
import edu.fjbatresv.edutec.librariesapplication.main.MainPresenterImpl;
import edu.fjbatresv.edutec.librariesapplication.main.MainView;

@Module
public class MainModule {

    private MainView view;

    public MainModule(MainView view) {
        this.view = view;
    }

    @Provides
    @Singleton
    MainView providesMainView(){
        return this.view;
    }

    @Provides
    @Singleton
    MainModel providesMainModel(EventBus bus){
        return new MainModelImpl(bus);
    }

    @Provides
    @Singleton
    MainPresenter providesMainPresenter(MainModel model, MainView view, EventBus bus) {
        return new MainPresenterImpl(model, view, bus);
    }
}
