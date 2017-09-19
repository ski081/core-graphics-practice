import UIKit
import PlaygroundSupport

final class CustomView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.white.cgColor)
        context.fill(bounds)
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: 200, y: 10))
        
        context.addPath(path)
        context.fillPath()
    }
}

let view = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
PlaygroundPage.current.liveView = view
