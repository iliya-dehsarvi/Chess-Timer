//
//  ViewController.swift
//  Chess-Timer
//
//  Created by Iliya dehsarvi on 8/8/21.
//

import UIKit
//import Charts

class ViewController: UIViewController {
	
	@IBOutlet weak var settingsMenu: UIView!
	
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
		settingsMenu.isHidden = true

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
	
	func foldBackgrounds() {
		if self.timer.isValid {
			self.timer.invalidate()
			if let image = UIImage(systemName: "play.circle") {
				self.playPauseButton.setImage(image, for: .normal)
			}
		}
		UIView.animate(withDuration: 0.4,
						delay: 0,
						options: .curveEaseOut,
						animations: { [weak self] in
			self?.backgroundView1.frame.size.height = 416
			self?.backgroundView1.frame.origin.y = 0
			self?.backgroundView1.backgroundColor = self?.themeColor
			
			self?.backgroundView2.frame.size.height = 415
			self?.backgroundView2.frame.origin.y = 511
			self?.backgroundView2.backgroundColor = self?.themeColor
			
			
		})
		
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
			self?.settingsMenu.isHidden = false

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

//			settingsMenu.isHidden = true
			topButtonInstance.isHidden = true
			bottomButtonInstance.isHidden = false

			UIView.animate(withDuration: 0.3,
							delay: 0,
							options: .curveEaseOut,
							animations: { [weak self] in

				self?.settingsMenu.isHidden = true

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
//			settingsMenu.isHidden = true
			
			topButtonInstance.isHidden = false
			bottomButtonInstance.isHidden = true

			UIView.animate(withDuration: 0.3,
							delay: 0,
							options: .curveEaseOut,
							animations: { [weak self] in

				self?.settingsMenu.isHidden = true

				
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
	

	@IBAction func setTimeTo1(_ sender: UIButton) {
		topMillieSeconds = 60
		bottomMillieSeconds = 60
		timerLabel.text = "1:00"
		bottomTimerLabel.text = "1:00"
	}
	
	@IBAction func setTimeto3(_ sender: UIButton) {
		topMillieSeconds = 180
		bottomMillieSeconds = 180
		timerLabel.text = "3:00"
		bottomTimerLabel.text = "3:00"
	}
	
	
	@IBAction func setTimeTo5(_ sender: UIButton) {
		topMillieSeconds = 300
		bottomMillieSeconds = 300
		timerLabel.text = "5:00"
		bottomTimerLabel.text = "5:00"
	}
	
	
	@IBAction func setWhite(_ sender: UIButton) {
		themeColor = .white
		
		backgroundView1.backgroundColor = themeColor
		backgroundView2.backgroundColor = themeColor
	}
	@IBAction func setTeal(_ sender: UIButton) {
		themeColor = .systemTeal
		backgroundView1.backgroundColor = themeColor
		backgroundView2.backgroundColor = themeColor
	}
	@IBAction func setIndego(_ sender: UIButton) {
		themeColor = .systemIndigo
		backgroundView1.backgroundColor = themeColor
		backgroundView2.backgroundColor = themeColor
	}
	@IBAction func setOrange(_ sender: UIButton) {
		themeColor = .systemOrange
		backgroundView1.backgroundColor = themeColor
		backgroundView2.backgroundColor = themeColor
	}
	
	
}
