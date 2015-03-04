package com.sheng00.study.myapplication.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

/**
 * Created by UC165867 on 3/4/2015.
 */
public class PrefsSetting {
    private Context mContext;
    private SharedPreferences sprefs;

    public PrefsSetting(Context context) {
        mContext = context;
        sprefs = PreferenceManager.getDefaultSharedPreferences(context);
    }








    public void prefsSetBool(String key, boolean val) {
        SharedPreferences.Editor e = sprefs.edit();
        e.putBoolean(key, val);
        e.commit();
    }

    public boolean prefsGetBool(String key) {
        boolean boo = false;
        try {
            boo = sprefs.getBoolean(key, false);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return boo;
    }

    public void prefsSetFloat(String key,float val) {
        SharedPreferences.Editor e = sprefs.edit();
        e.putFloat(key, val);
        e.commit();
    }

    public float prefsGetFloat(String key) {
        float result = 0;
        try {
            result = sprefs.getFloat(key, 0);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return result;
    }

    public void prefsSetInt(String key, int val) {
        SharedPreferences.Editor e = sprefs.edit();
        e.putInt(key, val);
        e.commit();
    }

    public int prefsGetInt(String key) {
        int no = 0;
        try {
            no = sprefs.getInt(key, 0);
        } catch (ClassCastException e) {
        }
        return no;
    }

    public void prefsSetString(String key, String val) {
        SharedPreferences.Editor e = sprefs.edit();
        e.putString(key, val);
        e.commit();
    }

    public String prefsGetString(String key) {
        String result = "";
        try {
            result = sprefs.getString(key, "");
        } catch (ClassCastException e) {
        }
        return result;
    }
}
