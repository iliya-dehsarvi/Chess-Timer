//
//  ViewController.swift
//  Chess-Timer
//
//  Created by Iliya dehsarvi on 8/8/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
	
	@IBOutlet weak var topButtonInstance: UIButton!
	@IBOutlet weak var bottomButtonInstance: UIButton!
	
	@IBOutlet weak var bottomTimerLabel: UILabel!
	@IBOutlet weak var timerLabel: UILabel!
	
	@IBOutlet weak var backgroundView1: UIView!
	@IBOutlet weak var backgroundView2: UIView!
	var topMillieSeconds = 60000
	var bottomMillieSeconds = 60000

	var turn = 0
	
	@IBOutlet weak var settingsBar: UIView!
	
	var timer = Timer()
	override func viewDidLoad() {
		super.viewDidLoad()
		timer.invalidate()
		
//		timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(update), userInfo: nil, repeats: true)
		
		
		setTimerLabel()
		
		backgroundView1.layer.cornerRadius = 30
		backgroundView1.layer.masksToBounds = true
		backgroundView1.transform = backgroundView1.transform.rotated(by: CGFloat.pi)
		
		backgroundView2.layer.cornerRadius = 30
		backgroundView2.layer.masksToBounds = true
	}
	
	@objc func update() {
		if turn == 1 {
			timerLabel.text = setTimerLabel()

			topMillieSeconds -= 1
		} else if turn == -1 {
			bottomTimerLabel.text = setTimerLabel()

			bottomMillieSeconds -= 1
		}
	}
	
	private func setTimerLabel() -> String {
		var millieSec = 0
		if turn == 1 {
			millieSec = topMillieSeconds
		} else if turn == -1 {
			millieSec = bottomMillieSeconds
		} else {
			millieSec = 60000
		}
		
		if millieSec == 0 {
			timer.invalidate()
		}
		var min = "\(Int((millieSec/1000)/60))"
//		if min.count == 1 {
//			min = "0\(min)"
//		}
		var secStr: String
		var sec = round(((Double(millieSec)/100).truncatingRemainder(dividingBy: 60))*10)/10.0
		if sec < 10 {
			secStr = "0\(sec)"
		} else {
			secStr = "\(sec)"
		}
//		print("\(min):\(sec)")
		if min == "0" {
			return "\(secStr)"
		} else {
			return "\(min):\(secStr)"
		}
	}
	
	@IBAction func startButton(_ sender: UIButton) {
		self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
	}
	
	@IBAction func resetButton(_ sender: UIButton) {
//		millieSeconds = 60000
//		setTimerLabel(millieSec: millieSeconds)
//		if self.timer.isValid {
//			self.timer.invalidate()
//		}
	}
	@IBAction func pauseButton(_ sender: UIButton) {
		if self.timer.isValid {
			self.timer.invalidate()
		}
	}
	
	
	@IBAction func topButton(_ sender: UIButton) {
		if turn == 0 {
			self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
			turn = 1
		}
		if turn == 1 {
//			self.timer.invalidate()
			turn = -1
			topButtonInstance.isHidden = true
			bottomButtonInstance.isHidden = false

			UIView.animate(withDuration: 0.3,
							delay: 0,
							options: .curveEaseOut,
							animations: { [weak self] in

				
				self?.backgroundView1.frame.size.height = 297
				self?.timerLabel.frame.origin.y = 70
				self?.timerLabel.font = self?.timerLabel.font.withSize(80)
				
				self?.settingsBar.frame.origin.y = 295
				
				self?.backgroundView2.frame.size.height = 544
				self?.backgroundView2.frame.origin.y = 383

				self?.bottomTimerLabel.frame.origin.y = 227
				self?.bottomTimerLabel.font = self?.bottomTimerLabel.font.withSize(100)
			

				

				
				self?.timerLabel.textColor = UIColor.systemGreen
				self?.backgroundView1.backgroundColor = UIColor.black
		
				self?.bottomTimerLabel.textColor = UIColor.black
				self?.backgroundView2.backgroundColor = UIColor.systemGreen
//				self?.timerLabel.textColor = UIColor.systemGreen
//				self?.backgroundView1.backgroundColor = UIColor.black
			})
			
			
			
		} else if turn == -1 {
			turn = 1
			topButtonInstance.isHidden = false
			bottomButtonInstance.isHidden = true

			UIView.animate(withDuration: 0.3,
							delay: 0,
							options: .curveEaseOut,
							animations: { [weak self] in

				
				self?.backgroundView1.frame.size.height = 544
				self?.timerLabel.frame.origin.y = 227
				self?.timerLabel.font = self?.timerLabel.font.withSize(100)

				self?.settingsBar.frame.origin.y = 542

				self?.backgroundView2.frame.size.height = 297
				self?.backgroundView2.frame.origin.y = 629
				
				self?.bottomTimerLabel.frame.origin.y = 70
				self?.bottomTimerLabel.font = self?.bottomTimerLabel.font.withSize(80)
				
				self?.timerLabel.textColor = UIColor.black
				self?.backgroundView1.backgroundColor = UIColor.systemGreen
				
				self?.bottomTimerLabel.textColor = UIColor.systemGreen
				self?.backgroundView2.backgroundColor = UIColor.black


			})
		}
	}
	@IBAction func bottomButton(_ sender: UIButton) {
		if turn == 0 {
			self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
			turn = -1
		}
		
	}
	
}
