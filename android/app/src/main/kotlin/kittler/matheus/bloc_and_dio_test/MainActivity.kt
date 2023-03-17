package kittler.matheus.bloc_and_dio_test

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import org.jetbrains.annotations.Nullable

class MainActivity : FlutterActivity() {

    override fun onCreate(@Nullable savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine?.dartExecutor?.binaryMessenger?.let {
            MethodChannel(
                it,
                CHANNEL_NAME
            ).setMethodCallHandler { call, result ->
                if (call.method.equals("HelloFromNative")) {
                    helloFromNative()
                    result.success("DONE!")
                }
            }
        }
    }

    private fun helloFromNative() {
        startActivity(Intent("android.settings.INPUT_METHOD_SETTINGS"))
    }

    companion object {
        private const val CHANNEL_NAME = "flutter.native/helper"
    }
}
