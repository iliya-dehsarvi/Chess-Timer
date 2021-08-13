//
//  ViewController.swift
//  Chess-Timer
//
//  Created by Iliya dehsarvi on 8/8/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
	@IBOutlet weak var colorsBackGroundView: UIView!
//	@IBOutlet weak var test: UIView!
	
	@IBOutlet weak var whiteSettingButton: UIButton!
	@IBOutlet weak var lightBlueSettingButton: UIButton!
	@IBOutlet weak var darkBlueSettingButton: UIButton!
	@IBOutlet weak var purpleSettingButton: UIButton!
	@IBOutlet weak var orangeSettingButton: UIButton!
	
	
	@IBOutlet weak var settingsButton: UIButton!
	@IBOutlet weak var playPauseButton: UIButton!
	@IBOutlet weak var resetButton: UIButton!
	
	@IBOutlet weak var topButtonInstance: UIButton!
	@IBOutlet weak var bottomButtonInstance: UIButton!
	
	@IBOutlet weak var bottomTimerLabel: UILabel!
	@IBOutlet weak var timerLabel: UILabel!
	
	@IBOutlet weak var topCounterLabel: UILabel!
	@IBOutlet weak var bottomCounterLabel: UILabel!
	
	@IBOutlet weak var backgroundView1: UIView!
	@IBOutlet weak var backgroundView2: UIView!
	
	var topMillieSeconds = 300
	var bottomMillieSeconds = 300

	var topCounter = 0
	var bottomCounter = 0

	var turn = 0
	
	var themeColor = UIColor.systemIndigo

	
	@IBOutlet weak var settingsBar: UIView!
	
	var timer = Timer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		colorsBackGroundView.isHidden = true

//		timer.invalidate()

//		setTimerLabel()
		
//		topCounterLabel.textColor = .black
//		test.layer.cornerRadius = 30
//		test.layer.masksToBounds = true
		
		backgroundView1.layer.cornerRadius = 30
		backgroundView1.layer.masksToBounds = true
		backgroundView1.transform = backgroundView1.transform.rotated(by: CGFloat.pi)
		topCounterLabel.transform = topCounterLabel.transform.rotated(by: CGFloat.pi)
//		test.transform = test.transform.rotated(by: CGFloat.pi)
		backgroundView2.layer.cornerRadius = 30
		backgroundView2.layer.masksToBounds = true
		
		
		
		
