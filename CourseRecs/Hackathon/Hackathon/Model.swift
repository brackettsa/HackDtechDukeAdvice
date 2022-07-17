import Foundation
import UIKit

let sharedInstance = Model()
class Model: NSObject {

    var database:FMDatabase? = nil

    class func getInstance() -> Model
    {
        if (sharedInstance.database == nil)
        {
        sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "course_info.db"))
        }
        return sharedInstance
    }

    func GetTemp(inputArray: [Float]) -> [String] {
        sharedInstance.database!.open()

        let myResult:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM courses Where overall >= ? and overall <= ? and dif >= ? and dif <= ? and hours >= ? and hours <= ? Order by overall DESC, dif ASC", withArgumentsIn: inputArray)
                        
        var itemInfo: [String] = []

        if (myResult != nil)
        {
            while myResult.next() {
                //let tempString = myResult.string(forColumn: "course")
                let tempString = myResult.string(forColumn: "course")
                itemInfo.append(tempString ?? "The Course was null")
        }
    }
        
        sharedInstance.database!.close()
        return itemInfo 
    }
}
