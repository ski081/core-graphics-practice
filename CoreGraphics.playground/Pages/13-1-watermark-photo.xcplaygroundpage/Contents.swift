import UIKit

let scale: CGFloat = 2
let bounds = CGRect(x: 0, y: 0, width: 320, height: 320)
let colorSpace = CGColorSpaceCreateDeviceRGB()
let bitmapInfo = CGImageAlphaInfo.premultipliedFirst.rawValue

let context = CGContext(data: nil,
                        width: Int(bounds.width * scale),
                        height: Int(bounds.height * scale),
                        bitsPerComponent: 8,
                        bytesPerRow: 0,
                        space: colorSpace,
                        bitmapInfo: bitmapInfo)!

context.scaleBy(x: scale, y: scale)

// Draw image
context.draw(#imageLiteral(resourceName: "sf.jpg").cgImage!, in: bounds)

context.translateBy(x: bounds.midX, y: bounds.midY)
context.scaleBy(x: 1, y: -1)
context.translateBy(x: -bounds.midX, y: -bounds.midY)

// Draw text
//context.setBlendMode(.difference)
let string = "San Francisco" as NSString
let stringRect = CGRect(x: 0, y: bounds.height - 24, width: bounds.width - 8, height: 20)

UIGraphicsPushContext(context)
let attributes: [NSAttributedStringKey: Any] = [
    .foregroundColor: UIColor(white: 1, alpha: 0.5),
    .font: UIFont.systemFont(ofSize: 20, weight: .medium)
]

string.draw(in: stringRect,
            withAttributes: attributes)
UIGraphicsPopContext()

let cgImage = context.makeImage()!
let image = UIImage(cgImage: cgImage, scale: scale, orientation: .up)

let data = UIImageJPEGRepresentation(image, 0.8)
FileManager.default.createFile(atPath: "foo.jpg", contents: data, attributes: nil)
