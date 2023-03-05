package com.albertleal.gibernat.myapplication.models

data class Capsule(
    var name: String = "",
    var description: String = "",
    var imageUrl: String = "",
    var heroImageUrl: String?,
    var flavorProfile: String = "",
    var origin: String = "",
    var intensity: Int = 0,
    var price: Double = 0.0,
    var categories: List<String> = listOf(),
    var id: String? = null
) {
    constructor() : this("", "", "", null, "", "", 0, 0.0, listOf(), null)
}