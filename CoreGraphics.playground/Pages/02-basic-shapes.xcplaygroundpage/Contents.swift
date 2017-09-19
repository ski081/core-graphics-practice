import UIKit
import PlaygroundSupport

final class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.red.cgColor)
        context.fill(CGRect(x: 10, y: 10, width: 50, height: 50))
        
        context.setStrokeColor(UIColor.blue.cgColor)
        context.stroke(CGRect(x: 20, y: 80, width: 50, height: 50))

        context.fillEllipse(in: CGRect(x: 20, y: 80, width: 50, height: 50))
    }
}

let view = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
PlaygroundPage.current.liveView = view

