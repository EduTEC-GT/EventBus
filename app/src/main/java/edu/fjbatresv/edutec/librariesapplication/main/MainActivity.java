package edu.fjbatresv.edutec.librariesapplication.main;

import android.support.constraint.ConstraintLayout;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import butterknife.BindView;
import butterknife.ButterKnife;
import edu.fjbatresv.edutec.librariesapplication.R;
import edu.fjbatresv.edutec.librariesapplication.lib.GreenRobotEventBus;
import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;
import edu.fjbatresv.edutec.librariesapplication.Mascota;

public class MainActivity extends AppCompatActivity implements MainView {

    MainPresenter presenter;

    @BindView(R.id.container)
    ConstraintLayout container;
    @BindView(R.id.text)
    TextView text;
    Mascota mascota;
    Mascota mascota2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        init();
        presenter.onCreate();
        presenter.toUpper(null);
        mascota = Mascota.getInstance();
        mascota.setNombre("Firulais");
        mascota2 = Mascota.getInstance();
        Log.e("MASCOTA:", mascota2.getNombre() != null ? mascota2.getNombre(): "");
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

    @Override
    public void showError(String error) {
        Toast.makeText(this, error, Toast.LENGTH_LONG).show();
    }

    @Override
    public void showMessage(String message) {
        Snackbar.make(container, message, Snackbar.LENGTH_LONG).show();
    }
}
