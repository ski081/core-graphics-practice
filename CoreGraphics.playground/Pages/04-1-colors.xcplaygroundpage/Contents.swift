import UIKit
import PlaygroundSupport

public final class LineView: UIView {
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let color = CGColor(colorSpace: colorspace, components: [0.5, 1])!
        
        
        context.setFillColor(color)
        context.fill(bounds)
    }
}

let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = lineView

