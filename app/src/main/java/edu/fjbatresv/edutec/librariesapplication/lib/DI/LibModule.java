package edu.fjbatresv.edutec.librariesapplication.lib.DI;

import android.content.Context;

import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestManager;

import org.greenrobot.eventbus.EventBus;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import edu.fjbatresv.edutec.librariesapplication.Event;
import edu.fjbatresv.edutec.librariesapplication.lib.GlideImageLoader;
import edu.fjbatresv.edutec.librariesapplication.lib.GreenRobotEventBus;
import edu.fjbatresv.edutec.librariesapplication.lib.base.ImageLoader;

@Module
public class LibModule {

    @Provides
    @Singleton
    EventBus providesGreenRobotEventBus() {
        return EventBus.getDefault();
    }

    @Provides
    @Singleton
    edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus providesEventBus(EventBus bus) {
        return new GreenRobotEventBus(bus);
    }

    @Provides
    @Singleton
    RequestManager providesRequestManager(Context context) {
        return Glide.with(context);
    }

    @Provides
    @Singleton
    ImageLoader providesImageLoader(RequestManager requestManager){
        return new GlideImageLoader(requestManager);
    }

}
