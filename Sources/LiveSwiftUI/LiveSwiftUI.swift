@_exported import SwiftUI

public class LSPreview: ObservableObject {
    public private(set) var text = "Hello, World!"
    @Published var project: Data
    
    public init(project: Data) {
        self.project = project
    }
    
    public var preview: some View {
        Text("Hello, world!")
    }
    
//    public func exportToFile() -> FileH
}

extension ViewModifier {
    
}
