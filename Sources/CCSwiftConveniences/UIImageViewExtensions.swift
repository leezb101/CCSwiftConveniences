//
/**
 *------------------------------------------------------------------
 * Copyright © 2020 HeNan DtCloud Network Technology Co.,Lt d.
 * ------------------------------------------------------------------
 * 类 名: UIImageViewExtensions.swift
 * 功 能:
 * 创建者: LeeZB@___ORGANIZATIONNAME___
 * 创建时间: 2020/7/22 10:31 AM
 * 备 注:
 * ------------------------------------------------------------------
 * 修改历史
 * ------------------------------------------------------------------
 * 时间                      姓名                  备注
 * ------------------------------------------------------------------
 *
 * ------------------------------------------------------------------
 */


#if canImport(UIKit)

import UIKit

public extension UIImageView {
    
    func download(
        from url: URL,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        placeholder: UIImage? = nil,
        completionHandler: ((UIImage?) -> Void)? = nil
    ) {
        image = placeholder
        self.contentMode = contentMode
        URLSession.shared.dataTask(with: url) { (data, response, _) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data,
                let image = UIImage(data: data)
                else {
                    completionHandler?(nil)
                    return
            }
            DispatchQueue.main.async {[unowned self] in
                self.image = image
                completionHandler?(image)
            }
        }
        .resume()
    }
    
    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
        clipsToBounds = true
    }
    
    func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imageView = self
        imageView.blur(withStyle: style)
        return imageView
    }
}

#endif
