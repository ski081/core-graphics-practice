import UIKit
import PlaygroundSupport

public final class TransformView: UIView {
    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let color = CGColor(colorSpace: colorSpace,
                            components: [1, 1, 1, 1])!
        
        context.setFillColor(color)
        context.fill(bounds)
        
        context.translateBy(x: bounds.midX, y: bounds.midY)
        context.scaleBy(x: 0.5, y: 0.5)
        context.translateBy(x: -bounds.midX, y: -bounds.midY)
        
//        context.translateBy(x: bounds.midX, y: bounds.midY)
//        context.scaleBy(x: -1, y: 1)
//        context.translateBy(x: -bounds.midX, y: -bounds.midY)
        
        drawGrid(context)
        
        context.translateBy(x: bounds.midX, y: bounds.midY)
        context.rotate(by: .pi / -4)
        context.translateBy(x: -bounds.midX, y: -bounds.midY)
        
        drawGrid(context)
        
        context.setFillColor(CGColor(colorSpace: colorSpace, components: [0, 0, 1, 1])!)
        context.fill(CGRect(x: 60, y: 60, width: 200, height: 200))
        
        context.translateBy(x: bounds.midX, y: bounds.midY)
        context.rotate(by: .pi / -4)
        context.translateBy(x: -bounds.midX, y: -bounds.midY)

        context.setFillColor(CGColor(colorSpace: colorSpace, components: [0, 1, 0, 0.5])!)
        context.fill(CGRect(x: 60, y: 60, width: 200, height: 200))

        // 360 == .pi * 2
        // 180 == .pi
        // degrees == .pi * 2 * (degrees / 360)
        
//        context.setFillColor(CGColor(colorSpace: colorSpace, components: [0, 0, 1, 1])!)
//        context.fill(CGRect(x: 60, y: 60, width: 200, height: 200))
    }
    
    func drawGrid(_ context: CGContext) {
        context.saveGState()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let color = CGColor(colorSpace: colorSpace,
                            components: [0, 0, 0, 0.2])!
        context.setStrokeColor(color)
        context.setLineWidth(2)
        context.stroke(bounds)
        
        let increment: CGFloat = 20
        
        for x in 1..<Int(bounds.height / increment) {
            context.move(to: CGPoint(x: CGFloat(x) * increment, y: 0))
            context.addLine(to: CGPoint(x: CGFloat(x) * increment, y: bounds.height))
            
            for y in 1..<Int(bounds.width / increment) {
                context.move(to: CGPoint(x: 0, y: CGFloat(y) * increment))
                context.addLine(to: CGPoint(x: bounds.width, y: CGFloat(y) * increment))
            }
        }
        
        context.strokePath()
        
        context.setFillColor(CGColor(colorSpace: colorSpace, components: [1, 0, 0, 0.5])!)
        context.fill(CGRect(x: 0, y: 0, width: increment, height: increment))
        context.restoreGState()
    }
}

let liveView = TransformView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = liveView
