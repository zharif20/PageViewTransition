//
//  RootPageViewController.swift
//  ViewTransition
//
//  Created by Local on 09/09/2018.
//  Copyright © 2018 Local. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var viewControllerList: [UIViewController] = {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController1 = mainStoryboard.instantiateViewController(withIdentifier: "RedVC")
        let viewController2 = mainStoryboard.instantiateViewController(withIdentifier: "BlueVC")
        let viewController3 = mainStoryboard.instantiateViewController(withIdentifier: "YellowVC")
        
        return [viewController1, viewController2, viewController3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self

        // Do any additional setup after loading the view.
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllerList.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard viewControllerList.count > previousIndex else { return nil }
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControlledIndex = viewControllerList.index(of: viewController) else { return nil }
        let afterIndex = viewControlledIndex + 1
        guard afterIndex != viewControllerList.count else { return nil }
        guard viewControllerList.count > afterIndex else { return nil }
        
        return viewControllerList[afterIndex]
    }
    

}
