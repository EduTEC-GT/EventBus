package edu.fjbatresv.edutec.librariesapplication.lib.DI;

import javax.inject.Singleton;

import dagger.Component;
import edu.fjbatresv.edutec.librariesapplication.AppModule;

@Singleton
@Component(modules = {AppModule.class, LibModule.class})
public interface LibComponent {
}
