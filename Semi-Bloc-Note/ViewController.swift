//
//  ViewController.swift
//  Semi-Bloc-Note
//
//  Created by Paul Colombier on 05/02/2020.
//  Copyright © 2020 Paul Colombier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func onTouchedButton(_ sender: UIButton) {
        textView.text = textView.text + "\n" + inputText.text!
        UserDefaults.standard.set(textView.text, forKey: "textView")
        inputText.text = ""
    }
    
    @IBAction func resetTextView(_ sender: UIButton) {
        textView.text = ""
        UserDefaults.standard.set(textView.text, forKey: "textView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        textView.text = UserDefaults.standard.string(forKey: "textView")
        // Do any additional setup after loading the view.
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


}

