//
//  Pessoa.swift
//  ViewCodeAndMVVM
//
//  Created by IATec - Rodrigo Leme on 13/07/22.
//
import UIKit
import Foundation

struct UserResult: Codable {
    var group:[User]
}

struct User: Codable {
    var name: String
    var age: Int
    var profession: String
    var salary: String
    var imageUser: String
    var isEnableHeart: Bool
    var identifier: Int
}
