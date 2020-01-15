//
//  imageViewController.swift
//  SlideshowApp
//
//  Created by 今村俊博 on 2020/01/13.
//  Copyright © 2020 toshihiro.imamura. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {
    @IBOutlet weak var extendview: UIImageView!
    
    var extendimage:UIImage! = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        extendview.image = extendimage
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
