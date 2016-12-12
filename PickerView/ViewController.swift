//
//  ViewController.swift
//  PickerView
//
//  Created by iOS Developer on 12/9/16.
//  Copyright © 2016 Chantier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectButton(sender: AnyObject) {
        let pickerView = PickerViewController(pickerItem: ["Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad"], frame: view.bounds)
        pickerView.presentView(self)
//        presentViewController(pickerView, animated: true, completion: nil)
    }

}

