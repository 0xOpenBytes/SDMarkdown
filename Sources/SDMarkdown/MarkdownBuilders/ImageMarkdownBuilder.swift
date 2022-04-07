//
//  ImageMarkdownBuilder.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public extension SomeImage {
    init(
        url: String,
        width: Int? = nil,
        height: Int? = nil,
        destination: Destination? = nil
    ) {
        self.init(
            id: nil,
            url: url,
            assetName: nil,
            aspectScale: .fill,
            style: SomeStyle(width: width, height: height),
            destination: destination
        )
    }
}

extension SomeImage: MarkdownBuildable {
    private var imageHTMLMarkdown: String {
        let width = style?.width.map(String.init) ?? "100%"
        let height = style?.height.map(String.init) ?? "100%"
        
        return "<img src=\"\(url)\" width=\"\(width)\" height=\"\(height)\">"
    }
    
    public var markdown: String {
        destinationMarkdown(
            forImageMarkdown: imageHTMLMarkdown
        )
    }
    
    private func destinationMarkdown(
        forImageMarkdown imageMarkdown: String
    ) -> String {
        guard let destination = destination else {
            return imageMarkdown
        }
        
        return "<a href=\"\(destination.toID)\">\(imageMarkdown)</a>"
    }
}
