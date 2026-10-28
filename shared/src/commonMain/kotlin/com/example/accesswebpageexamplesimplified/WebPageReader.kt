package com.example.accesswebpageexamplesimplified

import com.fleeksoft.ksoup.Ksoup
import io.ktor.client.HttpClient
import io.ktor.client.request.get
import io.ktor.client.statement.bodyAsText

class WebPageReader {
    private val client = HttpClient()

    @Throws(Exception::class)
    suspend fun read(url: String, selector: String): String {
        val html = client.get(url).bodyAsText()
        return Ksoup.parse(html).select(selector).eachText().joinToString("\n")
    }
}