//
//  DataImporting.swift
//  StatsScanner
//
//  Created by Kamran on 12/22/21.
//  Update 12/24/21s
//


import Foundation

extension String {
    func fileName() -> String {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }
    
    func fileExtension() -> String {
        return URL(fileURLWithPath: self).pathExtension
    }
}
func readCSV(inputFile: String, separator: String) -> [String] {
    let fileExtension = inputFile.fileExtension()
    let fileName = inputFile.fileName()
    
    let fileURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    let inputFile = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    
    //Get Data
    do {
        let savedData = try String(contentsOf: inputFile)
        return savedData.components(separatedBy: separator)
        
    } catch {
        return ["ERROR: File Could Not be Found"]
    }
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

func importData(arr: [String]) {
    let d = Dataset()
    for i in 0...arr.count {
        for j in 0...arr[0].count {
            if(Character(arr[i]).isNumber) {
                let value = Double(arr[i]) ?? 0
                d.addVal(index_X: i, index_Y: j, val: value)
            }
        }
    }
                
}

var myData = readCSV(inputFile: "Awards_R.csv", separator: ",")
var x: () = printItems()

func printItems() {
    print(myData)
    print(myData[0])
}
