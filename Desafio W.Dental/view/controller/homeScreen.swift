//
//  homeScreen.swift
//  Desafio W.Dental
//
//  Created by Hugo Pinheiro on 23/09/21.
//

import UIKit

class homeScrren: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    
   
    @IBOutlet weak var viewCarteirinha: UIView!
    @IBOutlet weak var viewAgenda: UIView!
    @IBOutlet weak var viewPagamento: UIView!
    @IBOutlet weak var viewRede: UIView!
    
    
    @IBOutlet weak var pagerControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style View
        view1.layer.cornerRadius = 4
        view1.layer.shadowColor = UIColor.black.cgColor
        view1.layer.shadowOffset = CGSize(width: 0, height: 0)
        view1.layer.shadowOpacity = 0.12
        view1.layer.shadowRadius = 4.0
        
        view2.layer.cornerRadius = 4
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowOffset = CGSize(width: 0, height: 0)
        view2.layer.shadowOpacity = 0.12
        view2.layer.shadowRadius = 4.0
        
        view3.layer.cornerRadius = 4
        view3.layer.shadowColor = UIColor.black.cgColor
        view3.layer.shadowOffset = CGSize(width: 0, height: 0)
        view3.layer.shadowOpacity = 0.12
        view3.layer.shadowRadius = 4.0
        
        
        // View Style
        viewCarteirinha.layer.cornerRadius = 4
        viewCarteirinha.layer.shadowColor = UIColor.black.cgColor
        viewCarteirinha.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewCarteirinha.layer.shadowOpacity = 0.12
        viewCarteirinha.layer.shadowRadius = 4.0
        
        viewAgenda.layer.cornerRadius = 4
        viewAgenda.layer.shadowColor = UIColor.black.cgColor
        viewAgenda.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewAgenda.layer.shadowOpacity = 0.12
        viewAgenda.layer.shadowRadius = 4.0
        
        viewPagamento.layer.cornerRadius = 4
        viewPagamento.layer.shadowColor = UIColor.black.cgColor
        viewPagamento.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewPagamento.layer.shadowOpacity = 0.12
        viewPagamento.layer.shadowRadius = 4.0
        
        viewRede.layer.cornerRadius = 4
        viewRede.layer.shadowColor = UIColor.black.cgColor
        viewRede.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewRede.layer.shadowOpacity = 0.12
        viewRede.layer.shadowRadius = 4.0
        
    }
    
    @IBAction func pageControl(_ sender: UIPageControl) {
        
        if pagerControl.currentPage == 0 {
                  view1.isHidden = false
                  view2.isHidden = true
                  view3.isHidden = true
              }else if pagerControl.currentPage == 1{
                  view1.isHidden = true
                  view2.isHidden = false
                  view3.isHidden = true
              }else {
                  view1.isHidden = true
                  view2.isHidden = true
                  view3.isHidden = false
              }
    }
    
}


