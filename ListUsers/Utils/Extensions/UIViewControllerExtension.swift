//
//  UIViewControllerExtension.swift
//  ListUsers
//
//  Created by Juan Eduardo Montiel Dominguez on 01/12/23.
//

import UIKit

extension UIViewController {
    var loader: UIAlertController {
        let alert = UIAlertController(title: nil, message: NSLocalizedString("msgLoading", comment: ""), preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(activityIndicator)
        let xConstraint = NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0)
        let yConstraint = NSLayoutConstraint(item: activityIndicator, attribute: .centerY, relatedBy: .equal, toItem: alert.view, attribute: .centerY, multiplier: 1.4, constant: 0)
        NSLayoutConstraint.activate([xConstraint, yConstraint])
        activityIndicator.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 80)
        alert.view.addConstraint(height)
        return alert
    }
    
    func showLoader() {
        present(self.loader, animated: true, completion: nil)
    }
    
    func hideLoader() {
        var alert = presentedViewController
        if alert != nil && (alert is UIAlertController) {
            self.dismiss(animated: true, completion: nil)
        }
    }
        
    func showMessageDialog(title: String, message: String, okHandler: ((UIAlertAction) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alertViewController.addAction(UIAlertAction(title: NSLocalizedString("acceptButton", comment: ""), style: UIAlertAction.Style.default, handler: okHandler))
            if cancelHandler != nil {
                alertViewController.addAction(UIAlertAction(title: NSLocalizedString("cancelButton", comment: ""), style: UIAlertAction.Style.default, handler: cancelHandler))
            }
            self.present(alertViewController, animated: true, completion: nil)
        }
    }
}
