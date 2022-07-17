//
//  UIApplication+Ext.swift
//  heart_UI
//
//  Created by Hasegawa Akito on 2022/07/17.
//

import UIKit

extension UIApplication {
    static func viewSize() -> CGSize? {
        guard let keyWindow = shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first else {
                return nil
        }
        
        guard let rootViewController = keyWindow.rootViewController else {
            return nil
        }
        
        guard let view = rootViewController.view else {
            return nil
        }
        
        return view.frame.size
    }
}
