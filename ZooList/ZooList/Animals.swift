//
//  Animals.swift
//  ZooList
//
//  Created by ROLF J. on 2023/04/02.
//

import Foundation

struct Animal {
    let name: String
    let inDate: String
}

extension Animal {
    static let list: [Animal] = [
        Animal(name: "Zebra", inDate: "2023-03-01"),
        Animal(name: "Crocodile", inDate: "2023-03-02"),
        Animal(name: "Lion", inDate: "2023-03-03"),
        Animal(name: "Tiger", inDate: "2023-03-04"),
        Animal(name: "Komodo Dragon", inDate: "2023-03-05"),
        Animal(name: "Meerkat", inDate: "2023-03-06"),
        Animal(name: "Turtle", inDate: "2023-03-07"),
        Animal(name: "Chicken", inDate: "2023-03-08"),
        Animal(name: "Pig", inDate: "2023-03-09"),
        Animal(name: "Cow", inDate: "2023-03-10"),
        Animal(name: "Squirrel", inDate: "2023-03-11"),
        Animal(name: "Fox", inDate: "2023-03-12"),
        Animal(name: "Brown Bear", inDate: "2023-03-13")
    ]
}
