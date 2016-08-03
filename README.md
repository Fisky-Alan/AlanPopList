# AlanPopList
When your app have so many options to choose, AlanPopList is an alternative of UIActionSheet. 

It is with two class methods 

AlanPopListView.initWithTitle(title: "Hello World", superview: superViewInwhichPopListHasToBeAdded, options:["hi","hello"]) { (anIndex, selectedObject) in
     
        
        print("\(selectedObject as! String)")
        
        
        }
        
and with custom colour changes 

  AlanPopListView.initWithTitle(title: "Hello World", superview: superViewInwhichPopListHasToBeAdded, options: ["hi","hello"], viewbgColor: UIColor.greenColor().colorWithAlphaComponent(0.1), tblBgColr: UIColor.blackColor(), titleColor: UIColor.greenColor(), titleLineColor: UIColor.greenColor(), tblItemTextColor: UIColor.greenColor()) { (anIndex, selectedObject) in
              
              
              
                 }

