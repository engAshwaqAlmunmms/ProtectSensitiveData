//
//  WidgetContainer.swift
//  ProtectData
//
//  Created by Dev.SHooooooQ on 04/03/1446 AH.
//

import Foundation

struct WidgetText: Codable {
    
    let data: String
    let size: Int
    let style: String
    let name: String
    let hOffset: Int
    let vOffset: Int
    let alignment: String
    let onMouseUp: String
    
    enum CodingKeys: String, CodingKey {
        case data, size, style, name, hOffset, vOffset, alignment, onMouseUp
    }
    
    init(data: String, size: Int, style: String, name: String, hOffset: Int, vOffset: Int, alignment: String, onMouseUp: String) {
        self.data = data
        self.size = size
        self.style = style
        self.name = name
        self.hOffset = hOffset
        self.vOffset = vOffset
        self.alignment = alignment
        self.onMouseUp = onMouseUp
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(size, forKey: .size)
        try container.encode(style, forKey: .style)
        try container.encode(name, forKey: .name)
        try container.encode(hOffset, forKey: .hOffset)
        try container.encode(vOffset, forKey: .vOffset)
        try container.encode(alignment, forKey: .alignment)
        try container.encode(onMouseUp, forKey: .onMouseUp)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(String.self, forKey: .data)
        size = try container.decode(Int.self, forKey: .size)
        style = try container.decode(String.self, forKey: .style)
        name = try container.decode(String.self, forKey: .name)
        hOffset = try container.decode(Int.self, forKey: .hOffset)
        vOffset = try container.decode(Int.self, forKey: .vOffset)
        alignment = try container.decode(String.self, forKey: .alignment)
        onMouseUp = try container.decode(String.self, forKey: .onMouseUp)
    }
}
