package com.albertleal.gibernat.myapplication.ui.components

import android.util.Log
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.albertleal.gibernat.myapplication.models.Capsule


@Composable
fun CapsuleItem(
    capsule: Capsule,
    onItemClick: (Capsule) -> Unit
) {

    Log.d("Capsule Image URL", capsule.imageUrl)

    Row(
        modifier = Modifier
            .clickable { onItemClick(capsule) }
            .fillMaxWidth()
            .padding(vertical = 8.dp, horizontal = 16.dp)
    ) {

        AsyncImage(
            model = capsule.imageUrl,
            modifier = Modifier.size(64.dp).fillMaxHeight(),
            contentDescription = "Image of a capsule test "+capsule.name,
        )

        Column(
            modifier = Modifier
                .padding(start = 16.dp)
                .fillMaxWidth()
        ) {
            Text(
                text = capsule.name,
                style = MaterialTheme.typography.titleLarge,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            Text(
                text = capsule.description,
                style = MaterialTheme.typography.bodyMedium,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis
            )

            Text(
                text = "$${capsule.price}",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.primary,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            Text(
                text = "Origin: " + capsule.origin,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            Text(
                text = "Favour: " + capsule.flavorProfile,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
            Text(
                text = "Intensity: " + capsule.intensity,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}