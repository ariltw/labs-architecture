//
//  Alert.swift
//  Gamy
//
//  Created by Ariel on 12/11/20.
//

import UIKit

open class Alert: UIAlertController {
    
    static func showBasicDialog(on vc: UIViewController, with title: String, message: String, completion task: @escaping (() -> Void) = {}) {
        Alert.Builder()
            .withTitle(title)
            .withMessage(message)
            .preferredStyle(.alert)
            .addAction("OK", style: .default, handler: { (action) in
                task()
            })
            .show(in: vc, animated: true, completion: nil)
    }
    
    static func showErrorDialog(on vc: UIViewController, with error: BaseError, completion task: @escaping (() -> Void) = {}) {
        let message = error.rawValue, title = "Error"
        
        Alert.Builder()
            .withTitle(title)
            .withMessage(message)
            .preferredStyle(.alert)
            .addAction("OK", style: .default, handler: { (action) in
                task()
            })
            .show(in: vc)
    }
}

// MARK: - Alert Builder Pattern Class

extension Alert {
    class Builder {
        private var preferredStyle: UIAlertController.Style = .alert
        private var title: String? = nil
        private var message: String? = nil
        private var actions: [UIAlertAction] = [UIAlertAction]()
        private var popoverSourceView: UIView? = nil
        private var sourceRect: CGRect? = nil
        
        init() {
            
        }
        
        func preferredStyle(_ style: UIAlertController.Style) -> Builder {
            self.preferredStyle = style
            return self
        }
        
        func withTitle(_ title: String?) -> Builder {
            self.title = title
            return self
        }
        
        func withMessage(_ message: String?) -> Builder {
            self.message = message
            return self
        }
        
        func withPopoverSourceView(_ view: UIView?) -> Builder {
            self.popoverSourceView = view
            return self
        }
        
        func withSourceRect(_ rect:CGRect?) -> Builder {
            self.sourceRect = rect
            return self
        }
        
        func addAction(_ title: String, style: UIAlertAction.Style, handler:((UIAlertAction) -> Void)?) -> Builder {
            let action = UIAlertAction(title: NSLocalizedString(title, comment: ""), style: style, handler: handler)
            actions.append(action)
            return self
        }
        
        func show(in viewController:UIViewController, animated:Bool = true, completion:(() -> Void)? = nil) {
            viewController.present(build(), animated: animated, completion: completion)
        }
        
        private func build() -> UIAlertController {
            let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: self.preferredStyle)
            if let popoverSourceView = self.popoverSourceView {
                alert.popoverPresentationController?.sourceView = popoverSourceView
            }
            if let sourceRect = self.sourceRect {
                alert.popoverPresentationController?.sourceRect = sourceRect
            }
            actions.forEach { (action) in
                alert.addAction(action)
            }
            return alert
        }
    }
}
