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
        let attributes: [NSAttributedStringKey: Any] = [
            .font: UIFont.systemFont(ofSize: 40),
            .foregroundColor: UIColor.blue
        ]

        let attributedString = NSAttributedString(string: string, attributes: attributes)
        attributedString.draw(at: CGPoint(x: 20, y: 20))
    }
}

let liveView = TransformView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = liveView



