package app.bestsalary.shareimageplugin

import android.content.Context
import android.content.Intent
import android.support.v4.content.FileProvider
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.io.File


const val SHARE_CHANNEL = "channel:app.bestsalary.shareimageplugin/share_image_plugin"
const val SHARE_IMAGE = "shareImage"
const val SHARE_IMAGE_PROVIDER = "app.securedrive.flutter.image_provider"
const val IMAGE = "image"
const val TEXT = "text"

class ShareImagePlugin(private val context: Context) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), SHARE_CHANNEL)
            channel.setMethodCallHandler(ShareImagePlugin(registrar.context()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == SHARE_IMAGE) {
            shareFile(call.argument(IMAGE), call.argument(TEXT))
        } else {
            result.notImplemented()
        }
    }

    private fun shareFile(path: String, text: String) {
        val imageFile = File(context.applicationContext.cacheDir, path)
        val contentUri = FileProvider.getUriForFile(context, SHARE_IMAGE_PROVIDER, imageFile)
        val shareIntent = Intent(Intent.ACTION_SEND)
        shareIntent.type = "image/jpg"
        shareIntent.putExtra(Intent.EXTRA_STREAM, contentUri)
        context.startActivity(Intent.createChooser(shareIntent, text))
    }
}
