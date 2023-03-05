//
//  CapsulesDataSource.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import Foundation
import FirebaseDatabase

protocol ICapsulesDataSource {
    func get(id: String) -> Capsule?
    func fetch() async throws -> [Capsule]
    func subscribe(callback: @escaping ([Capsule]) -> Void)
}

class CapsulesDataSource: ICapsulesDataSource {
    
    private var capsules: [Capsule] = []

    lazy private var database: DatabaseReference = Database.database().reference().child("capsules")

    func subscribe(callback: @escaping ([Capsule]) -> Void) {
        self.database.observe(.value) { snapshot in
            var fetchedCapsules = [Capsule]()
            for capsuleSnapshot in snapshot.children.allObjects as! [DataSnapshot] {
                fetchedCapsules.append(Capsule(capsuleSnapshot))
            }
            // Updating local copy
            self.capsules = fetchedCapsules
            callback(fetchedCapsules)
        }
        
    }
    
    func fetch() async throws -> [Capsule] {
        return try await withCheckedThrowingContinuation { continuation in
            self.database.observeSingleEvent(of: .value) { snapshot in
                var fetchedCapsules = [Capsule]()
                for capsuleSnapshot in snapshot.children.allObjects as! [DataSnapshot] {
                    fetchedCapsules.append(Capsule(capsuleSnapshot))
                }

                // Updating local copy
                self.capsules = fetchedCapsules
                continuation.resume(returning: fetchedCapsules)
            } withCancel: { error in
                continuation.resume(throwing: error)
            }
        }
    }

    func get(id: String) -> Capsule? {
        return capsules.first(where: { $0.id == id })
    }
}
