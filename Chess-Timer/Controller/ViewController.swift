//
//  ViewController.swift
//  Chess-Timer
//
//  Created by Iliya dehsarvi on 8/8/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
	
	@IBOutlet weak var timerLabel: UILabel!
	
	@IBOutlet weak var backgroundView1: UIView!
	var millieSeconds = 120000
	
	var timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(update), userInfo: nil, repeats: true)
	override func viewDidLoad() {
		super.viewDidLoad()
		timer.invalidate()
		setTimerLabel(millieSec: millieSeconds)
		
		backgroundView1.layer.cornerRadius = 30
		backgroundView1.layer.masksToBounds = true
		backgroundView1.transform = backgroundView1.transform.rotated(by: CGFloat.pi)
	}
	
	@objc func update() {
		setTimerLabel(millieSec: millieSeconds)
		millieSeconds -= 1
	}
	
	private func setTimerLabel(millieSec: Int) {
		print(millieSeconds)
		if millieSeconds == 0 {
			self.timer.invalidate()
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
		timerLabel.text = "\(min):\(secStr)"
	}
	
	@IBAction func startButton(_ sender: UIButton) {
		self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
	}
	
	@IBAction func resetButton(_ sender: UIButton) {
		millieSeconds = 60000
		setTimerLabel(millieSec: millieSeconds)
		if self.timer.isValid {
			self.timer.invalidate()
		}
	}
	@IBAction func pauseButton(_ sender: UIButton) {
		if self.timer.isValid {
			self.timer.invalidate()
		}
	}
}
