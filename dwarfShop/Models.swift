//
//  Models.swift
//  dwarfShop
//
//  Created by Murat ŞENOL on 22.09.2022.
//

import Foundation
var userId = 1
var productId = 1

struct User: Codable {
    let id: Int
    let name: String?
    let age: Int?
    let isMale: Bool?
    let role: Int?
    
    init(name: String?, age: Int?, isMale: Bool?, role: Int?){
        self.id = userId
        self.name = name
        self.age = age
        self.isMale = isMale
        self.role = role
        
        userId += 1
    }
}

protocol Sellable {
    var price: Double { get set }
    var rating: Double { get set }
}

struct Product: Sellable {
    let id: Int
    let name: String
    var price: Double
    var rating: Double
    let seller: String?
    
    init(name: String, price: Double, rating: Double, seller: String?){
        self.id = productId
        self.name = name
        self.price = price
        self.rating = rating
        self.seller = seller
        
        productId += 1
    }
    
}


enum Role: CaseIterable {
    case cleaner
    case warrior
    case cook
    case archer
    case builder
    case farmer
    case doctor
    case jobless
    
    var id: Int {
        switch self {
        case .cleaner: return 0
        case .warrior: return 1
        case .cook: return 2
        case .archer: return 3
        case .builder: return 4
        case .farmer: return 5
        case .doctor: return 6
        case .jobless: return 7
        }
    }
    
    var description: String {
        switch self {
        case .cleaner: return "Temizlikçi"
        case .warrior: return "Savaşçı"
        case .cook: return "Aşçı"
        case .archer: return "Okçu"
        case .builder: return "İnşacı"
        case .farmer: return "Çiftçi"
        case .doctor: return "Doktor"
        case .jobless: return "İşsiz"
        }
    }
    
}
