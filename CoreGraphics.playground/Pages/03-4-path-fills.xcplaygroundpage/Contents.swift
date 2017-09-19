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
        
        // Outer box (fill)
        path.addRect(CGRect(x: 50, y: 50, width: 100, height: 100))
        // Inner box (remove)
        path.addRect(CGRect(x: 75, y: 75, width: 50, height: 50))
        // Line through middle (fill)
        path.addRect(CGRect(x: 75, y: 100, width: 50, height: 10))
        
        context.addPath(path)
        context.setFillColor(UIColor.blue.cgColor)
        
        // Switches off between fill and remove
        context.fillPath(using: .evenOdd)
    }
}

let pathView = PathView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = pathView


