//
//  ViewController.swift
//  UIPageViewController
//
//  Created by 比留間龍三 on 2020/08/23.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstView: UIStoryboard = UIStoryboard(name: "FirstView", bundle: nil)
        let firstViewController = firstView.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController

        let secondView: UIStoryboard = UIStoryboard(name: "SecondView", bundle: nil)
        let secondViewController = secondView.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

        let thirdView: UIStoryboard = UIStoryboard(name: "ThirdView", bundle: nil)
        let thirdViewController = thirdView.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController

        controllers = [firstViewController, secondViewController, thirdViewController]
        setViewControllers([controllers[0]], direction: .forward,animated: false, completion: nil)
        self.dataSource = self
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    
    /// 右にスワイプ（戻る）した場合のメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if let index = controllers.firstIndex(of: viewController),
            index > 0 {
            return controllers[index-1]
        } else {
            return nil
        }
    }
    
    /// 左にスワイプ（進む）した場合のメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if let index = controllers.firstIndex(of: viewController),
            index < controllers.count-1 {
            return controllers[index+1]
        } else {
            return nil
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
}
