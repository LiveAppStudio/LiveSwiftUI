import SwiftUI

public struct LSProject: Codable, Transferable {
    var title: String
    var author: String
    var version: String
    var size: LSTargetSize
    var content: [LSElement]
    
    public init(title: String, author: String, version: String, size: LSTargetSize, content: [LSElement]) {
        self.title = title
        self.author = author
        self.version = version
        self.size = size
        self.content = content
    }
    
    public static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .json) { item in
            guard let exported = try? JSONEncoder().encode(item) else { return .init() }
            return exported
        }
    }
}

public enum LSElement: Codable, Hashable, Identifiable {
    case text(content: String, hidden: Bool = false, action: [LSAction] = [])
    case image(source: String)
    case spacer
    case systemImage(systemName: String)
    case hstack(alignment: String, spacing: CGFloat? = nil, content: [LSElement])
    case vstack(alignment: String, spacing: CGFloat? = nil, content: [LSElement])
    public var id: Self { self }
}

public enum LSAction: String, Codable {
    case sheet, fullScreenCover
}

public enum LSTargetSize: String, Codable {
    case iphone4, iphone4s,
         iphone5, iphone5s, iphone5c,
         iphone6, iphone6s, iphonese1,
         iphone7, iphone7plus, iphonese2,
         iphone8, iphone8plus, iphonese3,
         iphoneX, iphoneXS, iphoneXSmax, iphoneXR,
         iphone11, iphone11pro, iphone11promax,
         iphone12, iphone12pro, iphone12promax, iphone12mini,
         iphone13, iphone13pro, iphone13promax, iphone13mini,
         iphone14, iphone14pro, iphone14promax, iphone14mini,
         smallWidget, mediumWidget, largeWidget
}



let example = LSProject(title: "example project", author: "haren724", version: "0.1", size: .iphone14promax, content: [
    .text(content: "Hello, Haren!"),
    .text(content: "Hello, world!"),
    .image(source: "hahah"),
    .systemImage(systemName: "person.fill"),
    .hstack(alignment: "center", spacing: nil, content: [
        .text(content: "Hello, Haren!"),
        .text(content: "Hello, world!")
    ])
])
