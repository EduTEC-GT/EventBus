package edu.fjbatresv.edutec.librariesapplication.main;

import android.support.constraint.ConstraintLayout;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import edu.fjbatresv.edutec.librariesapplication.App;
import edu.fjbatresv.edutec.librariesapplication.R;
import edu.fjbatresv.edutec.librariesapplication.lib.GreenRobotEventBus;
import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;
import edu.fjbatresv.edutec.librariesapplication.Mascota;
import edu.fjbatresv.edutec.librariesapplication.lib.base.ImageLoader;

public class MainActivity extends AppCompatActivity implements MainView {

    @Inject
    MainPresenter presenter;
    @Inject
    ImageLoader loader;

    @BindView(R.id.container)
    LinearLayout container;
    @BindView(R.id.text)
    TextView text;
    @BindView(R.id.image)
    ImageView image;

    private App app;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        app = (App) getApplication();
        init();
        presenter.onCreate();
        presenter.toUpper(null);
        loader.load(image, "https://storage.googleapis.com/io-19-assets/images/global/io-social-banner.png");
    }

    @Override
    protected void onDestroy() {
        presenter.onDestroy();
        super.onDestroy();
    }

    private void init() {
        app.main(this).inject(this);
    }

    @Override
    public void toUpper(String upper) {
        Log.e("TOUPPER", upper);
        text.setText(upper);
    }

    @Override
    public void showError(String error) {
        Toast.makeText(this, error, Toast.LENGTH_LONG).show();
    }

    @Override
    public void showMessage(String message) {
        Snackbar.make(container, message, Snackbar.LENGTH_LONG).show();
    }
}
