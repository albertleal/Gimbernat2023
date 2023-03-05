package com.albertleal.gibernat.myapplication.ui.scenes.main

import androidx.compose.runtime.Composable
import androidx.navigation.NavController
import com.albertleal.gibernat.myapplication.datasources.CapsulesDataSource
import com.albertleal.gibernat.myapplication.datasources.SessionDataSource
import com.albertleal.gibernat.myapplication.helpers.ComposableFactory
import com.albertleal.gibernat.myapplication.ui.scenes.login.LoginScene
import com.albertleal.gibernat.myapplication.ui.scenes.login.LoginViewModel

class MainSceneFactory (
    private val navController: NavController,
    private val sessionDataSource: SessionDataSource,
    private val capsulesDataSource: CapsulesDataSource
) :
    ComposableFactory<Any> {
    @Composable
    override fun create(id: String?): Any {
        val viewModel = MainSceneViewModel(navController, sessionDataSource, capsulesDataSource)
        return MainScene(viewModel)
    }
}