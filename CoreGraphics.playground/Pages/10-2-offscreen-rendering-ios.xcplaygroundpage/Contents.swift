import UIKit

let scale: CGFloat = 2
let bounds = CGRect(x: 0, y: 0, width: 320, height: 320)

UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
let context = UIGraphicsGetCurrentContext()
UIColor.blue.setFill()
UIBezierPath(rect: CGRect(x: 20, y: 20, width: 100, height: 100)).fill()
let image = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()
