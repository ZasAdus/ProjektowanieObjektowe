package com.example.autoryzacja

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class UserController {

    private val users = listOf(
        User(1, "zasadus",  "zasadus1234"),
        User(2, "bochen",      "bochenidas"),
        User(3, "chillout", "pelenluz"),
    )

    private val userLogins = users.map { it.login }


    @GetMapping("/users")
    fun getUsers(): List<String> = userLogins
}
