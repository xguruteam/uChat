//
//  BaseViewController.swift
//  uChat-project
//
//  Created by Guru on 5/30/19.
//  Copyright © 2019 Luccas Beck. All rights reserved.
//

import UIKit
import Toaster

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let toast  = Toast(text: "Not implemented yet", duration: Delay.short)
        ToastView.appearance().backgroundColor = UIColor(hexString: "#d1de0000")
        ToastView.appearance().textColor = .white
        toast.show()
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
