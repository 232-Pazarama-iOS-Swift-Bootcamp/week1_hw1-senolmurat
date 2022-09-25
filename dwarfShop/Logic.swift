//
//  Logic.swift
//  dwarfShop
//
//  Created by Murat ŞENOL on 22.09.2022.
//

import Foundation

class Logic {

  let consoleIO = ConsoleIO()
  static var productList: [Product] = []
  var userBasket: [Product] = []
    
  var currentUser: User?


  func staticMode() {
    consoleIO.printUsage()
  }

}

enum MainMenuOptions: CaseIterable {
    case login
    case exit
    
    var index: Int {
        switch self {
        case .exit: return -1
        case .login: return 1
        }
    }
    
    var description: String {
        switch self {
        case .exit: return "Kapat"
        case .login: return "Giriş Yap"
        }
    }
}

//
//extension UserDefaults {
//    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
//        guard let data = self.value(forKey: key) as? Data else { return nil }
//        return try? decoder.decode(type.self, from: data)
//    }
//
//    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
//        let data = try? encoder.encode(object)
//        self.set(data, forKey: key)
//    }
//}
//
