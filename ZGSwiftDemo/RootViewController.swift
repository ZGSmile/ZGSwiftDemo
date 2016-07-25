//
//  RootViewController.swift
//  ZGSwiftDemo
//
//  Created by mac_zhu on 16/7/21.
//  Copyright © 2016年 mac_zhu. All rights reserved.
//

import UIKit

class RootViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate
{
    var tableView   : UITableView?
    var items       : NSArray?
    
    override func viewDidLoad() {
        
        self.title = "Swift"
        
        self.items = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl",
            "UISwitch", "UITextField", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView","UIProgressView", "UITextView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView", "UICollectionView"]
        
        self.tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
    }
    // UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.items?.objectAtIndex(indexPath.row) as! String!
        
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailViewController = DetailViewController()
        detailViewController.title = self.items?.objectAtIndex(indexPath.row)  as! String!
        self.navigationController!.pushViewController(detailViewController, animated:true)
    }
    
    //
    override func didReceiveMemoryWarning()
    {}
}
