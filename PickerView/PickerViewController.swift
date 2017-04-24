//
//  PickerViewController.swift
//  PickerView
//
//  Created by iOS Developer on 12/9/16.
//  Copyright © 2016 Chantier. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    
    var pickerViewItems: [String]?
    var doneButtonClick:((_ selectedIndex: Int)->Void)!
    var selectedIndex: Int = 0
    
    init(pickerItem:[String], frame:CGRect) {
        super.init(nibName: "PickerViewController", bundle: nil)
        view.frame = frame
        pickerViewItems = pickerItem
    }
    
    func presentView(_ parentViewController: UIViewController) {
        setAnimation()
        parentViewController.addChildViewController(self)
        parentViewController.view.addSubview(self.view)
        parentViewController.view.bringSubview(toFront: self.view)
        self.didMove(toParentViewController: parentViewController)
    }
    
    func setAnimation() {
        // Create a CATransition animation
        let slideInFromBottomTransition = CATransition()
        slideInFromBottomTransition.type = kCATransitionPush
        slideInFromBottomTransition.subtype = kCATransitionFromTop
        slideInFromBottomTransition.duration = 0.25
        slideInFromBottomTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromBottomTransition.fillMode = kCAFillModeRemoved
        self.containerView.layer.add(slideInFromBottomTransition, forKey: "slideInFromBottomTransition")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func doneButtonClicked(_ sender: AnyObject) {
        closePickerView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapInView(_ sender: AnyObject) {
        closePickerView()
    }
    
    fileprivate func closePickerView() {
        UIView.animate(withDuration: 0.35,
                                   delay: 0,
                                   usingSpringWithDamping: 1,
                                   initialSpringVelocity: 0.5,
                                   options: .curveEaseOut,
                                   animations: {
                                    self.containerView.frame = CGRect(x: self.containerView.frame.origin.x, y:self.view.frame.size.height + self.containerView.frame.size.height , width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
        }) { (finished) in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        }
    }
}

extension PickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let item = pickerViewItems {
            return item.count
        }
        return 0
    }
}

extension PickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let item = pickerViewItems {
            return item[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
}
