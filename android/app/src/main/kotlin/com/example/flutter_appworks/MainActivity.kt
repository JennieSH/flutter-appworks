package com.example.flutter_appworks


import com.example.flutter_appworks.PrimeDialog.PrimeDialogListener
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// endpoint
class MainActivity: FlutterActivity() {

    private val CHANNEL = "tappay_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.d(TAG, "configureFlutterEngine")
        setChannelByCustomDialog(flutterEngine)

    }

    fun setChannelByCustomDialog(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    if (call.method == "getPrime") {
                        Log.d(TAG, "i got u ^.<")

                        val dialog = PrimeDialog(context, object : PrimeDialogListener {
                            override fun onSuccess(prime: String) {
                                Log.d(TAG, "onSuccess, prime=$prime")
                                result.success(prime)
                            }

                            override fun onFailure(error: String) {
                                Log.d(TAG, "onFailure, error=$error")
                                result.success(error)
                            }
                        })
                        dialog.show()
                    } else {
                        Log.d(TAG, "u know nothing ${call.method}")

                        result.error("404", "404", null)
                    }
//                result.error("404", "404", null)
                }

    }

    fun setChannelByAlertDialog(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    if (call.method == "getPrime") {
                        Log.d(TAG, "i got u ^.<")

                        val dialog = MaterialAlertDialogBuilder(context)
                                .setTitle("Dialog")
                                .setMessage("Write your message here. ....")
                                .setPositiveButton("Ok") { _, _ ->
                                    result.success("Ok got u")
                                }
                                .setNegativeButton("Cancel") { _, _ ->
                                    result.success("Cancel got u")
                                }
                        dialog.show()
                    } else {
                        Log.d(TAG, "u know nothing ${call.method}")
                        result.error("404", "404", null)
                    }
//                result.error("404", "404", null)
                }

    }

    companion object {
        const val TAG = "anan-android"
    }
}