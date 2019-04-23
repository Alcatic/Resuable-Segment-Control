//
//  RoundedSegmentControl.swift
//  Resuable_segmentControl
//
//  Created by Chad-Michael Muirhead on 4/22/19.
//  Copyright © 2019 Chad-Michael Muirhead. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedSegmentControl: UIControl {
    //custom variable added to mimmic segmentcontrol.selectedsegmentIndex
    var selectedSegmentIndex = 0

    var selector : UIView!
    var buttons = [UIButton]()
//    override func draw(_ rect: CGRect) {
//       //layer.cornerRadius = layer.frame.height / 2
//    }
    
    @IBInspectable
    var selectorBackgroundColor: UIColor = .lightGray{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .white{
        didSet{
            updateView()
        }
    }
    
   @IBInspectable
    var commaSeparatedButtonTitles :  String = ""{
    
    didSet{
        updateView()
    }
    
    }
    
    
    
    @IBInspectable
    var myCornerRadius : CGFloat = 1  {
        didSet{
            
            layer.cornerRadius = myCornerRadius
        }
    }
    
    @IBInspectable
    var myBorderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = myBorderWidth
        }
    }
    
    @IBInspectable
    var myBorderColor: UIColor = .clear{
        
        didSet{
            layer.borderColor = myBorderColor.cgColor
        }
    }
    
    @IBInspectable
    var buttonTitleColor: UIColor = UIColor.clear {
        didSet{
            
            updateView()
        }
    }
    

}


//Adding buttons and their titles
extension RoundedSegmentControl{
    
    @objc func addButtonActions(button: UIButton){
        
        for (buttonIndex, btn) in buttons.enumerated(){
            btn .setTitleColor(selectorTextColor, for: .normal)
            
            if btn == button{
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    
                    self.selector.frame.origin.x = selectorStartPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        
        sendActions(for: .valueChanged)
    }
    
    func updateView(){
        buttons.removeAll()
        subviews.forEach { (eachView) in
            eachView.removeFromSuperview()
        }
        
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for title in buttonTitles{
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(buttonTitleColor, for: .normal)
            button.addTarget(self, action: #selector(addButtonActions(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height / 2
        selector.backgroundColor = selectorBackgroundColor
        addSubview(selector)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
    }
}