//		whiteSettingButton.layer.cornerRadius = 35
//		whiteSettingButton.layer.masksToBounds = true
//
//		lightBlueSettingButton.layer.cornerRadius = 35
//		lightBlueSettingButton.layer.masksToBounds = true
//
//		darkBlueSettingButton.layer.cornerRadius = 35
//		darkBlueSettingButton.layer.masksToBounds = true
//
//		purpleSettingButton.layer.cornerRadius = 35
//		purpleSettingButton.layer.masksToBounds = true
//
//		orangeSettingButton.layer.cornerRadius = 35
//		orangeSettingButton.layer.masksToBounds = true
	}
	
	override var prefersStatusBarHidden: Bool {
	    return true
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
		var millieSec: Int
		if topMillieSeconds == 0 {
			timer.invalidate()
			backgroundView1.backgroundColor = UIColor.systemPink
			timerLabel.textColor = UIColor.white

//			turn = 0
		} else if bottomMillieSeconds == 0 {
			timer.invalidate()
			backgroundView2.backgroundColor = UIColor.systemPink
			bottomTimerLabel.textColor = UIColor.white

//			turn = 0
		}
		if turn == 1 {
			millieSec = topMillieSeconds
		} else if turn == -1 {
			millieSec = bottomMillieSeconds
		} else {
			millieSec = topMillieSeconds
		}
		print(millieSec)

//		var min = "\(Int((millieSec/100)/60))"
////		if min.count == 1 {
////			min = "0\(min)"
////		}
//		var secStr: String
//		var sec = Int(round(((Double(millieSec)/100).truncatingRemainder(dividingBy: 60))*10)/10.0)
//		if sec < 10 {
//			secStr = "0\(sec)"
//		} else {
//			secStr = "\(sec)"
//		}
//		print("\(min):\(sec)")
		
		let min = "\(millieSec/60)"
		var sec = "\(millieSec%60)"
		if millieSec%60 < 10 {
			sec = "0\(sec)"
		}
		if min == "0" {
			return "\(sec)"
		} else {
			return "\(min):\(sec)"
		}
//		if min == "0" {
//			return "\(secStr)"
//		} else {
//			return "\(min):\(secStr)"
//		}
	}
	@IBAction func startButton(_ sender: UIButton) {
		if self.timer.isValid {
			self.timer.invalidate()
			if let image = UIImage(systemName: "play.circle") {
				self.playPauseButton.setImage(image, for: .normal)
			}
		} else {
			self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
			if let image = UIImage(systemName: "pause.circle") {
				self.playPauseButton.setImage(image, for: .normal)
			}
		}
	}
	@IBAction func settingsButton(_ sender: UIButton) {
		if timer.isValid {
			timer.invalidate()
//			turn = 0
		}
		UIView.animate(withDuration: 0.4,
						delay: 0,
						options: .curveEaseOut,
						animations: { [weak self] in
			self?.backgroundView1.frame.size.height = 134
			self?.backgroundView1.backgroundColor = self?.themeColor
			self?.timerLabel.frame.origin.x = 43
			self?.timerLabel.frame.origin.y = 10
			self?.timerLabel.font = self?.timerLabel.font.withSize(50)
			self?.timerLabel.textColor = .white

			self?.backgroundView2.frame.size.height = 134
			self?.backgroundView2.frame.origin.y = 816
			self?.backgroundView2.backgroundColor = self?.themeColor


			self?.bottomTimerLabel.frame.origin.x = 43
			self?.bottomTimerLabel.frame.origin.y = 10
			self?.bottomTimerLabel.font = self?.timerLabel.font.withSize(50)
			
			
//			self?.topCounterLabel.textColor = .black
			self?.timerLabel.textAlignment = .left
			self?.bottomCounterLabel.textColor = .white

//
//			self?.bottomTimerLabel.textColor = .black
			self?.bottomTimerLabel.textColor = .white
			self?.bottomTimerLabel.textAlignment = .left

			
			self?.settingsBar.isHidden = true
			

		})
		
	}
	@IBAction func resetButton(_ sender: UIButton) {
//		millieSeconds = 60000
//		setTimerLabel(millieSec: millieSeconds)
//		if self.timer.isValid {
//			self.timer.invalidate()
//		}
	}
	@IBAction func pauseButton(_ sender: UIButton) {
//		if self.timer.isValid {
//			self.timer.invalidate()
//		}
	}
	@IBAction func topButton(_ sender: UIButton) {
//		if bottomMillieSeconds == 0 {
//			timer.invalidate()
//		} else if topMillieSeconds == 0 {
//			timer.invalidate()
//		}
		if turn == 0 || self.timer.isValid == false {
			turn = 1
			self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
			self.bottomCounterLabel.textColor = UIColor.white

//			self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
//				self.update()
//				if self.topMillieSeconds == 0 {
//					self.timer.invalidate()
//				}
//
//			}
			if let image = UIImage(systemName: "pause.circle") {
				self.playPauseButton.setImage(image, for: .normal)
			}
		} else if turn == 1 {
			topCounter+=1
			topCounterLabel.text = "\(topCounter)"
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

				
//				self?.bottomCounterLabel.frame.origin.y = 303
//				self?.topCounterLabel.frame.origin.y = 550

				
				self?.settingsBar.frame.origin.y = 295
				
				self?.backgroundView2.frame.size.height = 544
				self?.backgroundView2.frame.origin.y = 383

				self?.bottomTimerLabel.frame.origin.y = 227
				self?.bottomTimerLabel.font = self?.bottomTimerLabel.font.withSize(100)

			

				

				
				self?.timerLabel.textColor = UIColor.white
				self?.backgroundView1.backgroundColor = UIColor.black
		
				self?.bottomTimerLabel.textColor = UIColor.white
				self?.backgroundView2.backgroundColor = self?.themeColor
//				self?.timerLabel.textColor = UIColor.systemGreen
//				self?.backgroundView1.backgroundColor = UIColor.black
				
				self?.timerLabel.frame.origin.x = 8
				self?.bottomTimerLabel.frame.origin.x = 8
//				self?.timerLabel.textColor = .white
//				self?.bottomCounterLabel.textColor = .white
//
//				self?.topCounterLabel.textColor = .white
//				self?.bottomTimerLabel.textColor = .white
				self?.settingsBar.isHidden = false
				
				self?.timerLabel.textAlignment = .center
				self?.bottomTimerLabel.textAlignment = .center



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
				
//				self?.bottomCounterLabel.frame.origin.y = 550
//				self?.topCounterLabel.frame.origin.y = 697

				self?.settingsBar.frame.origin.y = 542

				self?.backgroundView2.frame.size.height = 297
				self?.backgroundView2.frame.origin.y = 629
				
				self?.bottomTimerLabel.frame.origin.y = 70
				self?.bottomTimerLabel.font = self?.bottomTimerLabel.font.withSize(80)
				
				self?.timerLabel.textColor = UIColor.white
				self?.backgroundView1.backgroundColor = self?.themeColor
				
				self?.bottomTimerLabel.textColor = UIColor.white
				self?.backgroundView2.backgroundColor = UIColor.black
				
				self?.timerLabel.frame.origin.x = 8
				self?.bottomTimerLabel.frame.origin.x = 8
//				self?.timerLabel.textColor = .white
//				self?.topCounterLabel.textColor = .white
//
//				self?.bottomTimerLabel.textColor = .white
//				self?.bottomTimerLabel.textColor = .white
				self?.settingsBar.isHidden = false

				
				self?.timerLabel.textAlignment = .center
				self?.bottomTimerLabel.textAlignment = .center
			})
		}
	}
	
	@IBAction func bottomButton(_ sender: UIButton) {

		if turn == 0 || self.timer.isValid == false {
			self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
			self.bottomCounterLabel.textColor = UIColor.white
//			self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
//				self.update()
//				if self.bottomMillieSeconds == 0 {
//					self.timer.invalidate()
//				}
//
//			}

			turn = -1
			
			if let image = UIImage(systemName: "pause.circle") {
				self.playPauseButton.setImage(image, for: .normal)
			}
		} else {
			bottomCounter+=1
			bottomCounterLabel.text = "\(bottomCounter)"
		}
	}
	
	@IBAction func setWhite(_ sender: UIButton) {
		print(1)
	}
	@IBAction func setTeal(_ sender: UIButton) {
	}
	@IBAction func setIndego(_ sender: UIButton) {
	}
	@IBAction func setPurple(_ sender: UIButton) {
	}
	@IBAction func setOrange(_ sender: UIButton) {
	}
	
	
}
