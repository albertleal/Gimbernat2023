package com.albertleal.gibernat.myapplication.ui.scenes.login

import androidx.compose.runtime.Composable
import androidx.navigation.NavController
import com.albertleal.gibernat.myapplication.datasources.SessionDataSource
import com.albertleal.gibernat.myapplication.helpers.ComposableFactory

class LoginSceneFactory(
    private val navController: NavController,
    private val sessionDataSource: SessionDataSource
) : ComposableFactory<Any> {
    @Composable
    override fun create(id: String?): Any {
        val viewModel = LoginViewModel(navController, sessionDataSource)
        return LoginScene(viewModel = viewModel)
    }
}