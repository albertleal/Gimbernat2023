package com.albertleal.gibernat.myapplication.ui.components

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.albertleal.gibernat.myapplication.models.Capsule

@Composable
fun CapsuleBody(capsule: Capsule) {
    Column(modifier = Modifier
        .padding(horizontal = 16.dp)
        .padding(top = 8.dp)
    ){
        Text(
            text = "Flavor Profile",
            style = MaterialTheme.typography.subtitle1,
            fontWeight = FontWeight.Bold)

        Text(
            text = capsule?.flavorProfile ?: "",
            style = MaterialTheme.typography.body1
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = "Origin",
            style = MaterialTheme.typography.subtitle1,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = capsule?.origin ?: "",
            style = MaterialTheme.typography.body1
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = "Intensity",
            style = MaterialTheme.typography.subtitle1,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = capsule?.intensity.toString() ?: "",
            style = MaterialTheme.typography.body1
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = "Price",
            style = MaterialTheme.typography.subtitle1,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = "$${capsule?.price ?: ""}",
            style = MaterialTheme.typography.body1
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = "Categories",
            style = MaterialTheme.typography.subtitle1,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = capsule?.categories?.joinToString(", ") ?: "",
            style = MaterialTheme.typography.body1
        )
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            text = "Description",
            style = MaterialTheme.typography.subtitle1,
            fontWeight = FontWeight.Bold
        )
        Text(
            text = capsule?.description ?: "",
            textAlign = TextAlign.Justify,
            style = MaterialTheme.typography.body2
        )
        Spacer(modifier = Modifier.height(150.dp))
    }
}