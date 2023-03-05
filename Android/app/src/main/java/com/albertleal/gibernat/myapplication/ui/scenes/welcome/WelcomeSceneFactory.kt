package com.albertleal.gibernat.myapplication.ui.scenes.welcome

import androidx.compose.runtime.Composable
import androidx.navigation.NavController
import com.albertleal.gibernat.myapplication.datasources.SessionDataSource
import com.albertleal.gibernat.myapplication.helpers.ComposableFactory
import com.albertleal.gibernat.myapplication.ui.scenes.main.MainScene
import com.albertleal.gibernat.myapplication.ui.scenes.main.MainSceneViewModel

class WelcomeSceneFactory (private val navController: NavController) :
    ComposableFactory<Any> {
    @Composable
    override fun create(id: String?): Any {
        val viewModel = WelcomeSceneViewModel(navController)
        return WelcomeScene(viewModel)
    }
}