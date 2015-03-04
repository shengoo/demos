package com.sheng00.study.myapplication;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Handler;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.JsonReader;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.Toast;

import com.sheng00.study.myapplication.utils.PrefsSetting;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;


public class SplashActivity extends Activity {

    private static final String DEBUG_TAG = "DEBUG_TAG";
    int SPLASH_DISPLAY_LENGTH = 3000;
    ImageView imageView;
    private PrefsSetting setting;
    private final String SPLASH_IMAGE_PATH = "the_url_where_the_image_stores";
    private String stringUrl = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1";

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

        new DownloadWebpageTask().execute(stringUrl);

        new Handler().postDelayed(new Runnable() {
            public void run() {
                Intent login_intent = new Intent(SplashActivity.this, MainActivity.class);
                startActivity(login_intent);
                finish();
            }
        }, SPLASH_DISPLAY_LENGTH);
    }

    private class DownloadWebpageTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... urls) {

            // params comes from the execute() call: params[0] is the url.
            try {
                return downloadUrl(urls[0]);
            } catch (IOException e) {
                return "Unable to retrieve web page. URL may be invalid.";
            }
        }
        // onPostExecute displays the results of the AsyncTask.
        @Override
        protected void onPostExecute(String result) {
            //JSONObject
            //Toast.makeText(getApplicationContext(),result.toString(),Toast.LENGTH_LONG).show();
        }
        private String downloadUrl(String myurl) throws IOException {
            InputStream is = null;
            // Only display the first 500 characters of the retrieved
            // web page content.
            int len = 500;

            try {
                URL url = new URL(myurl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setReadTimeout(10000 /* milliseconds */);
                conn.setConnectTimeout(15000 /* milliseconds */);
                conn.setRequestMethod("GET");
                conn.setDoInput(true);
                // Starts the query
                conn.connect();
                int response = conn.getResponseCode();
                Log.d(DEBUG_TAG, "The response is: " + response);
                is = conn.getInputStream();

                // Convert the InputStream into a string
                JsonReader reader = new JsonReader(new InputStreamReader(is, "UTF-8"));
                reader.beginObject();
                while (reader.hasNext()) {
                    String name = reader.nextName();
                    if (name.equals("images")) {
                        reader.beginArray();
                        reader.beginObject();
                        while (reader.hasNext()){
                            String otherName = reader.nextName();
                            if(name.equals("url")){
                                Toast.makeText(getApplicationContext(),reader.nextString(),Toast.LENGTH_LONG).show();
                            }
                        }
                        return "";
                    }
                }
                reader.endObject();
                //String contentAsString = readIt(is, len);
                return "";

                // Makes sure that the InputStream is closed after the app is
                // finished using it.
            } finally {
                if (is != null) {
                    is.close();
                }
            }
        }
        // Reads an InputStream and converts it to a String.
        public String readIt(InputStream stream, int len) throws IOException, UnsupportedEncodingException {
            Reader reader = null;
            reader = new InputStreamReader(stream, "UTF-8");
            char[] buffer = new char[len];
            reader.read(buffer);
            return new String(buffer);
        }
    }

}
