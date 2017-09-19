import UIKit

public final class HeartView: UIView {
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(bounds)
        
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addQuadCurve(to: CGPoint(x: 150, y: 80),
                          control: CGPoint(x: 175, y: 50))
        path.addQuadCurve(to: CGPoint(x: 100, y: 100),
                          control: CGPoint(x: 125, y: 50))
        
        
        context.addPath(path)
        
        context.setLineWidth(10.0)
        context.setLineCap(.round)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineJoin(.round)
        
        context.strokePath()
    }
}
