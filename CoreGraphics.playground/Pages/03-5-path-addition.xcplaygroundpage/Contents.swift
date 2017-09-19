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
        
        // Draw circle
        path.addEllipse(in: CGRect(x: 50, y: 50, width: 100, height: 100))
        
        // Draw line
        let path2 = CGMutablePath()
        path2.move(to: CGPoint(x: 50, y: 50))
        path2.addLine(to: CGPoint(x: 150, y: 150))
        
        // Add line to circle
        path.addPath(path2)
        
        context.addPath(path)
        context.setFillColor(UIColor.green.cgColor)
        context.setLineWidth(4)
        context.strokePath()
    }
}

let pathView = PathView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = pathView
