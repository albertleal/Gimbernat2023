package com.albertleal.gibernat.myapplication.ui.scenes.welcome

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavController
import com.albertleal.gibernat.myapplication.AppRoutes
import com.albertleal.gibernat.myapplication.datasources.SessionDataSource
import kotlinx.coroutines.launch

class WelcomeSceneViewModel (private val navController: NavController) : ViewModel() {
    fun navigateToLogin(){
        viewModelScope.launch {
            navController.navigate(AppRoutes.LOGIN.value) {
                popUpTo(AppRoutes.WELCOME.value) {
                    inclusive = true
                }
            }
        }
    }
}
