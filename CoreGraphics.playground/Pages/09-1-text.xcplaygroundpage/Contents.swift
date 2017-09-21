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
        
        let string = "Hello World"
        
        context.setTextDrawingMode(.stroke)
        context.setLineWidth(4)
        
        let attributes: [NSAttributedStringKey: Any] = [
            .font: UIFont.systemFont(ofSize: 40, weight: .black),
            .foregroundColor: UIColor.blue
        ]
        
        (string as NSString).draw(at: CGPoint(x: 20, y: 20), withAttributes: attributes)
        
    }
}

let liveView = TransformView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = liveView


