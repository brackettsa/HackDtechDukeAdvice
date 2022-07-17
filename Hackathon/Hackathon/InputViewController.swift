import Foundation
import UIKit
import RangeUISlider
     
            
class InputViewController: UIViewController, RangeUISliderDelegate {

    @IBOutlet weak var rangeOverall: RangeUISlider!
    @IBOutlet weak var rangeDif: RangeUISlider!
    @IBOutlet weak var rangeHours: RangeUISlider!
    
    @IBOutlet weak var tempText: UITextField!
    
    @IBOutlet weak var minOverall: UITextField!
    @IBOutlet weak var maxOverall: UITextField!
        
    @IBOutlet weak var minDif: UITextField!
    @IBOutlet weak var maxDif: UITextField!
    
    @IBOutlet weak var minHours: UITextField!
    @IBOutlet weak var maxHours: UITextField!
    
    @IBOutlet weak var ratingSlider: RangeUISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeOverall.delegate = self
        rangeDif.delegate = self
        rangeHours.delegate = self
    }
    
    func rangeChangeFinished(event: RangeUISliderChangeFinishedEvent) {
        
        if event.slider.identifier == 1
        {
            minOverall.text = "\(round(event.minValueSelected*10)/10.0)"
            maxOverall.text = "\(round(event.maxValueSelected*10)/10.0)"
        }
        
        if event.slider.identifier == 3
        {
            minDif.text = "\(round(event.minValueSelected*10)/10.0)"
            maxDif.text = "\(round(event.maxValueSelected*10)/10.0)"
        }
        
        if event.slider.identifier == 4
        {
            minHours.text = "\(round(event.minValueSelected*10)/10.0)"
            maxHours.text = "\(round(event.maxValueSelected*10)/10.0)"
        }

    }

    func rangeIsChanging(event: RangeUISliderChangeEvent) {
        //print("\(event.minValueSelected) -  \(event.maxValueSelected) - identifier: \(event.slider.identifier)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let controller = segue.destination as! ResultsViewController
        
        controller.minimumOverall = (minOverall.text! as NSString).floatValue
        controller.maximumOverall = (maxOverall.text! as NSString).floatValue
        controller.minimumDif = (minDif.text! as NSString).floatValue
        controller.maximumDif = (maxDif.text! as NSString).floatValue
        controller.minimumHours = (minHours.text! as NSString).floatValue
        controller.maximumHours = (maxHours.text! as NSString).floatValue
    }


}
