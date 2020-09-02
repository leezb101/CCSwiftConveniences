//
/**
 *------------------------------------------------------------------
 * Copyright © 2020 HeNan DtCloud Network Technology Co.,Lt d.
 * ------------------------------------------------------------------
 * 类 名: URLExtensions.swift
 * 功 能:
 * 创建者: LeeZB@___ORGANIZATIONNAME___
 * 创建时间: 2020/7/20 9:44 AM
 * 备 注:
 * ------------------------------------------------------------------
 * 修改历史
 * ------------------------------------------------------------------
 * 时间                      姓名                  备注
 * ------------------------------------------------------------------
 *
 * ------------------------------------------------------------------
 */


import Foundation

#if canImport(UIKit) && canImport(AVFoundation)
import UIKit
import AVFoundation
#endif

public extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false), let queryItems = components.queryItems else { return nil }
        var items: [String: String] = [:]
        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }
        return items
    }
}

public extension URL {
    func appendingQueryParamters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + parameters.map { URLQueryItem(name: $0, value: $1) }
        return urlComponents.url!
    }
    
    mutating func appendQueryParameters(_ parameters: [String: String]) {
        self = appendingQueryParamters(parameters)
    }
    
    func queryValue(for key: String) -> String? {
        return URLComponents(string: absoluteString)?
            .queryItems?
            .first(where: { $0.name == key } )?
            .value
    }
    
    func deletingAllPathComponents() -> URL {
        var url: URL = self
        for _ in 0..<pathComponents.count - 1 {
            url.deleteLastPathComponent()
        }
        return url
    }
    
    mutating func deleteAllPathComponents() {
        for _ in 0..<pathComponents.count - 1 {
            deleteLastPathComponent()
        }
    }
    
    func droppedScheme() -> URL? {
        if let scheme = scheme {
            let droppedScheme = String(absoluteString.dropFirst(scheme.count + 3))
            return URL(string: droppedScheme)
        }
        
        guard host != nil else { return self }
        let droppedScheme = String(absoluteString.dropFirst(2))
        return URL(string: droppedScheme)
    }
}

public extension URL {
    #if os(iOS)
    func thumbnail(fromTime time: Float64 = 0) -> UIImage? {
        let imageGenerator = AVAssetImageGenerator(asset: AVAsset(url: self))
        let time = CMTimeMakeWithSeconds(time, preferredTimescale: 1)
        var actualTime = CMTimeMake(value: 0, timescale: 0)
        
        guard let cgImage = try? imageGenerator.copyCGImage(at: time, actualTime: &actualTime) else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }
    #endif
}
