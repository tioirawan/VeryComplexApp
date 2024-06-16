//
//  Extensions.swift
//  VeryComplexApp
//
//  Created by Tio Irawan on 16/06/24.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data: Data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
