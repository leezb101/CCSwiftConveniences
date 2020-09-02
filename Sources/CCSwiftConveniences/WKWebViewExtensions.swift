//
    /**
 *------------------------------------------------------------------
 * Copyright © 2020 HeNan DtCloud Network Technology Co.,Lt d.
 * ------------------------------------------------------------------
 * 类 名: WKWebViewExtensions.swift
 * 功 能:
 * 创建者: LeeZB@___ORGANIZATIONNAME___
 * 创建时间: 2020/7/28 11:28 AM
 * 备 注:
 * ------------------------------------------------------------------
 * 修改历史
 * ------------------------------------------------------------------
 * 时间                      姓名                  备注
 * ------------------------------------------------------------------
 *
 * ------------------------------------------------------------------
 */
    

#if canImport(WebKit)
import WebKit

extension WKWebView {
    @discardableResult
    public func loadURL(_ url: URL) -> WKNavigation? {
        return load(URLRequest(url: url))
    }
    
    @discardableResult
    public func loadURLString(_ urlString: String) -> WKNavigation? {
        guard let url = URL(string: urlString) else { return nil }
        return load(URLRequest(url: url))
    }
}

#endif
