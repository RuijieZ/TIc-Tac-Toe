//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ruijie Zhang on 2015-08-20.
//  Copyright (c) 2015 Ruijie Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var boardStatus = [0,0,0,0,0,0,0,0,0]
    
    var winner = 0
    
    var gameActive = true
    
    @IBOutlet var winningLabel: UILabel!
    
    @IBOutlet var restartButton: UIButton!
    
    
    @IBAction func restartButtonClicked(sender: AnyObject) {
        
        boardStatus = [0,0,0,0,0,0,0,0,0]
        
        winner = 0
        
        activePlayer = 1
        
        gameActive = true
        
        winningLabel.hidden = true
        
        restartButton.hidden = true
        
        winningLabel.center = CGPointMake(winningLabel.center.x - 500, winningLabel.center.y)
        
        restartButton.center = CGPointMake(restartButton.center.x - 500, restartButton.center.y)

        var button: UIButton
        
        for (var tag = 0; tag <= 8; tag++)
        {
            
            button = view.viewWithTag(tag) as! UIButton
            button.setImage(nil, forState:.Normal)
            
        }
        
    }
    
    
    var winningCombo = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]  // all winning combinations
    
    func ifThereIsWinner() -> Bool
    {
        for var i = 0; i < 8; ++i
        {
            var indexList = winningCombo[i]
            var firstStatus = boardStatus[indexList[0]]
            var secondStatus = boardStatus[indexList[1]]
            var thirdStatus = boardStatus[indexList[2]]
            if firstStatus != 0 && secondStatus == firstStatus && secondStatus == thirdStatus
            {
                winner = firstStatus
                return true
            }
        }
        return false
    }
    
    

    
    
    var activePlayer = 1  // indicates whose turn it is
    
    
    
    @IBAction func button1Clicked(sender: AnyObject) {
        
        if (gameActive == false)
        {
            return
        }
        
        var tag = sender.tag!
        
        if (boardStatus[tag] == 0 && activePlayer == 1 )
        {
           boardStatus[tag] = 1
           var image = UIImage(named: "nought.png")
           sender.setImage(image, forState: .Normal)
           activePlayer = 2
        }
        else if (boardStatus[tag] == 0 && activePlayer == 2 )
        {
            boardStatus[tag] = 2
            var image = UIImage(named: "cross.png")
            sender.setImage(image, forState: .Normal)
            activePlayer = 1
        }
        else
        {
            
        }
        
        if (ifThereIsWinner())
        {
            gameActive = false
            winningLabel.hidden = false
            restartButton.hidden = false
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.winningLabel.center = CGPointMake(self.winningLabel.center.x + 500, self.winningLabel.center.y)
                self.restartButton.center = CGPointMake(self.restartButton.center.x + 500, self.restartButton.center.y)
            })
            
            if winner == 1
            {
                winningLabel.text = "Nought has won"
            }
            else if winner == 2
            {
                winningLabel.text = "Cross has won"
            }
            else
            {
                // do nothing
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winningLabel.hidden = true
        
        restartButton.hidden = true
        
        winningLabel.center = CGPointMake(winningLabel.center.x - 500, winningLabel.center.y)
        
        restartButton.center = CGPointMake(restartButton.center.x - 500, restartButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

