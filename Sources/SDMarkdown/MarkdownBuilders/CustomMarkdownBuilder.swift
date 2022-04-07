//
//  CustomMarkdownBuilder.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public protocol SDCustomizedMarkdown {
    var id: String { get }
    
    func markdown(forSomeCustomView customView: SomeCustomView) -> String
}

public extension SomeCustomView {
    init(id: String, views: [SomeView]) {
        self.init(
            id: id,
            title: nil,
            subtitle: nil,
            style: nil,
            someImage: nil,
            destination: nil,
            axis: nil,
            views: views
        )
    }
    
    init(markdown: String) {
        self.init(
            id: markdown,
            title: nil,
            subtitle: nil,
            style: nil,
            someImage: nil,
            destination: nil,
            axis: nil,
            views: []
        )
    }
    
    init(_ markdown: () -> String) {
        self.init(
            id: markdown(),
            title: nil,
            subtitle: nil,
            style: nil,
            someImage: nil,
            destination: nil,
            axis: nil,
            views: []
        )
    }
}

extension SomeCustomView: MarkdownBuildable {
    static var customizedMarkdown: [String: SDCustomizedMarkdown] = [:]
    
    public var markdown: String {
        if
            let id = id,
            let customMarkdown = SomeCustomView.customizedMarkdown[id]
        {
            return customMarkdown.markdown(forSomeCustomView: self)
        } else if let customMarkdown = id {
            return customMarkdown
        }
        
        return "\(dump(self))"
    }
}
