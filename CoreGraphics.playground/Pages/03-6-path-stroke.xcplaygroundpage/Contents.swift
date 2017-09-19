import UIKit
import PlaygroundSupport

public final class PathView: UIView {
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(bounds)
        
        let path = CGMutablePath()
        
        let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
        let lineWidth: CGFloat = 4
        
        // Set rect inside or outside in regard to stroke
        // Negative is outside, positive is inside
        path.addRect(rect.insetBy(dx: -lineWidth / 2, dy: -lineWidth / 2))
        context.addPath(path)
        context.setStrokeColor(UIColor.orange.cgColor)
        context.setLineWidth(lineWidth)
        context.strokePath()
        
        context.setFillColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor)
        context.fill(CGRect(x: 50, y: 50, width: 100, height: 100))
    }
}

let pathView = PathView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = pathView

