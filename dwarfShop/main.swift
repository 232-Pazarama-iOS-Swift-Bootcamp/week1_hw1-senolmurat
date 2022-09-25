//
//  main.swift
//  dwarfShop
//
//  Created by Murat ŞENOL on 22.09.2022.
//

import Foundation

setup()
let logic = Logic()
//logic.staticMode()
mainLoop()



var menuOption: Int = -1000

func printWelcomeMessage() {
    logic.consoleIO.writeMessage("Fantastik Ortaçağ Cüce Mağzamıza Hoşgeldiniz !")
    for option in MainMenuOptions.allCases {
        logic.consoleIO.writeMessage("\(option.index))\(option.description)")
    }
}


func mainLoop() {
    printWelcomeMessage()
    while menuOption != -1 {
        let selectedOption: String = logic.consoleIO.getInput()
        if let selectedOption = Int(selectedOption) {
            switch selectedOption {
            case MainMenuOptions.login.index:
                loginLoop()
            case MainMenuOptions.exit.index:
                logic.consoleIO.clear()
                menuOption = MainMenuOptions.exit.index
                exit(0)
            default:
                logic.consoleIO.writeMessage("Seçenek Menüde bulunmamaktadır. Tekrar deneyiniz...")
            }
        }
    }
}

func loginLoop() {
    logic.consoleIO.clear()
    menuOption = MainMenuOptions.login.index
    
    logic.consoleIO.printBanner("GİRİŞ YAP")
    
    logic.consoleIO.writeMessage("Önceki menüye dönmek için 0 yazın...")
    logic.consoleIO.writeMessage("İsim: ")
    let userName = logic.consoleIO.getInput()
    
    if let currentOption = Int(userName), currentOption == 0 {
        menuOption = 0
        mainLoop()
    }
    
    logic.consoleIO.writeMessage("Cinsiyet: ")
    logic.consoleIO.writeMessage("1)Erkek\n2)Kadın")
    let gender: Bool = logic.consoleIO.getInput() == "1" ? true : false
    
    logic.consoleIO.writeMessage("Yaş:")
    let age: Int = Int(logic.consoleIO.getInput()) ?? 18
    
    logic.consoleIO.writeMessage("Görev:")
    for role in Role.allCases {
        logic.consoleIO.writeMessage("\(role.id))\(role.description)")
    }
    let roleID: Int = Int(logic.consoleIO.getInput()) ?? Role.jobless.id
    
    logic.currentUser = .init(name: userName, age: age, isMale: gender, role: roleID)
    logic.consoleIO.writeMessage("\n Başarıyla Üye oldunuz.")
    
    
    shopLoop()
    //when a product is selected it add to the basket  , with parameter like -d it will show the details
    //TODO: create a basket
    
    //Finish shopping
    
    //Payment types
    
}

func shopLoop() {
    
    var shopOption: Int = -1000
    var selectedOption: String = ""
    
    while shopOption != 0 {
        //TODO: list products
        logic.consoleIO.printBanner("MAĞAZA")
        for product in Logic.productList {
            logic.consoleIO.writeMessage("\(product.id))\(product.name)")
        }
        logic.consoleIO.writeMessage("Alışverişi tamamlamak için 0 yazın...")
        
        selectedOption = logic.consoleIO.getInput()
        
        guard let shopOption = Int(selectedOption) else {
            logic.consoleIO.writeMessage("Girdiğiniz Seçenek alınamadı...")
            continue
        }
        if shopOption == 0 {
            break
        }
        
        displayProduct(selectedProductID: shopOption)
        
    }
    
    finishShopping()
}

func displayProduct(selectedProductID: Int) {
    var selectedProduct: Product? = Logic.productList.first(where: {$0.id == selectedProductID})
    guard let selectedProduct = selectedProduct else {
        logic.consoleIO.writeMessage("Seçtiğiniz Ürün Ürünler Listesinde Bulunamadı...")
        return
    }
    
    var action: Int = -1
    while action != 0 {
        logic.consoleIO.printProductInfo(with: selectedProduct)
        
        logic.consoleIO.writeMessage("0)Ürünler Listesine Dön...")
        logic.consoleIO.writeMessage("1)Sepete Ekle")
        
        var input = logic.consoleIO.getInput()
        
        guard let shopOption = Int(input) else {
            logic.consoleIO.writeMessage("Girdiğiniz Seçenek alınamadı...")
            continue
        }
        if shopOption == 0 {
            break
        }
        else if shopOption == 1 {
            logic.userBasket.append(selectedProduct)
            logic.consoleIO.writeMessage("Ürün Başarıyla Sepete Eklendi !")
        }
    }
}

func finishShopping() {
    logic.consoleIO.printBanner("SATIN ALIM")
    var totalPrice: Double = 0
    for product in logic.userBasket {
        logic.consoleIO.writeMessage("\(product.name) - \(product.price)")
        totalPrice += product.price
    }
    logic.consoleIO.writeMessage("Toplam Tutar: \(totalPrice)")
    logic.consoleIO.writeMessage("Alışverşiniz için Teşekkür Ederiz !")
    exit(0)
}


func setup(){
    
    Logic.productList.append(.init(name: "Süpürge", price: 2.50, rating: 4, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Sabun", price: 1.50, rating: 4.5, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Zırh", price: 10, rating: 5, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Kılıç", price: 8.25, rating: 3.5, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Aşçı Bıçağı", price: 2, rating: 3, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Önlük", price: 2.50, rating: 4.75, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Ok", price: 0.50, rating: 4, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Yay", price: 2.50, rating: 4, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Çekiç", price: 2.50, rating: 4, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Tahta", price: 2.50, rating: 4, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Şifalı Bitkiler", price: 2.50, rating: 4, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Balta", price: 9.50, rating: 4, seller: "Tüccar Cüce"))
    Logic.productList.append(.init(name: "Tahta", price: 2.50, rating: 4, seller: "Tüccar Cüce"))
}


