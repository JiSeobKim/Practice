//
//  ViewController.swift
//  Practice_Divid
//
//  Created by kimjiseob on 15/07/2019.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class ViewController: UIViewController {
    
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        guard let serverURL = Bundle.main.object(forInfoDictionaryKey: "Server URL") as? String else {
            fatalError("흐규흐규")
        }
        let btn = UIButton(type: .system)
        
        btn.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        btn.setTitle(serverURL, for: .normal)
        btn.sizeToFit()
        btn.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        
        self.view.addSubview(btn)
        btn.rx.tap.subscribe(onNext: { (_) in
            print("Tap")
        }).disposed(by: bag)
    }


}

