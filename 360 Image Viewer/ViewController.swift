
import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
     let motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if motionManager.gyroAvailable {
            
            print(motionManager.gyroAvailable)
        
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.gyroUpdateInterval = 0.1
            
            motionManager.startDeviceMotionUpdates()
            motionManager.startGyroUpdates()
            
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { data, error in
                let imageCenter = self.image.center.x
                let xData = Int((data!.rotationRate.y)*50)
                let newImageX = imageCenter + CGFloat(xData)
                
                if self.image.center.x < 1700 && self.image.center.x > -1300 {
                    self.image.center.x = CGFloat(newImageX)
                }
                
                if self.image.center.x > 1700 {
                    self.image.center.x = CGFloat(-1250)
                    //self.image.center.x = CGFloat(newImageX)
                }
                
                if self.image.center.x < -1300 {
                    self.image.center.x = CGFloat(1650)
                }

            })
            
        } else {
            print("else")
        }
        
        
    }

}
