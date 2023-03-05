package com.albertleal.gibernat.myapplication.ui.scenes.main

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavController
import com.albertleal.gibernat.myapplication.AppRoutes
import com.albertleal.gibernat.myapplication.datasources.CapsulesDataSource
import com.albertleal.gibernat.myapplication.datasources.SessionDataSource
import com.albertleal.gibernat.myapplication.models.Capsule
import kotlinx.coroutines.launch

class MainSceneViewModel(
    private val navController: NavController,
    private val sessionDataSource: SessionDataSource,
    private val capsulesDataSource: CapsulesDataSource
) : ViewModel() {
    private val _capsules = MutableLiveData<List<Capsule>>()
    val capsules: LiveData<List<Capsule>> = _capsules

    fun fetch(){
        viewModelScope.launch {
            val capsulesList = capsulesDataSource.fetch()
            _capsules.value = capsulesList
            subscribe()
        }
    }

    fun subscribe(){
        viewModelScope.launch {
            capsulesDataSource.subscribe {
                _capsules.value = it
            }
        }
    }

    fun signOut() {
        viewModelScope.launch {
            sessionDataSource.signOutUser()
            navController.navigate(AppRoutes.WELCOME.value){
                popUpTo(AppRoutes.MAIN.value){
                    inclusive = true
                }
            }
        }
    }

    fun navigateToDetail(capsule: Capsule){
        viewModelScope.launch {
            Log.d("Navigating to capsule", ""+capsule.id)
            navController.navigate(AppRoutes.CAPSULE_DETAIL.value+"/"+capsule.id)
        }
    }
}