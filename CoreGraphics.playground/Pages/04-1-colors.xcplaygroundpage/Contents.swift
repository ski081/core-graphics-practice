 import UIKit
import PlaygroundSupport

public final class LineView: UIView {
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let color = CGColor(colorSpace: colorspace,
                            components: [0, 1, 0, 1])!
        
        
        context.setFillColor(color)
        context.fill(bounds)
        
        let secondColor = CGColor(colorSpace: colorspace,
                                  components: [0, 0, 1, 0.5])!
        context.setFillColor(secondColor)
        context.setBlendMode(.normal)
        context.fill(rect.insetBy(dx: 64, dy: 64))
    }
}

let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = lineView

