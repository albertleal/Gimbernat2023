package com.albertleal.gibernat.myapplication.ui.components

import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.albertleal.gibernat.myapplication.models.Capsule

@Composable
fun CapsuleHeader(capsule: Capsule) {
        if(!capsule.heroImageUrl.isNullOrBlank()){
                AsyncImage(
                        model = capsule.heroImageUrl,
                        modifier = Modifier.fillMaxWidth(),
                        contentDescription = "Image of a capsule test "+capsule.name,
                )
        }else{
                AsyncImage(
                        model = capsule.imageUrl,
                        modifier = Modifier.fillMaxWidth().height(120.dp),
                        contentDescription = "Image of a capsule test "+capsule.name,
                )
        }

}