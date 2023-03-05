package com.albertleal.gibernat.myapplication

//Each value in the enum class is associated with a string value that represents the route for
//a destination in the application's navigation graph.
enum class AppRoutes(val value: String) {
    WELCOME("Welcome"),
    LOGIN("Login"),
    MAIN("Main"),
    CAPSULE_DETAIL("CapsuleDetail")
}