package com.monobroadcast.mono29

import io.flutter.embedding.android.FlutterFragmentActivity
import com.nielsen.app.sdk.AppSdk;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject
import com.nielsen.app.sdk.IAppNotifier
import android.util.Log
import android.os.Bundle

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "nielsen_bridge"
    private var appSdk: AppSdk? = null

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "init" -> {
                    val appId = call.argument<String>("appId")
                    if (appId != null) {
                        initNielsenSdk(appId)
                        result.success("Nielsen SDK Initialized")
                    } else {
                        result.error("INVALID_ARGUMENT", "appId is null", null)
                    }
                }
                "play" -> {
                    val metadata = call.argument<Map<String, String>>("metadata") ?: emptyMap()
                    play(metadata)
                    result.success("Play called")
                }
                "stop" -> {
                    stop()
                    result.success("Stop called")
                }
                "loadMetadata" -> {
                    val metadata = call.argument<Map<String, String>>("metadata")
                    if (metadata != null) {
                        loadMetadata(metadata)
                        result.success("Metadata loaded")
                    } else {
                        result.error("INVALID_ARGUMENT", "metadata is null", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun initNielsenSdk(appId: String) {
        try {
            val config = JSONObject().apply {
                put("appid", appId)
                put("sfcode", "us")   // production/test ตามที่ TAM กำหนด
                put("nol_devDebug", "D") // DEBUG สำหรับ dev
            }

            val notifier = object : IAppNotifier {
                override fun onAppSdkEvent(timestamp: Long, code: Int, description: String) {
                    Log.d("NielsenSDK", "Event: $code at $timestamp, Description: $description")
                }
            }

            appSdk = AppSdk(this, config, notifier)
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Failed to initialize SDK", e)
        }
    }

    private fun play(metadata: Map<String, String>) {
        try {
            val jsonMetadata = JSONObject(metadata)
            appSdk?.play(jsonMetadata)
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Play failed", e)
        }
    }

    private fun stop() {
        try {
            appSdk?.stop()
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Stop failed", e)
        }
    }

    private fun loadMetadata(metadata: Map<String, String>) {
        try {
            val jsonMetadata = JSONObject(metadata)
            appSdk?.loadMetadata(jsonMetadata)
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Load metadata failed", e)
        }
    }
}

