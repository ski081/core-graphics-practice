 import UIKit
 import PlaygroundSupport
 
 public final class LineView: UIView {
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let color = CGColor(colorSpace: colorspace,
                            components: [1, 1, 1, 1])!
        
        context.setFillColor(color)
        context.fill(bounds)
        
        context.saveGState()
        
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: 25, y: 25, width: 100, height: 100))
        context.addPath(path)
        context.clip()
        
        
        context.setFillColor(CGColor(colorSpace: colorspace, components: [1, 0, 0, 1])!)
        context.fill(CGRect(x: 50, y: 50, width: 100, height: 100))
    
        context.restoreGState()
        
        context.setFillColor(CGColor(colorSpace: colorspace, components: [0, 0, 1, 1])!)
        context.fill(CGRect(x: 150, y: 150, width: 100, height: 100))
        
    }
 }
 
 let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
 
 PlaygroundPage.current.liveView = lineView
 
 

