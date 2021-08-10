//
//  ViewController.swift
//  Chess-Timer
//
//  Created by Iliya dehsarvi on 8/8/21.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		for family: String in UIFont.familyNames
		{
			print(family)
			for names: String in UIFont.fontNames(forFamilyName: family)
			{
				print("== \(names)")
			}
		}
	}
	
	
}

