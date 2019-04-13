package edu.fjbatresv.edutec.librariesapplication.main;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import edu.fjbatresv.edutec.librariesapplication.R;
import edu.fjbatresv.edutec.librariesapplication.lib.GreenRobotEventBus;
import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;

public class MainActivity extends AppCompatActivity implements MainView {

    MainPresenter presenter;

    @BindView(R.id.text)
    TextView text;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        init();
        presenter.onCreate();
        presenter.toUpper("hola mundo");
    }

    @Override
    protected void onDestroy() {
        presenter.onDestroy();
        super.onDestroy();
    }

    private void init() {
        EventBus bus = new GreenRobotEventBus(org.greenrobot.eventbus.EventBus.getDefault());
        MainModel model = new MainModelImpl(bus);
        presenter = new MainPresenterImpl(model, this, bus);
    }

    @Override
    public void toUpper(String upper) {
        Log.e("TOUPPER", upper);
        text.setText(upper);
    }
}
