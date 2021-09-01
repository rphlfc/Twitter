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
    MenuItem(image: "person", name: "Profile"),
    MenuItem(image: "list.bullet.rectangle", name: "Lists"),
    MenuItem(image: "text.bubble", name: "Topics"),
    MenuItem(image: "bookmark", name: "Bookmarks"),
    MenuItem(image: "bolt", name: "Moments"),
    MenuItem(image: "star", name: "Monetization")
]
