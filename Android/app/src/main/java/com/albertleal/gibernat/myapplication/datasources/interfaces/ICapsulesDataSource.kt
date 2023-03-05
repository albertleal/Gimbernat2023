package com.albertleal.gibernat.myapplication.datasources.interfaces

import com.albertleal.gibernat.myapplication.models.Capsule

interface ICapsulesDataSource {
    suspend fun fetch(): List<Capsule>
    fun get(id: String): Capsule?


}