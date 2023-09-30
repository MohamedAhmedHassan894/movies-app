package com.example.movies_app

import androidx.annotation.NonNull
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import okhttp3.ResponseBody
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class MainActivity : FlutterActivity() {
    private val MOVIES_CHANNEL = "com.TMDb/movies"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, MOVIES_CHANNEL)
        channel.setMethodCallHandler { call, result ->
            if (call.method == "getMoviesData") {
                val arguments = call.arguments() as Map<String, String>?
                val apiKey = arguments?.get("apiKey").toString()
                val baseUrl = arguments?.get("baseUrl").toString()
                val moviesUri = arguments?.get("moviesGetUri").toString()
                val retrofit = Retrofit.Builder()
                        .baseUrl(baseUrl)
                        .addConverterFactory(GsonConverterFactory.create())
                        .build()

                val apiService = retrofit.create(ApiService::class.java)
                apiService.getMoviesData(moviesUri, apiKey).enqueue(object : Callback<ResponseBody> {
                    override fun onResponse(call: Call<ResponseBody>, response: Response<ResponseBody>) {
                        Log.d("check response", response.toString())
                        if (response.isSuccessful)
                            result.success(response.body()?.string())
                        else
                            result.success(null)
                    }

                    override fun onFailure(call: Call<ResponseBody>, t: Throwable) {
                        Log.d("check response fail", t.toString())
                        result.success(null)
                    }

                })
            }
        }

    }
}
