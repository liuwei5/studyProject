//
//  MainSwift.swift
//  StudyProject
//
//  Created by BrotherWei on 15/8/19.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

import Foundation

class MainSwift:UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.view.backgroundColor = UIColor.blueColor();
        
        self.title = "Swift";
        
        var btn = UIButton(frame:CGRect(x:20 , y:50 , width:100 , height:40));
        
        btn.setTitle("返回",forState:.Normal);
        
        btn.addTarget(self, action:"btnClick:", forControlEvents:.TouchUpInside);
        
        btn.backgroundColor = UIColor.redColor();
        
        self.view.addSubview(btn);
    }
    
    func btnClick(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
}