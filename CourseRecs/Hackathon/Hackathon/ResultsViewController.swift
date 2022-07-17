import UIKit
import Foundation

//class MyCustomCell: UITableViewCell {
//    @IBOutlet weak var className: UILabel!
//}

class ResultsViewController: UIViewController {
    
    var results: [String] = []
    
    @IBOutlet weak var Rec1: UILabel!
    @IBOutlet weak var Rec2: UILabel!
    @IBOutlet weak var Rec3: UILabel!
    @IBOutlet weak var Rec4: UILabel!
    @IBOutlet weak var Rec5: UILabel!
    

    
    var minimumOverall: Float = 0.0
    var maximumOverall: Float = 0.0
    var minimumDif: Float = 0.0
    var maximumDif: Float = 0.0
    var minimumHours: Float = 0.0
    var maximumHours: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        let results = Model.getInstance().GetTemp(inputArray: [minimumOverall, maximumOverall, minimumDif, maximumDif, minimumHours, maximumHours])
        Rec1.text = ""
        Rec2.text = ""
        Rec3.text = ""
        Rec4.text = ""
        Rec5.text = ""
        
        if results.count == 0
        {
            Rec1.text = "Your Search"
            Rec2.text = "Returned No Results"
            Rec3.text = ""
            Rec4.text = ""
            Rec5.text = ""
        }
        else
        {
            if results.count >= 1
            {
                Rec1.text = results[0]
            }
            if results.count >= 2
            {
                Rec2.text = results[1]
            }
            if results.count >= 3
            {
                Rec3.text = results[2]
            }
            if results.count >= 4
            {
                Rec4.text = results[3]
            }
            if results.count >= 5
            {
                Rec5.text = results[4]
            }
        }

        
}
    
}

// MARK: - UITableViewDataSource
//extension ResultsViewController: UITableViewDataSource {
//
//  func tableView(_ tableView: UITableView,
//                 numberOfRowsInSection section: Int) -> Int {
//    return results.count
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    let result = results[indexPath.row]
//    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCustomCell
//
//      if results.count == 0
//      {
//          //cell.className.text = "No classes found"
//          cell.className.text = "Hello"
//      }
//    else
//    {
//        //cell.className.text = result
//        cell.className.text
//        = "Goodbuye"
//    }
//    return cell
//  }
//
//}
    



