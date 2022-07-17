//
//  data.swift
//  Hackathon
//
//  Created by Rose DiPietro on 7/16/22.
//

import Foundation

struct Cources: Identifiable{
    var cource_num: String = ""
    var cource_name: String = ""
    var professor: String = ""
    var semester: String = ""
    var review: String = ""
    var id = UUID()
    
    init(raw: [String]) {
        cource_num = raw[0]
        cource_name = raw[1]
        professor = raw[2]
        semester = raw[3]
        review = raw[4]
        
    }
}

func loadCSV(from csvName: String) -> [Cources] {
    var csvToStruct = [Cources]()
    
    //find csv file
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    //get content into one string
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    
    //convert string to array of data
    var rows = data.components(separatedBy: "\r")

    
    //remove header
    rows.removeFirst()
    rows.removeFirst()
    
    for row in rows {
        let csvCols = row.components(separatedBy: ",")
        let courcesStruct = Cources.init(raw: csvCols)
        csvToStruct.append(courcesStruct)
    }
    
    for cource in csvToStruct {
        print(cource.cource_num)
    }
    return csvToStruct
}








