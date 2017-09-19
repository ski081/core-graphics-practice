import UIKit
import PlaygroundSupport

import UIKit

public final class UpwardChevronView: UIView {
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(bounds)
        
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: CGPoint(x: 200, y: 100))
        
        context.addPath(path)
        
        context.setLineWidth(10.0)
        context.setLineCap(.round)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineJoin(.round)
        
        context.strokePath()
    }
}


let chevronView = UpwardChevronView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

PlaygroundPage.current.liveView = chevronView
