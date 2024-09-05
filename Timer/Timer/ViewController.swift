//
//  ViewController.swift
//  Timer
//
//  Created by hyejeong im on 9/5/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
    var number = 0

    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: UI
    func configureUI() {
        number = 0
        mainLabel.text = "시간을 설정하세요"
        slider.value = 0.5
    }
    
    // MARK: @IBAction
    // 슬라이더 값 변경
    // -- UI 업데이트
    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(sender.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    // 타이머 시작
    @IBAction func startTimer(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    // 타이머 실행동작
    @objc func timerAction() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number) 초"
        } else {
            timer?.invalidate()
            AudioServicesPlaySystemSound(SystemSoundID(1000))
            configureUI()
        }
    }
    
    // 타이머 취소
    @IBAction func cancelTimer(_ sender: UIButton) {
        timer?.invalidate()
        configureUI()
    }
}


