import Foundation
import UIKit

public extension UIImage {
    
    public func croppedToSize(size:CGSize) -> UIImage? {
        guard size.width <= self.size.width && size.height <= self.size.height else { return nil }
        
        var r = CGRectZero
        r.origin = CGPoint(x:size.width/2, y:size.height/2)
        r = CGRectInset(r, -self.size.width/2, -self.size.height/2)
        
        UIGraphicsBeginImageContext(size)
        self.drawInRect(r)
        let out = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return out
    }

    
    public class func compoundImageFrom(images:[AnyObject], constrainedToSize inSize:CGSize, withBackgroundColor inBGColor:UIColor=UIColor.lightGrayColor()) -> UIImage? {
        guard images.count > 0 else { return nil }
        
        UIGraphicsBeginImageContext(inSize)
        
        let allRect = CGRect(origin: CGPointZero, size: inSize)
        inBGColor.setFill()
        UIRectFill(allRect)
        
        // figure out how many rows and colummns to have
        var rows = images.count
        var columns = 1
        if images.count == 4 {
            rows = 2
            columns = 2
        }
        
        let w = inSize.width/CGFloat(rows)
        let h = inSize.height/CGFloat(columns)
        let s = CGSize(width:w, height:h)
        
        for i in 0..<columns {
            for j in 0..<rows {
                let thisO = CGPoint(x: w*CGFloat(j), y: h*CGFloat(i))
                if let thisImage = images[i*columns+j] as? UIImage {
                    let thisRect = CGRect(origin: thisO, size: s)
                    if let croppedImage = thisImage.croppedToSize(s) {
                        croppedImage.drawInRect(thisRect)
                    }
                }
            }
        }
        
        let out = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return out
    }
    
    // Composites an array of UIImages onto a background image
    // the size of the composited images depends on the number of objects passed in
    // to get blank spaces, use an object other than a UIImage in the array (typically, NSNull)
    // e.g. to get 3 images in 4 slots (with the fourth slot empty), pass [iamge1,image2,image3,NSNull()]
    public class func compoundImageFrom(images:[AnyObject], withBackgroundImage bgImage:UIImage) -> UIImage? {
        guard images.count > 0 else { return nil }
        
        let inSize = bgImage.size
        
        UIGraphicsBeginImageContext(inSize)
        
        let allRect = CGRect(origin: CGPointZero, size: inSize)
        bgImage.drawInRect(allRect)
        
        // figure out how many rows and colummns to have
        var rows = images.count
        var columns = 1
        if images.count == 4 {
            rows = 2
            columns = 2
        }
        
        let blockWidth = inSize.width/CGFloat(rows)
        let blockHeight = inSize.height/CGFloat(columns)
        let blockSize = CGSize(width:blockWidth, height:blockHeight)
        
        for i in 0..<columns {
            for j in 0..<rows {
                let thisO = CGPoint(x: blockWidth*CGFloat(j), y: blockHeight*CGFloat(i))
                if let thisImage = images[i*columns+j] as? UIImage {
                    let blockRect = CGRect(origin: thisO, size: blockSize)
                    let thisScale = thisImage.size.width/bgImage.size.width
                    let drawnImage = UIImage(CGImage: thisImage.CGImage!, scale: thisScale, orientation: thisImage.imageOrientation)
                    if let croppedImage = drawnImage.croppedToSize(blockSize) {
                        croppedImage.drawInRect(blockRect)
                    }
                }
            }
        }
        
        let out = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return out
    }
}
