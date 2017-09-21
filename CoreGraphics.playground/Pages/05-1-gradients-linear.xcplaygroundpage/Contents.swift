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
    
        let colors = [
            CGColor(colorSpace: colorspace, components: [0, 0, 1, 1])!,
            CGColor(colorSpace: colorspace, components: [0.6, 0, 1, 1])!,
            CGColor(colorSpace: colorspace, components: [0.3, 0.3, 0.5, 1])!
        ] as CFArray
        
        let locations: [CGFloat] = [
            0,
            0.9,
            1
        ]
        let gradient = CGGradient(colorsSpace: colorspace,
                                  colors: colors,
                                  locations: locations)!
        context.drawLinearGradient(gradient,
                                   start: CGPoint(x: 0, y: 0),
                                   end: CGPoint(x: 0, y: 320),
                                   options: [])
    }
 }
 
 let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
 
 PlaygroundPage.current.liveView = lineView
 

