//
//  MenuItem.swift
//  Twitter
//
//  Created by Raphael Cerqueira on 31/08/21.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let name: String
}

let menuItems = [
    MenuItem(image: "person", name: "profile"),
    MenuItem(image: "list.bullet.rectangle", name: "lists"),
    MenuItem(image: "text.bubble", name: "topics"),
    MenuItem(image: "bookmark", name: "bookmarks"),
    MenuItem(image: "bolt", name: "moments"),
    MenuItem(image: "star", name: "monetization")
]
