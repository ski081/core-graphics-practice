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
            CGColor(colorSpace: colorspace, components: [0.2, 0.2, 0.8, 1])!,
            CGColor(colorSpace: colorspace, components: [0.6, 0.4, 1, 1])!
            ] as CFArray
        
        let gradient = CGGradient(colorsSpace: colorspace,
                                  colors: colors,
                                  locations: nil)!
        let center = CGPoint(x: rect.midX, y: rect.midY)
        context.drawRadialGradient(gradient,
                                   startCenter: center,
                                   startRadius: rect.width,
                                   endCenter: center,
                                   endRadius: 0,
                                   options: [.drawsBeforeStartLocation])
    }
 }
 
 let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
 
 PlaygroundPage.current.liveView = lineView
 
 

