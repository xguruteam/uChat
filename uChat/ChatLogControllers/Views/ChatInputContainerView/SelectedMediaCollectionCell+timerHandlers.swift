//
//  SelectedMediaCollectionCell+timerHandlers.swift
//  uChat-project
//
//  Created by Luccas Beck on 5/26/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit

extension SelectedMediaCollectionCell {
  
  typealias CompletionHandler = (_ success: Bool) -> Void
  
  func runTimer() {
    playerView.timer = Timer.scheduledTimer(timeInterval: 1, target: self,  selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
  }
  
  @objc func updateTimer() {
    if playerView.seconds < 1 {
      resetTimer()
    } else {
      playerView.seconds -= 1
      playerView.timerLabel.text = timeString(time: TimeInterval(playerView.seconds))
    }
  }
  
  func resetTimer() {
    playerView.timer?.invalidate()
    playerView.seconds = playerView.startingTime
    playerView.timerLabel.text = timeString(time: TimeInterval(playerView.seconds))
    
    UIView.animate(withDuration: 0.2, animations: {
      self.playerView.alpha = 0.85
      self.playerView.backgroundColor = .black
    })
  }
  
  func timeString(time:TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
  }
}
