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
        
        
        let path = CGMutablePath()
        let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
        path.addRoundedRect(in: rect,
                            cornerWidth: 10,
                            cornerHeight: 10)
        context.addPath(path)
        context.clip()
        let colors = [
            CGColor(colorSpace: colorspace, components: [1, 0, 0, 1])!,
            CGColor(colorSpace: colorspace, components: [1, 0, 1, 1])!
            ] as CFArray
        let gradient = CGGradient(colorsSpace: colorspace, colors: colors, locations: nil)!
        context.drawLinearGradient(gradient,
                                   start: CGPoint(x: 50, y: 50),
                                   end: CGPoint(x: 50, y: 150),
                                   options: [])
    }
 }
 
 let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
 
 PlaygroundPage.current.liveView = lineView
 
 
 

