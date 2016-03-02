
import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    let motionManager = CMMotionManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.accelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates()
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {data, error in
                
                //X Rotation
                let imageCenterX = self.image.center.x
                let xData = Int((data!.acceleration.y))
                let newImageX = imageCenterX + CGFloat(xData)
                self.image.center.x = CGFloat(newImageX)
                
                //Y Rotation
                let imageCenterY = self.image.center.y
                let yData = Int(data!.acceleration.x)
                let newImageY = imageCenterY + CGFloat(yData)
                self.image.center.y = CGFloat(newImageY)
            })
        }

       
        if motionManager.gyroAvailable {
            motionManager.deviceMotionUpdateInterval = 0.01
            motionManager.gyroUpdateInterval = 0.01
            motionManager.startDeviceMotionUpdates()
            motionManager.startGyroUpdates()
            
            
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { data, error in
                
                print(self.image.center.y)
                
                //X Rotation
                let imageCenter = self.image.center.x
                let xData = Int((data!.rotationRate.y)*(M_PI * 2))
                let newImageX = imageCenter + CGFloat(xData)
                
                if self.image.center.x < 1700 && self.image.center.x > -1300 {
                    self.image.center.x = CGFloat(newImageX)
                }
                
                if self.image.center.x > 1700 {
                    self.image.center.x = CGFloat(-1250)
                }
                
                if self.image.center.x < -1300 {
                    self.image.center.x = CGFloat(1650)
                }
                
                //Y Rotation
                let imageCenterY = self.image.center.y
                let yData = Int((data!.rotationRate.x)*M_PI)
                let newImageY = imageCenterY + CGFloat(yData)
                
                if self.image.center.y > -255 && self.image.center.y < 940 {
                    self.image.center.y = CGFloat(newImageY)
                }

            })
            
        } else {
            print("else")
        }
        
    }

}
