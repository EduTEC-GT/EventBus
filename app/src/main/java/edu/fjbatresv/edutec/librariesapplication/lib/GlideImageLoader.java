package edu.fjbatresv.edutec.librariesapplication.lib;

import android.content.Context;
import android.media.Image;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.request.RequestOptions;

import edu.fjbatresv.edutec.librariesapplication.R;
import edu.fjbatresv.edutec.librariesapplication.lib.base.ImageLoader;

public class GlideImageLoader implements ImageLoader {

    private RequestManager requestManager;

    public GlideImageLoader(RequestManager requestManager) {
        this.requestManager = requestManager;
    }

    public GlideImageLoader(Context context){
        this.requestManager = Glide.with(context);
    }

    @Override
    public void load(ImageView view, String url) {
        this.requestManager
                .load(url)
                .apply(
                        new RequestOptions()
                                .placeholder(R.mipmap.ic_launcher)
                )
                .into(view);
    }
}
