//
//  UIOverlayView.swift
//  UIOverlayView
//
//  Created by sfh on 2025/3/31.
//

#if canImport(UIKit)

import UIKit

/// enum of BlendModes
public enum UIOverlayViewBlendMode: String, CaseIterable {
    case normalBlendMode     = "normalBlendMode"
    case darkenBlendMode     = "darkenBlendMode"
    case multiplyBlendMode   = "multiplyBlendMode"
    case colorBurnBlendMode  = "colorBurnBlendMode"
    case lightenBlendMode    = "lightenBlendMode"
    case screenBlendMode     = "screenBlendMode"
    case colorDodgeBlendMode = "colorDodgeBlendMode"
    case overlayBlendMode    = "overlayBlendMode"
    case softLightBlendMode  = "softLightBlendMode"
    case hardLightBlendMode  = "hardLightBlendMode"
    case differenceBlendMode = "differenceBlendMode"
    case exclusionBlendMode  = "exclusionBlendMode"
    case hueBlendMode        = "hueBlendMode"
    case saturationBlendMode = "saturationBlendMode" // default
    case colorBlendMode      = "colorBlendMode"
    case luminosityBlendMode = "luminosityBlendMode"
}

public final class UIOverlayView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setOverlay()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setOverlay()
    }
    
    private func setOverlay() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        self.layer.compositingFilter = UIOverlayViewBlendMode.saturationBlendMode.rawValue
    }
    
    /// Self does not accept or intercept any touch events
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return nil
    }

}

// MARK: show and hide
public extension UIOverlayView {
    
    /// set compositingFilter of layer
    /// - Parameter blendMode: case of UIOverlayViewBlendMode
    /// - Returns: Self
    func blend(mode blendMode: UIOverlayViewBlendMode) -> Self {
        self.layer.compositingFilter = blendMode.rawValue
        return self
    }
    
    /// set background color
    /// - Parameter kcolor: color
    /// - Returns: Self
    func background(color kcolor: UIColor) -> Self {
        self.backgroundColor = kcolor
        return self
    }
    
    /// add overlay
    /// - Parameter container: superView
    func overlay(in container: UIView) {
        self.frame = container.bounds
        container.addSubview(self)
    }
    
    /// remove overlay
    func remove() {
        self.removeFromSuperview()
    }
}

public extension UIOverlayView {
    
    /// show overlay
    /// - Parameters:
    ///   - container: superView of UIOverlayView
    ///   - mode: blendMode of UIOverlayView
    ///   - backColor: backgroundColor of UIOverlayView
    static func show(in container: UIView? = UIApplication.shared.windows.first(where: { $0.isKeyWindow }), mode: UIOverlayViewBlendMode = .saturationBlendMode, backColor: UIColor = .lightGray) {
        if let contain = container {
            if let exist = contain.subviews.first(where: { $0 is UIOverlayView }) {
                exist.removeFromSuperview()
            }
            UIOverlayView().blend(mode: mode).background(color: backColor).overlay(in: contain)
        }
    }
    
    /// hide overlay
    /// - Parameter container: superView of UIOverlayView
    static func hide(in container: UIView? = UIApplication.shared.windows.first(where: { $0.isKeyWindow })) {
        if let contain = container {
            if let exist = contain.subviews.first(where: { $0 is UIOverlayView }) {
                exist.removeFromSuperview()
            }
        }
    }
}

#endif
