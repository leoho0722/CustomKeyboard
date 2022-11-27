//
//  MainViewController.swift
//  CustomKeyboard
//
//  Created by Leo Ho on 2022/11/25.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var textFields: [UITextField]!
    
    var keyboardView = Keyboard()
    
    var code: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        keyboardView = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: (view.frame.height) / 2.5))
        keyboardView.delegate = self
        
        for txf in textFields {
            if txf.isKind(of: UITextField.self) {
                let txfObject = txf as UITextField
                txfObject.inputView = keyboardView
                txfObject.delegate = self
            }
        }
        
//        textFields[0].isUserInteractionEnabled = true
//        textFields[1].isUserInteractionEnabled = false
//        textFields[2].isUserInteractionEnabled = false
//        textFields[3].isUserInteractionEnabled = false
//        textFields[4].isUserInteractionEnabled = false
//        textFields[5].isUserInteractionEnabled = false
        
        textFields[0].becomeFirstResponder()
    }
}

extension MainViewController: KeyboardDelegate {
    
    func numKeyTapped(number: Int) {
        
        code = ""
        
        if textFields[0].isEditing {
            textFields[0].text = "\(number)"
            
//            textFields[0].isUserInteractionEnabled = false
//            textFields[1].isUserInteractionEnabled = true
            
            textFields[1].becomeFirstResponder()
        } else if textFields[1].isEditing {
            textFields[1].text = "\(number)"
            
//            textFields[1].isUserInteractionEnabled = false
//            textFields[2].isUserInteractionEnabled = true
            
            textFields[2].becomeFirstResponder()
        } else if textFields[2].isEditing {
            textFields[2].text = "\(number)"
            
//            textFields[2].isUserInteractionEnabled = false
//            textFields[3].isUserInteractionEnabled = true
            
            textFields[3].becomeFirstResponder()
        } else if textFields[3].isEditing {
            textFields[3].text = "\(number)"
            
//            textFields[3].isUserInteractionEnabled = false
//            textFields[4].isUserInteractionEnabled = true
            
            textFields[4].becomeFirstResponder()
        } else if textFields[4].isEditing {
            textFields[4].text = "\(number)"
            
//            textFields[4].isUserInteractionEnabled = false
//            textFields[5].isUserInteractionEnabled = true
            
            textFields[5].becomeFirstResponder()
        } else if textFields[5].isEditing {
            textFields[5].text = "\(number)"
            
            textFields[0].isUserInteractionEnabled = false
            textFields[1].isUserInteractionEnabled = false
            textFields[2].isUserInteractionEnabled = false
            textFields[3].isUserInteractionEnabled = false
            textFields[4].isUserInteractionEnabled = false
            textFields[5].isUserInteractionEnabled = false
            
            textFields[5].resignFirstResponder()
            
            if !textFields[5].isFirstResponder {
                for i in textFields {
                    code += i.text ?? ""
                }
                print(code)
            }
        }
    }
    
    func deleteKeyTapped() {
        if textFields[5].isEditing && textFields[5].text?.count == 1 {
            textFields[5].text = ""
            textFields[4].becomeFirstResponder()
        } else if textFields[4].isEditing && textFields[4].text?.count == 1 {
            textFields[4].text = ""
            textFields[3].becomeFirstResponder()
        } else if textFields[3].isEditing && textFields[3].text?.count == 1 {
            textFields[3].text = ""
            textFields[2].becomeFirstResponder()
        } else if textFields[2].isEditing && textFields[2].text?.count == 1 {
            textFields[2].text = ""
            textFields[1].becomeFirstResponder()
        } else if textFields[1].isEditing && textFields[1].text?.count == 1 {
            textFields[1].text = ""
            textFields[0].becomeFirstResponder()
        } else if textFields[0].isEditing && textFields[0].text?.count == 1 {
            textFields[0].text = ""
            textFields[0].resignFirstResponder()
        }
    }
    
    func doneBtnTapped() {
        for i in textFields {
            code += i.text ?? ""
        }
        print(code)
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 1
    }
}
