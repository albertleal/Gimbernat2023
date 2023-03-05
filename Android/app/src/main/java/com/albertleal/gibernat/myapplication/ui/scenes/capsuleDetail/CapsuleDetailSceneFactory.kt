package com.albertleal.gibernat.myapplication.ui.scenes.capsuleDetail

import androidx.compose.runtime.Composable
import androidx.navigation.NavController
import com.albertleal.gibernat.myapplication.datasources.CapsulesDataSource
import com.albertleal.gibernat.myapplication.helpers.ComposableFactory

class CapsuleDetailSceneFactory (
    private val navController: NavController,
    private val capsulesDataSource: CapsulesDataSource
) :
    ComposableFactory<Any> {
    @Composable
    override fun create(id: String?): Any {
        val capsule = id?.let { capsulesDataSource.get(it) }
        val viewModel = CapsuleDetailViewModel(navController = navController, capsule = capsule)
        return CapsuleDetailScene(viewModel)
    }
}