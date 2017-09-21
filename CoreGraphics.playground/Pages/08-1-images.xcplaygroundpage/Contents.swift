import UIKit
import PlaygroundSupport
import AVFoundation

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
        
        let image = #imageLiteral(resourceName: "square.jpg")
        context.saveGState()
        
        context.translateBy(x: bounds.midX, y: bounds.midY)
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: -bounds.midX, y: -bounds.midY)
        
 
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: bounds)
        context.draw(image.cgImage!, in: bounds)
        
        context.setBlendMode(.overlay)
        context.draw(#imageLiteral(resourceName: "landscape.jpg").cgImage!, in: bounds)
        
        context.restoreGState()
    }
}

let liveView = TransformView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = liveView

