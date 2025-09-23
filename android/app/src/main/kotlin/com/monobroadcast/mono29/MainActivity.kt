package com.monobroadcast.mono29

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.nielsen.app.sdk.AppSdk
import com.nielsen.app.sdk.IAppNotifier
import org.json.JSONObject

class MainActivity : FlutterFragmentActivity() {

    private val CHANNEL = "nielsen_bridge"
    private var appSdk: AppSdk? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "init" -> {
                        val appId = call.argument<String>("appId")
                        if (appId.isNullOrEmpty()) {
                            result.error("INVALID_ARGUMENT", "appId is null or empty", null)
                        } else {
                            initNielsenSdk(appId)
                            result.success("Nielsen SDK initialized with appId: $appId")
                        }
                    }

                    "play" -> {
                        val metadata = call.argument<Map<String, String>>("metadata") ?: emptyMap()
                        play(metadata)
                        result.success("Play event sent")
                    }

                    "stop" -> {
                        stop()
                        result.success("Stop event sent")
                    }

                    "loadMetadata" -> {
                        val metadata = call.argument<Map<String, String>>("metadata")
                        if (metadata.isNullOrEmpty()) {
                            result.error("INVALID_ARGUMENT", "metadata is null or empty", null)
                        } else {
                            loadMetadata(metadata)
                            result.success("Metadata loaded")
                        }
                    }
                      
                    "end" -> {
                        end()
                        result.success("End session called")
                    }

                    "setPlayheadPosition" -> {
                        val position = call.argument<Int>("position") ?: 0
                        setPlayheadPosition(position)
                        result.success("Playhead position set to $position")
                    }

                    else -> result.notImplemented()
                }
            }
    }

    /**
     * Initialize Nielsen SDK
     */
    private fun initNielsenSdk(appId: String) {
        try {
            val config = JSONObject().apply {
                put("appid", appId)
                put("sfcode", "us")          // เปลี่ยนเป็นค่า sfcode ที่ TAM กำหนด เช่น "ap" สำหรับเอเชีย
                put("nol_devDebug", "DEBUG") // ใช้ DEBUG mode ตอน dev
            }

            val notifier = object : IAppNotifier {
                override fun onAppSdkEvent(timestamp: Long, code: Int, description: String) {
                    Log.d("NielsenSDK", "Event $code at $timestamp: $description")
                }
            }

            appSdk = AppSdk(this, config, notifier)
            Log.i("NielsenSDK", "Initialized successfully with appId=$appId")
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Failed to initialize SDK", e)
        }
    }

    /**
     * Send Play event
     */
    private fun play(metadata: Map<String, String>) {
        try {
            val jsonMetadata = JSONObject(metadata)
            appSdk?.play(jsonMetadata)
            Log.d("NielsenSDK", "Play event: $metadata")
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Play failed", e)
        }
    }

    /**
     * Send Stop event
     */
    private fun stop() {
        try {
            appSdk?.stop()
            Log.d("NielsenSDK", "Stop event sent")
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Stop failed", e)
        }
    }

    /**
     * Load metadata
     */
    private fun loadMetadata(metadata: Map<String, String>) {
        try {
            val jsonMetadata = JSONObject(metadata)
            appSdk?.loadMetadata(jsonMetadata)
            Log.d("NielsenSDK", "Metadata loaded: $metadata")
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Load metadata failed", e)
        }
    }

    /**
     * End Nielsen session
     */
    private fun end() {
        try {
            appSdk?.stop()
            appSdk = null
            Log.d("NielsenSDK", "End session")
        } catch (e: Exception) {
            Log.e("NielsenSDK", "End session failed", e)
        }
    }

    /**
     * Update playhead position (seconds)
     */
    private fun setPlayheadPosition(position: Int) {
        try {
            appSdk?.setPlayheadPosition(position.toLong())
            Log.d("NielsenSDK", "Playhead position set: $position")
        } catch (e: Exception) {
            Log.e("NielsenSDK", "Set playhead position failed", e)
        }
    }
}
