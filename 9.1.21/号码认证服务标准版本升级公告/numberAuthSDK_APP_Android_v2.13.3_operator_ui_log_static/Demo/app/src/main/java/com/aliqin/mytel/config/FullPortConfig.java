package com.aliqin.mytel.config;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.webkit.WebSettings;
import android.widget.Toast;

import androidx.core.content.ContextCompat;

import com.aliqin.mytel.MessageActivity;
import com.aliqin.mytel.R;
import com.mobile.auth.gatewayauth.ActivityResultListener;
import com.mobile.auth.gatewayauth.AuthRegisterViewConfig;
import com.mobile.auth.gatewayauth.AuthUIConfig;
import com.mobile.auth.gatewayauth.AuthUIControlClickListener;
import com.mobile.auth.gatewayauth.CustomInterface;
import com.mobile.auth.gatewayauth.PhoneNumberAuthHelper;
import com.mobile.auth.gatewayauth.ResultCode;

import org.json.JSONException;
import org.json.JSONObject;

public class FullPortConfig extends BaseUIConfig {
    private final String TAG = "全屏竖屏样式";

    public FullPortConfig(Activity activity, PhoneNumberAuthHelper authHelper) {
        super(activity, authHelper);
    }

    @Override
    public void configAuthPage() {
        mAuthHelper.setUIClickListener(new AuthUIControlClickListener() {
            @Override
            public void onClick(String code, Context context, String jsonString) {
                JSONObject jsonObj = null;
                try {
                    if(!TextUtils.isEmpty(jsonString)) {
                        jsonObj = new JSONObject(jsonString);
                    }
                } catch (JSONException e) {
                    jsonObj = new JSONObject();
                }
                switch (code) {
                    //点击授权页默认样式的返回按钮
                    case ResultCode.CODE_ERROR_USER_CANCEL:
                        Log.e(TAG, "点击了授权页默认返回按钮");
                        mAuthHelper.quitLoginPage();
                        mActivity.finish();
                        break;
                    //点击授权页默认样式的切换其他登录方式 会关闭授权页
                    //如果不希望关闭授权页那就setSwitchAccHidden(true)隐藏默认的  通过自定义view添加自己的
                    case ResultCode.CODE_ERROR_USER_SWITCH:
                        Log.e(TAG, "点击了授权页默认切换其他登录方式");
                        break;
                    //点击一键登录按钮会发出此回调
                    //当协议栏没有勾选时 点击按钮会有默认toast 如果不需要或者希望自定义内容 setLogBtnToastHidden(true)隐藏默认Toast
                    //通过此回调自己设置toast
                    case ResultCode.CODE_ERROR_USER_LOGIN_BTN:
                        if (!jsonObj.optBoolean("isChecked")) {
                            Toast.makeText(mContext, R.string.custom_toast, Toast.LENGTH_SHORT).show();
                        }
                        break;
                    //checkbox状态改变触发此回调
                    case ResultCode.CODE_ERROR_USER_CHECKBOX:
                        Log.e(TAG, "checkbox状态变为" + jsonObj.optBoolean("isChecked"));
                        break;
                    //点击协议栏触发此回调
                    case ResultCode.CODE_ERROR_USER_PROTOCOL_CONTROL:
                        Log.e(TAG, "点击协议，" + "name: " + jsonObj.optString("name") + ", url: " + jsonObj.optString("url"));
                        break;
                    //用户调用userControlAuthPageCancel后左上角返回按钮及物理返回键交由sdk接入方控制
                    case ResultCode.CODE_ERROR_USER_CONTROL_CANCEL_BYBTN:
                        Log.e(TAG, "用户调用userControlAuthPageCancel后使用左上角返回按钮返回交由sdk接入方控制");
                        mAuthHelper.quitLoginPage();
                        mActivity.finish();
                        break;
                    //用户调用userControlAuthPageCancel后物理返回键交由sdk接入方控制
                    case ResultCode.CODE_ERROR_USER_CONTROL_CANCEL_BYKEY:
                        Log.e(TAG, "用户调用userControlAuthPageCancel后使用物理返回键返回交由sdk接入方控制");
                        mAuthHelper.quitLoginPage();
                        mActivity.finish();
                        break;

                    default:
                        break;

                }

            }
        });
        mAuthHelper.removeAuthRegisterXmlConfig();
        mAuthHelper.removeAuthRegisterViewConfig();
        mAuthHelper.removePrivacyAuthRegisterViewConfig();
        mAuthHelper.removePrivacyRegisterXmlConfig();
        //请注意，同一Drawable对象不可在sdk内相关Drawable背景重复使用
        Drawable btnDrawable=mActivity.getDrawable(R.drawable.login_btn_bg);
        Drawable alertBtnDrawable=mActivity.getDrawable(R.drawable.login_btn_bg);
        //添加自定义切换其他登录方式
        mAuthHelper.addAuthRegistViewConfig("switch_msg", new AuthRegisterViewConfig.Builder()
                .setView(initSwitchView(350))
                .setRootViewId(AuthRegisterViewConfig.RootViewId.ROOT_VIEW_ID_BODY)
                .setCustomInterface(new CustomInterface() {
                    @Override
                    public void onClick(Context context) {
                        Toast.makeText(mContext, "切换到短信登录方式", Toast.LENGTH_SHORT).show();
                        Intent pIntent = new Intent(mActivity, MessageActivity.class);
                        mActivity.startActivityForResult(pIntent, 1002);
                        mAuthHelper.quitLoginPage();
                        /*mAuthHelper.privacyAnimationStart();
                        mAuthHelper.checkBoxAnimationStart();*/
                        //第一个参数跳转目的地界面，第二个参数请求code，第三个参数intent addFlags；大于0才生效；如Intent.FLAG_ACTIVITY_NEW_TASK
                        //mAuthHelper.openUserPage(MessageActivity.class,1002,0);
                    }
                }).build());
        mAuthHelper.setActivityResultListener(new ActivityResultListener() {
            @Override
            public void onActivityResult(int requestCode, int resultCode, Intent data) {
                Log.i(TAG,"requestcode="+requestCode+";resultcode="+resultCode+";data="+data.toString());
                if(requestCode==1002&&resultCode==1){
                    mAuthHelper.quitLoginPage();
                }
            }
        });
        int authPageOrientation = ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT;
        if (Build.VERSION.SDK_INT == 26) {
            authPageOrientation = ActivityInfo.SCREEN_ORIENTATION_BEHIND;
        }
        updateScreenSize(authPageOrientation);
        int dialogHeight = (int) (mScreenHeightDp /2f);
        int dialogWidth= (int) (mScreenWidthDp*3/4f);

        mAuthHelper.setAuthUIConfig(new AuthUIConfig.Builder()
                .setPrivacyBefore("阅读同意")
                .setAppPrivacyOne("《用户注册条款》", "https://test.h5.app.tbmao.com/user")
                .setAppPrivacyTwo("《隐私权保护政策》", "https://www.baidu.com")
                .setAppPrivacyThree("《隐私权保护》", "https://www.baidu.com")
                .setAppPrivacyColor(ContextCompat.getColor(mActivity,R.color.black), Color.parseColor("#002E00"))
                //单独设置授权页协议文本颜色
                .setPrivacyOneColor(Color.RED)
                .setPrivacyTwoColor(Color.BLUE)
                .setPrivacyThreeColor(Color.BLUE)
                .setPrivacyOperatorColor(Color.GREEN)
                //设置授权页运营商协议位置
                //.setPrivacyOperatorIndex(2)
                .setVendorPrivacyPrefix("《")
                .setVendorPrivacySuffix("》")
                //隐藏默认切换其他登录方式
                .setSwitchAccHidden(true)
                //隐藏默认Toast
                .setLogBtnToastHidden(true)
                //协议文本行间距
                /*.protocolLineSpaceDp(40)
                //二次弹窗协议文本行间距
                .privacyAlertProtocolLineSpaceDp(40)*/
                //沉浸式状态栏
                .setNavColor(Color.parseColor("#026ED2"))
                .setStatusBarColor(Color.parseColor("#026ED2"))
                .setWebViewStatusBarColor(Color.parseColor("#026ED2"))
                .setWebHiddeProgress(true)
                //二次弹窗协议前后缀
                /*.setPrivacyAlertBefore("请阅读")
               .setPrivacyAlertEnd("等协议")*/
                //二次弹窗标题及确认按钮使用系统字体
                /*.setPrivacyAlertTitleTypeface(Typeface.MONOSPACE)
                .setPrivacyAlertBtnTypeface(Typeface.MONOSPACE)*/
                /*//二次弹窗使用自定义字体
                .setPrivacyAlertTitleTypeface(createTypeface(mContext,"globalFont.ttf"))
                .setPrivacyAlertBtnTypeface(createTypeface(mContext,"testFont.ttf"))
                .setPrivacyAlertContentTypeface(createTypeface(mContext,"testFont.ttf"))*/
                //单独设置二次弹窗协议文本颜色
                /*..setPrivacyAlertOneColor(Color.RED)
                .setPrivacyAlertTwoColor(Color.BLUE)
                .setPrivacyAlertThreeColor(Color.GRAY)
                .setPrivacyAlertOperatorColor(Color.GREEN)*/
                //设置协议展示页webview缓存模式 LOAD_CACHE_ONLY: 不发网络请求资源，只读取缓存。LOAD_NO_CACHE: 不使用缓存，只从网络获取数据。
                //LOAD_CACHE_ELSE_NETWORK:只要本地有，无论是否过期，或者no-cache，都使用缓存中的数据。本地没有缓存时才从网络上获取。
                //.setWebCacheMode(WebSettings.LOAD_NO_CACHE)

                //授权页使用系统字体
               /* .setNavTypeface(Typeface.SANS_SERIF)
                .setSloganTypeface(Typeface.SERIF)
                .setLogBtnTypeface(Typeface.MONOSPACE)
                .setSwitchTypeface(Typeface.MONOSPACE)
                .setProtocolTypeface(Typeface.MONOSPACE)
                .setNumberTypeface(Typeface.MONOSPACE)
                .setPrivacyAlertContentTypeface(Typeface.MONOSPACE)*/
               //授权页使用自定义字体
               /*.setNavTypeface(createTypeface(mContext,"globalFont.ttf"))
               .setSloganTypeface(createTypeface(mContext,"globalFont.ttf"))
               .setLogBtnTypeface(createTypeface(mContext,"globalFont.ttf"))
               .setSwitchTypeface(createTypeface(mContext,"testFont.ttf"))
               .setProtocolTypeface(createTypeface(mContext,"testFont.ttf"))
               .setNumberTypeface(createTypeface(mContext,"testFont.ttf"))*/
                //授权页协议名称系统字体
                .setProtocolNameTypeface(Typeface.SANS_SERIF)
                //授权页协议名称自定义字体
                //.setProtocolNameTypeface(createTypeface(mContext,"globalFont.ttf"))
                //授权页协议名称是否添加下划线
                .protocolNameUseUnderLine(true)
                //二次弹窗协议名称系统字体
                //.setPrivacyAlertProtocolNameTypeface(Typeface.SANS_SERIF)
                //二次弹窗协议名称自定义字体
                .setPrivacyAlertProtocolNameTypeface(createTypeface(mContext,"globalFont.ttf"))
                //二次弹窗协议名称是否添加下划线
                .privacyAlertProtocolNameUseUnderLine(true)


                .setLightColor(true)
                .setBottomNavColor(Color.TRANSPARENT)
                .setWebNavTextSizeDp(20)
                //图片或者xml的传参方式为不包含后缀名的全称 需要文件需要放在drawable或drawable-xxx目录下 in_activity.xml, mytel_app_launcher.png
                .setAuthPageActIn("in_activity", "out_activity")
                .setAuthPageActOut("in_activity", "out_activity")
                .setProtocolShakePath("protocol_shake")
                .setCheckBoxShakePath("protocol_shake")

                .setPageBackgroundPath("page_background_color")
                .setLogoImgPath("mytel_app_launcher")
                //一键登录按钮三种状态背景示例login_btn_bg.xml
                //.setLogBtnBackgroundPath("login_btn_bg")
                .setScreenOrientation(authPageOrientation)

                .setLogBtnBackgroundDrawable(btnDrawable)
                .setPrivacyAlertBtnBackgroundImgDrawable(alertBtnDrawable)

                //二次弹窗
                .setPrivacyAlertIsNeedShow(true)
                .setPrivacyAlertIsNeedAutoLogin(true)
                .setPrivacyAlertBackgroundColor(Color.WHITE)
                .setPrivacyAlertMaskAlpha(0.5f)
                .setPrivacyAlertAlignment(Gravity.CENTER)
                .setPrivacyAlertWidth(dialogWidth)
                .setPrivacyAlertHeight(dialogHeight)
                .setPrivacyAlertCornerRadiusArray(new int[]{10,10,10,10})
                .setPrivacyAlertTitleTextSize(15)
                .setPrivacyAlertTitleColor(Color.BLACK)
                .setPrivacyAlertContentTextSize(12)
                .setPrivacyAlertContentColor(Color.RED)
                .setPrivacyAlertContentHorizontalMargin(40)
                .setPrivacyAlertContentVerticalMargin(30)
                .setPrivacyAlertBtnTextColor(Color.WHITE)
                .setPrivacyAlertBtnTextColorPath("privacy_alert_btn_color")
                .setPrivacyAlertEntryAnimation("in_activity")
                .setPrivacyAlertExitAnimation("out_activity")


                .create());
    }


}
