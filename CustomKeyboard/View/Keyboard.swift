//
//  Keyboard.swift
//  CustomKeyboard
//
//  Created by Leo Ho on 2022/11/25.
//

import UIKit

class Keyboard: UIView {
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var doneItem: UIBarButtonItem!
    
    weak var delegate: KeyboardDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addXibView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addXibView()
    }
    
    func addXibView() {
        let xibFileName = "Keyboard" // xib extention not included
        
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)?[0] as! UIView
        
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    @IBAction func numKeyTapped(_ sender: UIButton) {
        delegate?.numKeyTapped(number: sender.tag)
    }
    
    @IBAction func deleteKeyTapped(_ sender: UIButton) {
        delegate?.deleteKeyTapped()
    }
    
    @IBAction func doneBtnTapped(_ sender: UIBarButtonItem) {
        delegate?.doneBtnTapped()
    }
}

protocol KeyboardDelegate: AnyObject {
    
    func numKeyTapped(number: Int)
    
    func deleteKeyTapped()
    
    func doneBtnTapped()
}

/**
 
 https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E6%95%99%E5%AE%A4/swift-create-a-custom-keyboard-in-your-app-%E5%9C%A8%E4%BD%A0%E7%9A%84-app-%E4%B8%AD%E8%87%AA%E5%AE%9A%E7%BE%A9%E9%8D%B5%E7%9B%A4-f58eb55cc963
 
 */
