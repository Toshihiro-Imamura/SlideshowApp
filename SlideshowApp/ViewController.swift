//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 今村俊博 on 2020/01/13.
//  Copyright © 2020 toshihiro.imamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var beforImage: UIButton!
    @IBOutlet weak var playstop: UIButton!
    @IBOutlet weak var slideshowview: UIImageView!
    
    
    
    var timer : Timer!
    var timer_sec: Int = 0
    
    var images : [UIImage]! = [UIImage(named: "o7032948562b330007db013237cc6cff0_4620693218500365463_200114_0053.jpg")!,
                               UIImage(named: "o7032948562b330007db013237cc6cff0_4620693218500365463_200114_0066.jpg")!,
                               UIImage(named: "o7032948562b330007db013237cc6cff0_4620693218500365463_200114_0189.jpg")!,
                               UIImage(named: "o7032948562b330007db013237cc6cff0_4620693218500365463_200114_0192.jpg")!,
                               UIImage(named: "o7032948562b330007db013237cc6cff0_4620693218500365463_200114_0209.jpg")!]
    
    var imagenumber : Int = 0
    
    var playstopindex = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slideshowview.image = images[imagenumber]
        playstop.setTitle("再生", for:.normal)
        
    }
    @objc func updateimage(_ timer: Timer){
        if imagenumber < 4{
            imagenumber += 1
        }else{
            imagenumber = 0
        }
        slideshowview.image = images[imagenumber]
    }
    
    @IBAction func nextimage(_ sender: Any) {
        if imagenumber < 4{
            imagenumber += 1
        }else{
            imagenumber = 0
        }
        slideshowview.image = images[imagenumber]
    }
    
    @IBAction func beforeimage(_ sender: Any) {
        if imagenumber > 0{
            imagenumber -= 1
        }else {
            imagenumber = 4
        }
        slideshowview.image = images[imagenumber]
    }
    
    @IBAction func playstop(_ sender: Any) {
        
        if playstopindex{
            beforImage.isHidden = true
            nextImage.isHidden = true
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateimage(_:)), userInfo: nil, repeats: true)
            playstopindex = false
            playstop.setTitle("停止", for:.normal)
        }else{
            beforImage.isHidden = false
            nextImage.isHidden = false
            self.timer.invalidate()
            playstopindex = true
            playstop.setTitle("再生", for:.normal)
            
        }
        
        
    }
    override func prepare( for segue: UIStoryboardSegue, sender: Any?){
        let imageviewcontroller: imageViewController = segue.destination as! imageViewController
        imageviewcontroller.extendimage = slideshowview.image
        beforImage.isHidden = false
        nextImage.isHidden = false
        self.timer.invalidate()
        playstopindex = true
        playstop.setTitle("再生", for:.normal)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}



