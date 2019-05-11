[33mcommit e1de03393c98c81820d73643736caf8db102fccc[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31morigin/master[m[33m)[m
Author: fjbatresv <fjbatresv@gmail.com>
Date:   Sat May 11 09:14:26 2019 -0600

    All changes with eventbus and a simple SingletonClass

[1mdiff --git a/app/build.gradle b/app/build.gradle[m
[1mindex 279abf8..0963c9a 100644[m
[1m--- a/app/build.gradle[m
[1m+++ b/app/build.gradle[m
[36m@@ -33,6 +33,13 @@[m [mdependencies {[m
     testImplementation 'junit:junit:4.12'[m
     androidTestImplementation 'com.android.support.test:runner:1.0.2'[m
     androidTestImplementation 'com.android.support.test.espresso:espresso-core:3.0.2'[m
[32m+[m[32m    //Material Design[m
[32m+[m[32m    implementation "com.android.support:recyclerview-v7:$rootProject.ext.supportLibraryVersion"[m
[32m+[m[32m    implementation "com.android.support:appcompat-v7:$rootProject.ext.supportLibraryVersion"[m
[32m+[m[32m    implementation "com.android.support:cardview-v7:$rootProject.ext.supportLibraryVersion"[m
[32m+[m[32m    implementation "com.android.support:customtabs:$rootProject.ext.supportLibraryVersion"[m
[32m+[m[32m    implementation "com.android.support:design:$rootProject.ext.supportLibraryVersion"[m
[32m+[m[32m    implementation "com.android.support:support-v4:$rootProject.ext.supportLibraryVersion"[m
     //DBFlow[m
     annotationProcessor "com.github.Raizlabs.DBFlow:dbflow-processor:$rootProject.ext.dbflowVersion"[m
     implementation "com.github.Raizlabs.DBFlow:dbflow-core:$rootProject.ext.dbflowVersion"[m
[1mdiff --git a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/Event.java b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/Event.java[m
[1mnew file mode 100644[m
[1mindex 0000000..002c762[m
[1m--- /dev/null[m
[1m+++ b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/Event.java[m
[36m@@ -0,0 +1,67 @@[m
[32m+[m[32mpackage edu.fjbatresv.edutec.librariesapplication;[m
[32m+[m
[32m+[m[32mimport java.io.Serializable;[m
[32m+[m
[32m+[m[32mpublic class Event implements Serializable {[m
[32m+[m
[32m+[m[32m    public static final int toUpper = 1;[m
[32m+[m
[32m+[m[32m    private int tipo;[m
[32m+[m[32m    private String mensaje;[m
[32m+[m[32m    private String error;[m
[32m+[m[32m    private Object obj;[m
[32m+[m
[32m+[m[32m    public Event(int tipo, String mensaje, String error, Object obj) {[m
[32m+[m[32m        this.tipo = tipo;[m
[32m+[m[32m        this.mensaje = mensaje;[m
[32m+[m[32m        this.error = error;[m
[32m+[m[32m        this.obj = obj;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public Event(int tipo, Object obj) {[m
[32m+[m[32m        this.tipo = tipo;[m
[32m+[m[32m        this.obj = obj;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public Event(int tipo, String mensaje, Object obj) {[m
[32m+[m[32m        this.tipo = tipo;[m
[32m+[m[32m        this.mensaje = mensaje;[m
[32m+[m[32m        this.obj = obj;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public Event(String error) {[m
[32m+[m[32m        this.error = error;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public int getTipo() {[m
[32m+[m[32m        return tipo;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setTipo(int tipo) {[m
[32m+[m[32m        this.tipo = tipo;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public String getMensaje() {[m
[32m+[m[32m        return mensaje;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setMensaje(String mensaje) {[m
[32m+[m[32m        this.mensaje = mensaje;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public String getError() {[m
[32m+[m[32m        return error;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setError(String error) {[m
[32m+[m[32m        this.error = error;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public Object getObj() {[m
[32m+[m[32m        return obj;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setObj(Object obj) {[m
[32m+[m[32m        this.obj = obj;[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/Mascota.java b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/Mascota.java[m
[1mnew file mode 100644[m
[1mindex 0000000..a2ac2a7[m
[1m--- /dev/null[m
[1m+++ b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/Mascota.java[m
[36m@@ -0,0 +1,24 @@[m
[32m+[m[32mpackage edu.fjbatresv.edutec.librariesapplication;[m
[32m+[m
[32m+[m[32mpublic class Mascota {[m
[32m+[m[32m    private String nombre;[m
[32m+[m[32m    private static Mascota instance;[m
[32m+[m
[32m+[m[32m    public static Mascota getInstance() {[m
[32m+[m[32m        if (instance == null) {[m
[32m+[m[32m            instance = new Mascota();[m
[32m+[m[32m        }[m
[32m+[m[32m        return instance;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    private Mascota() {[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public String getNombre() {[m
[32m+[m[32m        return nombre;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setNombre(String nombre) {[m
[32m+[m[32m        this.nombre = nombre;[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainActivity.java b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainActivity.java[m
[1mindex 8b6a358..2b55789 100644[m
[1m--- a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainActivity.java[m
[1m+++ b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainActivity.java[m
[36m@@ -1,22 +1,30 @@[m
 package edu.fjbatresv.edutec.librariesapplication.main;[m
 [m
[32m+[m[32mimport android.support.constraint.ConstraintLayout;[m
[32m+[m[32mimport android.support.design.widget.Snackbar;[m
 import android.support.v7.app.AppCompatActivity;[m
 import android.os.Bundle;[m
 import android.util.Log;[m
 import android.widget.TextView;[m
[32m+[m[32mimport android.widget.Toast;[m
 [m
 import butterknife.BindView;[m
 import butterknife.ButterKnife;[m
 import edu.fjbatresv.edutec.librariesapplication.R;[m
 import edu.fjbatresv.edutec.librariesapplication.lib.GreenRobotEventBus;[m
 import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;[m
[32m+[m[32mimport edu.fjbatresv.edutec.librariesapplication.Mascota;[m
 [m
 public class MainActivity extends AppCompatActivity implements MainView {[m
 [m
     MainPresenter presenter;[m
 [m
[32m+[m[32m    @BindView(R.id.container)[m
[32m+[m[32m    ConstraintLayout container;[m
     @BindView(R.id.text)[m
     TextView text;[m
[32m+[m[32m    Mascota mascota;[m
[32m+[m[32m    Mascota mascota2;[m
 [m
     @Override[m
     protected void onCreate(Bundle savedInstanceState) {[m
[36m@@ -25,7 +33,11 @@[m [mpublic class MainActivity extends AppCompatActivity implements MainView {[m
         ButterKnife.bind(this);[m
         init();[m
         presenter.onCreate();[m
[31m-        presenter.toUpper("hola mundo");[m
[32m+[m[32m        presenter.toUpper(null);[m
[32m+[m[32m        mascota = Mascota.getInstance();[m
[32m+[m[32m        mascota.setNombre("Firulais");[m
[32m+[m[32m        mascota2 = Mascota.getInstance();[m
[32m+[m[32m        Log.e("MASCOTA:", mascota2.getNombre() != null ? mascota2.getNombre(): "");[m
     }[m
 [m
     @Override[m
[36m@@ -45,4 +57,14 @@[m [mpublic class MainActivity extends AppCompatActivity implements MainView {[m
         Log.e("TOUPPER", upper);[m
         text.setText(upper);[m
     }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public void showError(String error) {[m
[32m+[m[32m        Toast.makeText(this, error, Toast.LENGTH_LONG).show();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public void showMessage(String message) {[m
[32m+[m[32m        Snackbar.make(container, message, Snackbar.LENGTH_LONG).show();[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainModelImpl.java b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainModelImpl.java[m
[1mindex e5d73cb..e538b4a 100644[m
[1m--- a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainModelImpl.java[m
[1m+++ b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainModelImpl.java[m
[36m@@ -1,5 +1,6 @@[m
 package edu.fjbatresv.edutec.librariesapplication.main;[m
 [m
[32m+[m[32mimport edu.fjbatresv.edutec.librariesapplication.Event;[m
 import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;[m
 [m
 public class MainModelImpl implements MainModel {[m
[36m@@ -11,6 +12,11 @@[m [mpublic class MainModelImpl implements MainModel {[m
 [m
     @Override[m
     public void toUpper(String text) {[m
[31m-        bus.post(text.toUpperCase());[m
[32m+[m[32m        try {[m
[32m+[m[32m            //throw new Exception("No mayus");[m
[32m+[m[32m            bus.post(new Event(Event.toUpper, "Texto a mayusculas!", text.toUpperCase()));[m
[32m+[m[32m        } catch (Exception ex) {[m
[32m+[m[32m            bus.post(new Event(ex.getLocalizedMessage()));[m
[32m+[m[32m        }[m
     }[m
 }[m
[1mdiff --git a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenter.java b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenter.java[m
[1mindex 0f821c4..7aca06c 100644[m
[1m--- a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenter.java[m
[1m+++ b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenter.java[m
[36m@@ -1,8 +1,10 @@[m
 package edu.fjbatresv.edutec.librariesapplication.main;[m
 [m
[32m+[m[32mimport edu.fjbatresv.edutec.librariesapplication.Event;[m
[32m+[m
 public interface MainPresenter {[m
     void onCreate();[m
     void onDestroy();[m
[31m-    void onEvent(String upper);[m
[32m+[m[32m    void onEvent(Event event);[m
     void toUpper(String text);[m
 }[m
[1mdiff --git a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenterImpl.java b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenterImpl.java[m
[1mindex e61d7ed..7aa2504 100644[m
[1m--- a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenterImpl.java[m
[1m+++ b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainPresenterImpl.java[m
[36m@@ -2,6 +2,7 @@[m [mpackage edu.fjbatresv.edutec.librariesapplication.main;[m
 [m
 import org.greenrobot.eventbus.Subscribe;[m
 [m
[32m+[m[32mimport edu.fjbatresv.edutec.librariesapplication.Event;[m
 import edu.fjbatresv.edutec.librariesapplication.lib.base.EventBus;[m
 [m
 public class MainPresenterImpl implements MainPresenter {[m
[36m@@ -28,8 +29,22 @@[m [mpublic class MainPresenterImpl implements MainPresenter {[m
 [m
     @Override[m
     @Subscribe[m
[31m-    public void onEvent(String upper) {[m
[31m-        this.view.toUpper(upper);[m
[32m+[m[32m    public void onEvent(Event event) {[m
[32m+[m[32m        if (event.getError() != null && !event.getError().isEmpty()) {[m
[32m+[m[32m            this.view.showError(event.getError());[m
[32m+[m[32m        } else {[m
[32m+[m[32m            if (event.getMensaje() != null && !event.getMensaje().isEmpty()) {[m
[32m+[m[32m                this.view.showMessage(event.getMensaje());[m
[32m+[m[32m            }[m
[32m+[m[32m            switch (event.getTipo()) {[m
[32m+[m[32m                case Event.toUpper:[m
[32m+[m[32m                    this.view.toUpper(event.getObj().toString());[m
[32m+[m[32m                    break;[m
[32m+[m[32m                default:[m
[32m+[m[32m                    //TODO: Mostrar mensaje de evento invalido en la vista[m
[32m+[m[32m                    break;[m
[32m+[m[32m            }[m
[32m+[m[32m        }[m
     }[m
 [m
     @Override[m
[1mdiff --git a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainView.java b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainView.java[m
[1mindex a057467..cd95552 100644[m
[1m--- a/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainView.java[m
[1m+++ b/app/src/main/java/edu/fjbatresv/edutec/librariesapplication/main/MainView.java[m
[36m@@ -2,4 +2,6 @@[m [mpackage edu.fjbatresv.edutec.librariesapplication.main;[m
 [m
 public interface MainView {[m
     void toUpper(String text);[m
[32m+[m[32m    void showError(String error);[m
[32m+[m[32m    void showMessage(String message);[m
 }[m
[1mdiff --git a/app/src/main/res/layout/activity_main.xml b/app/src/main/res/layout/activity_main.xml[m
[1mindex 141e7ad..9c77ae4 100644[m
[1m--- a/app/src/main/res/layout/activity_main.xml[m
[1m+++ b/app/src/main/res/layout/activity_main.xml[m
[36m@@ -4,6 +4,7 @@[m
     xmlns:tools="http://schemas.android.com/tools"[m
     android:layout_width="match_parent"[m
     android:layout_height="match_parent"[m
[32m+[m[32m    android:id="@+id/container"[m
     tools:context=".main.MainActivity">[m
 [m
     <TextView[m
[1mdiff --git a/build.gradle b/build.gradle[m
[1mindex 2a9544f..563df25 100644[m
[1m--- a/build.gradle[m
[1m+++ b/build.gradle[m
[36m@@ -36,4 +36,5 @@[m [mext {[m
     dbflowVersion = "4.0.0-beta2"[m
     eventBusVersion = '3.1.1'[m
     butterknifeVersion = '8.8.1'[m
[32m+[m[32m    supportLibraryVersion = "28.0.0"[m
 }[m
