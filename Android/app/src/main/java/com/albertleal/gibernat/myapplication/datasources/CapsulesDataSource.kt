package com.albertleal.gibernat.myapplication.datasources

import com.albertleal.gibernat.myapplication.datasources.interfaces.ICapsulesDataSource
import com.albertleal.gibernat.myapplication.models.Capsule
import com.google.firebase.database.ChildEventListener
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
import com.google.protobuf.Value
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException
import kotlin.coroutines.suspendCoroutine

class CapsulesDataSource(private val database: FirebaseDatabase) : ICapsulesDataSource {

    private var capsules: List<Capsule> = mutableListOf<Capsule>()

    fun subscribe(callback: (List<Capsule>) -> Unit)  {
        val ref = database.getReference("capsules")
        ref.addValueEventListener(object : ValueEventListener {
            override fun onDataChange(snapshot: DataSnapshot) {
                val fetchedCapsules = mutableListOf<Capsule>()

                for (capsuleSnapshot in snapshot.children) {
                    val capsule = capsuleSnapshot.getValue(Capsule::class.java)
                    if (capsule != null) {
                        capsule.id = capsuleSnapshot.key
                        fetchedCapsules.add(capsule)
                    }
                }

                //Updating local copy
                capsules = fetchedCapsules
                callback(fetchedCapsules)
            }

            override fun onCancelled(error: DatabaseError) {
                callback(emptyList()) // or callback with some default value
            }
        })
    }

    override suspend fun fetch(): List<Capsule> {
        return suspendCoroutine { continuation ->

            val ref = database.getReference("capsules")
            ref.addListenerForSingleValueEvent(object : ValueEventListener {
                override fun onDataChange(snapshot: DataSnapshot) {
                    val fetchedCapsules = mutableListOf<Capsule>()

                    for (capsuleSnapshot in snapshot.children) {
                        val capsule = capsuleSnapshot.getValue(Capsule::class.java)
                        if (capsule != null) {
                            capsule.id = capsuleSnapshot.key
                            fetchedCapsules.add(capsule)
                        }
                    }

                    //Updating local copy
                    capsules = fetchedCapsules

                    continuation.resume(fetchedCapsules)
                }

                override fun onCancelled(error: DatabaseError) {
                    continuation.resumeWithException(error.toException())
                }
            })
        }
    }

    override fun get(id: String): Capsule? {
        return capsules.find { it.id == id }
    }

}