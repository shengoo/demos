package com.sheng00.study.myapplication;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;

import com.sheng00.study.myapplication.utils.PrefsSetting;

import java.io.FileOutputStream;


public class SplashActivity extends Activity {

    int SPLASH_DISPLAY_LENGTH = 3000;
    ImageView imageView;
    private PrefsSetting setting;
    private final String SPLASH_IMAGE_PATH = "the_url_where_the_image_stores";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
        imageView = (ImageView)findViewById(R.id.splashImage);
        setting = new PrefsSetting(this);
        String path = setting.prefsGetString(SPLASH_IMAGE_PATH);
        String filename = "myfile";
        String string = "Hello world!";
        FileOutputStream outputStream;

        try {
            outputStream = openFileOutput(filename, Context.MODE_PRIVATE);
            outputStream.write(string.getBytes());
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(path.length() > 0){
            //imageView.setimage
        }
        new Handler().postDelayed(new Runnable() {
            public void run() {
                Intent login_intent = new Intent(SplashActivity.this, MainActivity.class);
                startActivity(login_intent);
                finish();
            }
        }, SPLASH_DISPLAY_LENGTH);
    }


}
