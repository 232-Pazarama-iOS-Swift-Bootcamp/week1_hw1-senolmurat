//
//  ConsoleIO.swift
//  dwarfShop
//
//  Created by Murat ŞENOL on 22.09.2022.
//

import Foundation

class ConsoleIO {
    
    
    func writeMessage(_ message: String, to: OutputType = .standard) {
      switch to {
      case .standard:
        print("\(message)")
      case .error:
        fputs("Error: \(message)\n", stderr)
      }
    }
    
    func printUsage() {

      let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
      
      //writeMessage("usage:")
      //writeMessage("\(executableName)")
    }
    
    func getInput() -> String {
      // or just return readLine()
      let keyboard = FileHandle.standardInput
      let inputData = keyboard.availableData
      let strData = String(data: inputData, encoding: String.Encoding.utf8)!
      return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    func clear() {
        //print("\u{001B}[2J")
    }
    
    func printBanner(_ message: String) {
        print("|--------------------------------------------------------------|")
        print("|--------------------------------------------------------------|")
        print("\(message)")
        print("|--------------------------------------------------------------|")
        print("|--------------------------------------------------------------|")
    }
    
    func printProductInfo(with product: Product) {
        print("|--------------------------------------------------------------|")
        print("|--------------------------------------------------------------|")
        print("Ürün İsmi: \(product.name)")
        print("Fiyat: \(product.price)")
        print("Puan: \(product.rating)")
        print("Satıcı: \(product.seller)")
        print("|--------------------------------------------------------------|")
        print("|--------------------------------------------------------------|")
    }

}

enum OutputType {
    case error
    case standard
}
