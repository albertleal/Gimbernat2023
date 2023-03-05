package com.albertleal.gibernat.myapplication.ui.scenes.capsuleDetail

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.navigation.NavController
import com.albertleal.gibernat.myapplication.datasources.CapsulesDataSource
import com.albertleal.gibernat.myapplication.datasources.SessionDataSource
import com.albertleal.gibernat.myapplication.models.Capsule

class CapsuleDetailViewModel(
    private val navController: NavController,
    internal val capsule: Capsule?
) : ViewModel() {

    fun back() {
        navController.popBackStack()
    }
}