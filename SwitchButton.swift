//
//  Created by SampleDemo
//  Copyright © SampleDemo All rights reserved.
//  Created on 31/07/20


import UIKit
import CoreMotion

protocol SwitchButtonDelegate: class {
    func valueChangeEvent(isOn: Bool)
}

@IBDesignable class SwitchButton: UIButton {
    
    /// By default set the true
    @IBInspectable var isOn: Bool = true {
        didSet {
            setStatus(isOn)
        }
    }
    
    /// set off status image
    @IBInspectable var offImage: UIImage? {
        didSet {
            setStatus(isOn)
        }
    }
    
    /// set on status image
    @IBInspectable var onImage: UIImage? {
        didSet {
            setStatus(isOn)
        }
    }
    
    public weak var delegate: SwitchButtonDelegate?
    
    /// Status On/Off
    private(set) var status: Bool = false {
        didSet {
            self.update()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStatus(false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Update the Button Image base on status
    private func update() {
        guard let onImage = self.onImage else { return }
        guard let offImage = self.offImage else { return }
        UIView.transition(with: self, duration: 0.50, options: .transitionCrossDissolve, animations: { [weak self] in
            guard let self = self else { return }
            self.status ? self.setImage(onImage, for: .normal) : self.setImage(offImage, for: .normal)
        }, completion: nil)
    }

    /// Toggle the value
    private func toggle() {
        status ? setStatus(false) : setStatus(true)
        delegate?.valueChangeEvent(isOn: self.status)
    }
    
    /// Set the Switch On/Off Status
    /// - Parameter status: on/off value
    public func setStatus(_ status: Bool) {
        self.status = status
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.sendHapticFeedback()
        self.toggle()
    }
    
    /// Haptic Feedback For Touch Feel
    private func sendHapticFeedback() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
}

// MARK: - SwitchButtonDelegate
extension SwitchButton: SwitchButtonDelegate {
    func valueChangeEvent(isOn: Bool) { }
}
