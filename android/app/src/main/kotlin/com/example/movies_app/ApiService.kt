package com.example.movies_app

import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface ApiService {
    @GET("{moviesUri}")
    fun getMoviesData(@Path("moviesUri") moviesUri: String, @Query("api_key") apiKey: String): Call<ResponseBody>
}