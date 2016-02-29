
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
            
            motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { data, error in
                //print(data?.gravity.x)
                //print(data?.gravity.y)
                //let rotation = atan2((data?.rotationRate.x)!, (data?.rotationRate.y)!) - M_PI
                //self.image.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
            })
            
            motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { data, error in
                //print("asd")
                //print(data!.rotationRate.x)
                //print(data!)
                //print(self.image.frame.midX)
                let imageCenter = self.image.center.x
                let xData = Int((data!.rotationRate.y)*50)
                let newImageX = imageCenter + CGFloat(xData)
                
                //let rotation = atan2((data?.rotationRate.x)!, (data?.rotationRate.y)!) - M_PI
                self.image.center.x = CGFloat(newImageX)
            })
            
        } else {
            print("else")
        }
        
        
    }

}
