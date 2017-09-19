import UIKit
import PlaygroundSupport

public final class LineView: UIView {
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(bounds)
        
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 40, y: 120))
        path.addLine(to: CGPoint(x: 200, y: 120))
        
        context.addPath(path)
        
        context.setLineWidth(10.0)
        context.setLineCap(.round)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.strokePath()
    }
}

let lineView = LineView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = lineView
