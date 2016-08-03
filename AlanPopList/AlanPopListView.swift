//
//  AlanPopListView.swift
//  EnageDots_Swift
//
//  Created by Fisky on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//


/*
use class method :-
 2 methds
 
 class func initWithTitle(title aTitle: String,superview aSuperView: UIView ,options aOptions: [AnyObject], handler aHandlerBlock: ((anIndex: NSInteger,selectedObject: AnyObject) -> Void)!)->Void {
 }
 
 
  class func initWithTitle(title aTitle: String,superview aSuperView: UIView ,options aOptions: [AnyObject],viewbgColor aViewbgColor:  UIColor?,tblBgColr aTblBgColr: UIColor?,titleColor aTitleColor : UIColor?,titleLineColor aTitleLineColor:UIColor?,tblItemTextColor aTblItemTextColor:UIColor?, handler aHandlerBlock: ((anIndex: NSInteger,selectedObject: AnyObject) -> Void)!)->Void {
 }
 
*/

import UIKit

public let POPLISTVIEW_SCREENINSET = 40
public let POPLISTVIEW_HEADER_HEIGHT = 50
public let RADIUS = 5


 class AlanPopListView: UIView,UITableViewDelegate,UITableViewDataSource {
    
  internal  var tableView: UITableView!
  internal var title: String = ""
  internal  var options: [AnyObject] = []
  internal var handlerBlock:((NSInteger,AnyObject)->Void)!

    
   internal var colour_title_line:UIColor? = UIColor.greenColor()
   internal var colour_title_text:UIColor? = UIColor.greenColor()
   internal var colour_view_bg_color:UIColor? = UIColor.clearColor()
    
   internal var colour_listview_bg:UIColor? = UIColor.blackColor()
   internal var colour_listview_item_txtclr:UIColor? = UIColor.greenColor()

    
    
    
    
    
    override func drawRect(rect: CGRect) {
        
        
        let bgRect: CGRect = CGRectInset(rect, (CGFloat)(POPLISTVIEW_SCREENINSET), (CGFloat)(POPLISTVIEW_SCREENINSET))
        let titleRect: CGRect = CGRectMake((CGFloat)(POPLISTVIEW_SCREENINSET) + 10, (CGFloat)(POPLISTVIEW_SCREENINSET) + 10 + 5, rect.size.width - 2 * ((CGFloat)(POPLISTVIEW_SCREENINSET.hashValue) + 10), 30)
        let separatorRect: CGRect = CGRectMake((CGFloat)(POPLISTVIEW_SCREENINSET), (CGFloat)(POPLISTVIEW_SCREENINSET) + (CGFloat)(POPLISTVIEW_HEADER_HEIGHT) - 2, rect.size.width - 2 * (CGFloat)(POPLISTVIEW_SCREENINSET), 2)
        let ctx: CGContextRef = UIGraphicsGetCurrentContext()!
        // Draw the background with shadow
        CGContextSetShadowWithColor(ctx, CGSizeZero, 6.0, UIColor(white: 0, alpha: 0.75).CGColor)
        UIColor(white: 0, alpha: 0.75).setFill()

        let x: CGFloat = (CGFloat)(POPLISTVIEW_SCREENINSET)
        let y: CGFloat = (CGFloat)(POPLISTVIEW_SCREENINSET)
        let width: CGFloat = (CGFloat)(bgRect.size.width)
        let height: CGFloat = (CGFloat)(bgRect.size.height)
        let path: CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, x, y + (CGFloat)(RADIUS))
        CGPathAddArcToPoint(path, nil, x, y, x + (CGFloat)(RADIUS), y, (CGFloat)(RADIUS))
        CGPathAddArcToPoint(path, nil, x + width, y, x + width, y + (CGFloat)(RADIUS), (CGFloat)(RADIUS))
        CGPathAddArcToPoint(path, nil, x + width, y + height, x + width - (CGFloat)(RADIUS), y + height, (CGFloat)(RADIUS))
        CGPathAddArcToPoint(path, nil, x, y + height, x, y + height - (CGFloat)(RADIUS), (CGFloat)(RADIUS))
        CGPathCloseSubpath(path)
        CGContextAddPath(ctx, path)
        CGContextFillPath(ctx)
       // CGPathRelease(path)

        CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 0.5, colour_title_line?.CGColor)
        colour_title_line?.setFill()
        
        self.viewWithTag(10)?.removeFromSuperview()
        let lbltitle: UILabel = UILabel(frame: titleRect)
        lbltitle.tag = 10
        lbltitle.textAlignment = .Center
        lbltitle.text = title
        lbltitle.backgroundColor = UIColor.clearColor()
        lbltitle.textColor = colour_title_text
    
        self.addSubview(lbltitle)
        //    [_title drawInRect:titleRect withFont:[UIFont systemFontOfSize:16.]];
        //
        CGContextFillRect(ctx, separatorRect)

        
    }
    
    class func initWithTitle(title aTitle: String,superview aSuperView: UIView ,options aOptions: [AnyObject], handler aHandlerBlock: ((anIndex: NSInteger,selectedObject: AnyObject) -> Void)!)->Void {
        
        
        let _alanPopListView = AlanPopListView()
        
       
        _alanPopListView.initWithTitle(title: aTitle, superview: aSuperView, options: aOptions, viewbgColor: nil, tblBgColr: nil, titleColor: nil, titleLineColor: nil, tblItemTextColor: nil) { (anIndex, selectedObject) in
            
            aHandlerBlock(anIndex: anIndex,selectedObject: selectedObject)
        }
        
        
    }

    
    class func initWithTitle(title aTitle: String,superview aSuperView: UIView ,options aOptions: [AnyObject],viewbgColor aViewbgColor:  UIColor?,tblBgColr aTblBgColr: UIColor?,titleColor aTitleColor : UIColor?,titleLineColor aTitleLineColor:UIColor?,tblItemTextColor aTblItemTextColor:UIColor?, handler aHandlerBlock: ((anIndex: NSInteger,selectedObject: AnyObject) -> Void)!)->Void {
    
    
        let _alanPopList = AlanPopListView()
        
        _alanPopList.initWithTitle(title: aTitle, superview: aSuperView, options: aOptions, viewbgColor: aViewbgColor, tblBgColr: aTblBgColr, titleColor: aTitleColor, titleLineColor: aTitleLineColor, tblItemTextColor: aTblItemTextColor) { (anIndex, selectedObject) in
          
            
            
            aHandlerBlock(anIndex: anIndex,selectedObject: selectedObject)

            
            
            
        }
        
        
        
    }
     private  func initWithTitle(title aTitle: String,superview aSuperView: UIView ,options aOptions: [AnyObject],viewbgColor: UIColor?,tblBgColr : UIColor?,titleColor : UIColor?,titleLineColor:UIColor?,tblItemTextColor:UIColor?, handler aHandlerBlock: ((anIndex: NSInteger,selectedObject: AnyObject) -> Void)!)->Void {
    
        let rect: CGRect = UIScreen.mainScreen().bounds
        super.frame = rect
        
        
        
        
        
        if viewbgColor != nil {
            
            colour_view_bg_color=viewbgColor
        }
        
        if tblBgColr != nil
        {
            
            
            colour_listview_bg = tblBgColr
        }
        if titleColor != nil {
            colour_title_text = titleColor
        }
        
        if titleLineColor != nil {
            colour_title_line = titleLineColor
        }
        if tblItemTextColor != nil {
           
        }
        
        self.title = aTitle
        self.options = aOptions
        
        self.tableView = UITableView(frame:CGRectMake((CGFloat)(POPLISTVIEW_SCREENINSET), (CGFloat)(POPLISTVIEW_SCREENINSET)+(CGFloat)(POPLISTVIEW_HEADER_HEIGHT), rect.size.width-2 * (CGFloat)(POPLISTVIEW_SCREENINSET), UIDevice.currentDevice().orientation.isPortrait ? rect.size.height - 2 * (CGFloat)(POPLISTVIEW_SCREENINSET) - (CGFloat)(POPLISTVIEW_HEADER_HEIGHT) - (CGFloat)(RADIUS) : 200))
        
        
       
        
        self.backgroundColor = colour_view_bg_color
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.tableView.separatorColor = colour_listview_item_txtclr?.colorWithAlphaComponent(0.1)
        self.tableView.backgroundColor = colour_listview_bg
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.addSubview(tableView)
        
        
        self.handlerBlock = aHandlerBlock
        aSuperView .addSubview(self)
        self.fadeIn()

        
        
    }
    
    
    
   
    
  
    
    
    
   // MARK:- Tableview datasource and delegates 
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")
        if (cell == nil) {
            
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "CellIdentifier")
            cell.textLabel?.textColor = colour_listview_item_txtclr
            cell.textLabel?.numberOfLines = 0
        
            cell.backgroundColor = UIColor.clearColor()
            
        }
       
        if options[indexPath.row].isKindOfClass(NSDictionary) || options[indexPath.row].isKindOfClass(NSMutableDictionary)
        {
//            let imageString:String = options[indexPath.row].valueForKey("ndot_image") as! String
//            let titleString:String = options[indexPath.row].valueForKey("ndot_title") as! String
            
            
            cell.imageView?.image = UIImage(named: options[indexPath.row].valueForKey("ndot_image") as! String)
            cell.textLabel?.text = options[indexPath.row].valueForKey("ndot_title") as? String
            
        }
        else{
           cell.textLabel?.text = options[indexPath.row] as? String
        }
     
       
        
        return cell
        
    }
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.handlerBlock(indexPath.row,options[indexPath.row])
        self.fadeOut()
        
    }
    
    //MARK:- Animation 
    
    internal func fadeOut()->Void{
        
        UIView.animateWithDuration(0.35, animations: { 
            self.transform = CGAffineTransformMakeScale(1.3, 1.3);
            self.alpha = 0.0;
            }) { (competed) in
                
                self.removeFromSuperview()
                
        }
        
    }
    internal func fadeIn()->Void
    {
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
        UIView.animateWithDuration(0.35
            , animations: { 
                
                self.transform = CGAffineTransformMakeScale(1, 1);
                self.alpha = 1.0;
            }) { (completed) in
                
                
        }
        
    }
    
}
