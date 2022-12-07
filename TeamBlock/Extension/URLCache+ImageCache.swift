//
//  URLCache+ImageCache.swift
//  TeamBlock
//
//  Created by James Layton on 12/5/22.
//

import Foundation

extension URLCache {
    // NOTE: Use default cache sizes
    // Memory capacity: 4 megabytes (4 * 1024 * 1024 bytes)
    // Disk capacity: 20 megabytes (20 * 1024 * 1024 bytes)
    // Use below in case not enough cache size
//    static let imageCache = URLCache(memoryCapacity: 6*1024*1024, diskCapacity: 40*1024*1024)
    static let imageCache = URLCache()
}
