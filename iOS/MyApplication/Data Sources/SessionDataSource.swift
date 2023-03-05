//
//  SessionDataSource.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore

protocol ISessionDataSource {
    func getCurrentUser() -> FirebaseAuth.User?
    func isLoggedIn() -> Bool
    
    func loginUserAnonymous() async -> Bool
    func loginUser(email: String, password: String) async -> Bool
    func signUpUser(email: String, password: String) async -> Bool
    
    func signOutUser() throws
}

class SessionDataSource: ISessionDataSource {
    // Initialize Firebase Authentication
    lazy private var auth = Auth.auth()
    
    func getCurrentUser() -> FirebaseAuth.User? {
        // Get the currently authenticated user from the Firebase Authentication SDK
        return auth.currentUser
    }
    
    func isLoggedIn() -> Bool {
        // Check if the current user is null (i.e., no user is logged in)
        // If the current user is not null, then a user is logged in
        return getCurrentUser() != nil
    }
    
    func loginUserAnonymous() async -> Bool {
        signOutUser()
        do {
            // Sign in the user anonymously using the Firebase Authentication SDK
            let result = try await auth.signInAnonymously()
            return true
        } catch {
            // If an exception occurs, return false to indicate that the login was not successful
            return false
        }
    }
    
    func loginUser(email: String, password: String) async -> Bool {
        signOutUser()
        do {
            // Sign in the user with the specified email and password using the
            // Firebase Authentication SDK
            let result = try await auth.signIn(withEmail: email, password: password)
            return true
        } catch {
            // If an exception occurs, return false to indicate that the login was not successful
            return false
        }
    }
    
    func signUpUser(email: String, password: String) async -> Bool {
        signOutUser()
        do {
            // Create a new user account with the specified email and password using the
            // Firebase Authentication SDK
            let result = try await auth.createUser(withEmail: email, password: password)
            // Return true if the signup was successful (i.e., the user is not null)
            return result.user != nil
        } catch {
            // If an exception occurs, return false to indicate that the signup was not successful
            return false
        }
    }
    
    func signOutUser() {
        // Sign out the currently authenticated user using the Firebase Authentication SDK
        do {
            try auth.signOut()
        } catch {}
    }
}
