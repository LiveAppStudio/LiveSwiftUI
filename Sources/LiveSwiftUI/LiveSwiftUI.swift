import SwiftUI


public struct LiveSwiftUI {
    public private(set) var text = "Hello, World!"
    
    public init() {
        
    }
    
    public func preview() -> some View {
        Text("Hello, world!")
    }
}

extension ViewModifier {
    
}
