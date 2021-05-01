//
//  ViewController.swift
//  Spinner轉盤
//
//  Created by ROSE on 2021/5/1.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wheelImageView: wheelImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: Any) {
        wheelImageView.rotateGradually { resule in
            let alertContoller = UIAlertController(title: "你轉到了\(resule)區塊", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確認", style: .cancel, handler: nil)
            alertContoller.addAction(okAction)
            self.present(alertContoller,animated: true)
            
        }
    }
    
}

