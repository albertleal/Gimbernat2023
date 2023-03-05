package com.albertleal.gibernat.myapplication.ui.scenes.capsuleDetail

import android.annotation.SuppressLint
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.imePadding
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.MaterialTheme
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.Group
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.data.Group
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.unit.dp
import androidx.compose.ui.zIndex
import coil.compose.AsyncImage
import coil.compose.rememberImagePainter
import com.albertleal.gibernat.myapplication.ui.components.BackButton
import com.albertleal.gibernat.myapplication.ui.components.CapsuleBody
import com.albertleal.gibernat.myapplication.ui.components.CapsuleHeader


@SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CapsuleDetailScene(viewModel: CapsuleDetailViewModel) {
    //Checking if there's a capsule value or if it's arriving as null
    viewModel.capsule?.let { capsule ->
        Scaffold(
            topBar = {
                TopAppBar(
                    title = { Text(text = capsule.name ?: "") },
                    navigationIcon = {
                        BackButton {
                            viewModel.back()
                        }
                    }
                )
            }
        ) { innerPadding ->
            BoxWithConstraints {
                val scrollState = rememberScrollState()
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(innerPadding)
                        .verticalScroll(scrollState)
                ) {
                    Box(modifier = Modifier
                        .fillMaxWidth()
                        .offset { IntOffset(0, scrollState.value / 2) }
                    ){
                        CapsuleHeader(capsule = capsule)
                    }
                    Column(
                        modifier = Modifier
                            .background(MaterialTheme.colors.background)
                            .offset { IntOffset(0, scrollState.value / 6) }
                    ) {

                        CapsuleBody(capsule = capsule)
                    }
                }
            }
        }
    }
}