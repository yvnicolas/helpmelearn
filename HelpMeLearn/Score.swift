//
//  Score.swift
//  HelpMeLearn
//
//  Created by Yves NICOLAS on 29/05/2016.
//  Copyright © 2016 Yvni. All rights reserved.
//

import UIKit

class Score: UIView {
    
    // MARK: Properties
    var scoreValue : Int = 0 {
        // make sure the image is refreshed when property change
        didSet {
            self.setNeedsLayout()
        }
    }
    var scoreButtons : [UIButton] = Array<UIButton>()
    

    let scoreButtonGutter : Int = 5
    let scoreButtonNber : Int = 6
    
    // MARK: Init
    required init?(coder aDecoder: NSCoder) {
        
        
        super.init(coder: aDecoder)
        
        let filledImage = UIImage(named: "filled")
        let voidImage = UIImage(named : "void")
        
        for _ in 0..<scoreButtonNber {
            let button = UIButton()
            button.setImage(filledImage, forState: UIControlState.Selected)
            button.setImage(filledImage, forState: [UIControlState.Selected, UIControlState.Highlighted])
            button.setImage(voidImage, forState: UIControlState.Normal)
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(Score.scoreButtonPressed(_:)), forControlEvents: UIControlEvents.TouchDown)
            self.addSubview(button)
            scoreButtons += [button]
        }
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        
        let buttonSize : Int = Int(self.frame.size.height)

        return CGSize(width: buttonSize + ((scoreButtonNber-1)*(buttonSize + scoreButtonGutter)), height: buttonSize)
    }
    
    override func layoutSubviews() {
        
        let buttonSize : Int = Int(self.frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index, button) in scoreButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + scoreButtonGutter))
            button.frame = buttonFrame
        }
        
        updateScoreIcons()
    }
    
    // MARK: Score actions
    
    func scoreButtonPressed(button: UIButton) {
        
        print("button pressed : \(scoreValue)")
        scoreValue = scoreButtons.indexOf(button)! + 1
        
        // if score is changed, the didset from var will make sure there is a refresh, no need to call the update here
        //        updateScoreIcons()
    }
    
    func updateScoreIcons() {
        for (index, button) in scoreButtons.enumerate() {
            button.selected = index < scoreValue
        }
    }
}
