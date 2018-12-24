//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//
//OGHISHAN@YAHOO.COM
//123456
import UIKit

//enum LeftMenu: Int {
//    case Orders = 0
//    case Messages
//    case Inventory
//    case POS
//    case Settings
//    case Help
//}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: Int)
}
class LeftViewController : UIViewController, LeftMenuProtocol {
    
    
    @IBOutlet weak var imgCompanyLogo: UIImageView!
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblCrat: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var vwmain:UIView!
    var menus = ["Orders","Messages","Inventory","POS","Settings","Help","Logout"]
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["Orders","Messages","Inventory","POS","Settings","Help","Logout"]
    
    var itemsPic = ["leftmenu-icon-order", "leftmenu-icon-messages","leftmenu-icon-inventory","leftmenu-icon-pos", "leftmenu-icon-settings","leftmenu-icon-logout","leftmenu-icon-logout","left-menu-icon-help", ]
    
    var activeOrdersViewController: UIViewController!
    var deliveredOrdersViewController: UIViewController!
    var cancelledOrdersViewController: UIViewController!
    var allOrdersViewController:UIViewController!
    var createItemViewController: UIViewController!
    var productListViewController: UIViewController!
    var orderViewController: UIViewController!
    var messageViewController: UIViewController!
    var inventoryViewController: UIViewController!
    var posViewController:UIViewController!
    var settingViewController:UIViewController!
    var helpViewController: UIViewController!
    var rootViewController:UIViewController!
    
    var last_selected_section = Int()
    var imageHeaderView: ImageHeaderView!
    var menusections = [ExpandableMenuModel]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let screenSize = UIScreen.main.bounds
    var screenWidth:CGFloat!
    var screenHeight:CGFloat!
    var ypos:Double!
    var hyte:Double!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        last_selected_section = -1
         screenWidth = screenSize.width
         screenHeight = screenSize.height
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        let nibName1 = UINib(nibName: "MenuTVCell", bundle:nil)
        tableView.register(nibName1, forCellReuseIdentifier: "MenuTVCell")
        let nibName2 = UINib(nibName: "ExpandableHeaderTVCell", bundle:nil)
        tableView.register(nibName2, forCellReuseIdentifier: "ExpandableHeaderTVCell")
        
        
        self.imgCompanyLogo.layer.cornerRadius = self.imgCompanyLogo.frame.size.width / 2
        self.imgCompanyLogo.clipsToBounds = true
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let order = ExpandableMenuModel(sectionImage: #imageLiteral(resourceName: "leftmenu-icon-order"), category_name: "Orders", subcategories: ["Active Orders","Delivered Orders","Cancelled Orders","All Orders"], noofitems: [appDelegate.activeOrdersCount,appDelegate.deliveredOrdersCount,appDelegate.cancelledOrdersCount,appDelegate.allOrdersCount], isExpanded: false)
        let message = ExpandableMenuModel(sectionImage: #imageLiteral(resourceName: "leftmenu-icon-messages"), category_name: "Messages", subcategories: [], noofitems: [], isExpanded: false)
        let inventory = ExpandableMenuModel(sectionImage: #imageLiteral(resourceName: "leftmenu-icon-inventory"), category_name: "Inventory", subcategories: ["Create Item","Product List"], noofitems: ["",appDelegate.allProductsCount], isExpanded: false)
        let pos = ExpandableMenuModel(sectionImage: #imageLiteral(resourceName: "leftmenu-icon-pos"), category_name: "POS", subcategories: [], noofitems: [], isExpanded: false)
        let settings = ExpandableMenuModel(sectionImage: #imageLiteral(resourceName: "leftmenu-icon-settings"), category_name: "Settings", subcategories: [], noofitems: [], isExpanded: false)
        let help = ExpandableMenuModel(sectionImage: #imageLiteral(resourceName: "leftmenu-icon-help2x"), category_name: "Help", subcategories: [], noofitems: [], isExpanded: false)
        let logout = ExpandableMenuModel(sectionImage: #imageLiteral(resourceName: "leftmenu-icon-logout"), category_name: "Logout", subcategories: [], noofitems: [], isExpanded: false)
        menusections = [order,message,inventory,pos,settings,help,logout]

    //    print("check table position1--",tableView.frame.origin.y)
       // tableView.frame = CGRect(x: 0, y: 212, width: screenWidth, height: (screenHeight-315))
     //   tableView.frame = CGRect(x: 0, y: 312, width: screenWidth, height: tableView.frame.size.height)
     //   print("check table position2--",tableView.frame.origin.y)
        
        if appDelegate.company_name != ""{
            
           let name = appDelegate.company_name
           lblName.text = name
            tableView.reloadData()
        }
        if appDelegate.company_logo != ""{
            
            let profile_image = URL(string: (appDelegate.company_logo))
            self.imgCompanyLogo.sd_setImage(with: profile_image)
        }
        
        let activeOrders = ActiveOrderViewController()
        self.activeOrdersViewController = UINavigationController(rootViewController: activeOrders)
        
        let deliveredOrders = DeliveredOrdersViewController()
        self.deliveredOrdersViewController = UINavigationController(rootViewController: deliveredOrders)
        
        let cancelledOrders = CancelledOrdersViewController()
        self.cancelledOrdersViewController = UINavigationController(rootViewController: cancelledOrders)
        
        let allOrders = AllOrdersViewController()
        self.allOrdersViewController = UINavigationController(rootViewController: allOrders)
        
        /*let homeView:UIViewController = CreateItemViewController()
        self.inventoryViewController = UINavigationController(rootViewController: homeView)*/
        
        let messageView = MessagesViewController()
        self.messageViewController = UINavigationController(rootViewController: messageView)
        
        let createItem = CreateItemViewController()
        self.createItemViewController = UINavigationController(rootViewController: createItem)
        
        let productList = ProductListViewController()
        
        self.productListViewController = UINavigationController(rootViewController: productList)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let posView = sb.instantiateViewController(withIdentifier: "POSViewController") as! POSViewController
        
        self.posViewController = UINavigationController(rootViewController: posView)
        
        let settingView =  SettingsViewController()
        self.settingViewController = UINavigationController(rootViewController: settingView)
        
        let helpView = HelpViewController()
        self.helpViewController = UINavigationController(rootViewController: helpView)
        
        
        //  For logout
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.rootViewController = UINavigationController(rootViewController: rootController)
        
        
        tableView.reloadData()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)  ritwik
        self.view.layoutIfNeeded()
    }
    func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
       if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
            closeLeft()
        }
    }
    
    func changeViewController(_ menu: Int) {
        
        print("menu---",menu)
        switch menu {
        case 0:
            self.slideMenuController()?.changeMainViewController(self.orderViewController, close: true)
        case 1:
            self.slideMenuController()?.changeMainViewController(self.messageViewController, close: true)
        case 2:
            self.slideMenuController()?.changeMainViewController(self.inventoryViewController, close: true)
        case 3:
            self.slideMenuController()?.changeMainViewController(self.posViewController, close: true)
        case 4:
            self.slideMenuController()?.changeMainViewController(self.settingViewController, close: true)
        case 5:
            self.slideMenuController()?.changeMainViewController(self.helpViewController, close: true)
        case 6:
            
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey:"company_id")
            defaults.removeObject(forKey:"company_user_id")
            defaults.removeObject(forKey:"user_type")
            defaults.removeObject(forKey:"company_currency")
            defaults.removeObject(forKey:"logo")
            defaults.removeObject(forKey:"name")
            defaults.removeObject(forKey:"linkEmail")
            defaults.removeObject(forKey:"linkFName")
            defaults.removeObject(forKey:"linkLName")
            defaults.removeObject(forKey:"linkUserId")
            defaults.removeObject(forKey:"linkDiscount")
            defaults.synchronize()
            
            
            self.slideMenuController()?.changeMainViewController(self.rootViewController, close: true)
        default:
            self.slideMenuController()?.changeMainViewController(self.orderViewController, close: true)
        }
    }
    
    func changeVCbyRowValue(row : Int , section : Int)
    {
        if section == 0 {
            switch row {
            case 0:
                self.slideMenuController()?.changeMainViewController(self.activeOrdersViewController, close: true)
            case 1:
                self.slideMenuController()?.changeMainViewController(self.deliveredOrdersViewController, close: true)
            case 2:
                self.slideMenuController()?.changeMainViewController(self.cancelledOrdersViewController, close: true)
               
            case 3:
                self.slideMenuController()?.changeMainViewController(self.allOrdersViewController, close: true)
                
//                Alert.disPlayAlertMessage(titleMessage: "Alert", alertMsg: "This section under development")
            default:
                self.slideMenuController()?.changeMainViewController(self.activeOrdersViewController, close: true)
            }
        }
        else if section == 2 {
            switch row {
            case 0:
                self.slideMenuController()?.changeMainViewController(self.createItemViewController, close: true)
            case 1:
                self.slideMenuController()?.changeMainViewController(self.productListViewController, close: true)
                
                
                
            default:
                self.slideMenuController()?.changeMainViewController(self.activeOrdersViewController, close: true)
            }
        }
    }
    
    func changeVCbySectionvalue(_ section: Int)
    {
        print("menu---",section)
        switch section {
        case 1:
            self.slideMenuController()?.changeMainViewController(self.messageViewController, close: true)
        case 3:
            self.slideMenuController()?.changeMainViewController(self.posViewController, close: true)
        case 4:
            self.slideMenuController()?.changeMainViewController(self.settingViewController, close: true)
        case 5:
            self.slideMenuController()?.changeMainViewController(self.helpViewController, close: true)
            
        case 6:
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey:"company_id")
            defaults.removeObject(forKey:"company_user_id")
            defaults.removeObject(forKey:"user_type")
            defaults.removeObject(forKey:"company_currency")
            defaults.removeObject(forKey:"name")
            defaults.removeObject(forKey:"linkEmail")
            defaults.removeObject(forKey:"linkFName")
            defaults.removeObject(forKey:"linkLName")
            defaults.removeObject(forKey:"linkUserId")
            defaults.removeObject(forKey:"linkDiscount")
            defaults.synchronize()
            self.slideMenuController()?.changeMainViewController(self.rootViewController, close: true)
        default:
            self.slideMenuController()?.changeMainViewController(self.activeOrdersViewController, close: true)
        }
    }
    
    @objc func btnExpandOutlet(sender : UIButton){
        let section = sender.tag
        menusections[section].isExpanded = !menusections[section].isExpanded
        if menusections[section].isExpanded{
            if menusections[section].subcategories.count > 0{
                expandeCell(section: section)
            }else{
                self.changeVCbySectionvalue(section)
            }
        }
        else{
            if menusections[section].subcategories.count > 0{
                collapeseCell(section: section)
            }
        }
        if ((last_selected_section != section) && (last_selected_section != -1) && (menusections[last_selected_section].isExpanded)){
            print("last_selected_section   \(last_selected_section)")
            menusections[last_selected_section].isExpanded = false
            if menusections[last_selected_section].subcategories.count > 1{
                collapeseCell(section: last_selected_section)
            }
        }
        
        last_selected_section = section
       
    }
    
    func expandeCell(section : Int)
    {
        var indexpaths = [IndexPath]()
        for i in 0...(menusections[section].subcategories.count) - 1
        {
            let indexpath = IndexPath(row: i, section: section)
            indexpaths.append(indexpath)
        }
        
        tableView.insertRows(at: indexpaths, with: UITableViewRowAnimation.fade)
        tableView.reloadData()
    }
    func collapeseCell(section : Int)
    {
        var indexpaths = [IndexPath]()
        for i in 0...(menusections[section].subcategories.count) - 1
        {
            let indexpath = IndexPath(row: i, section: section)
            indexpaths.append(indexpath)
        }
        
        tableView.deleteRows(at: indexpaths, with: UITableViewRowAnimation.fade)
        tableView.reloadData()
    }
    
}


extension LeftViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       /* if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .home, .order, .message,.pos,.settings:
                return BaseTableViewCell.height()
            }
        }
        return 0*/
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        changeVCbyRowValue(row: indexPath.row, section: indexPath.section)
        
//        if let menu = LeftMenu(rawValue: indexPath.row) {
//            self.changeViewController(menu)
//        }
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if menusections[section].isExpanded{
            return (menusections[section].subcategories.count)
        }
        else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menusections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "ExpandableHeaderTVCell") as! ExpandableHeaderTVCell
        header.lblSectionName.text = menusections[section].category_name
        if menusections[section].isExpanded{
            header.imgvwExpansionIndicator.image = #imageLiteral(resourceName: "leftmenu-arrow-down")
        }
        else{
            header.imgvwExpansionIndicator.image = #imageLiteral(resourceName: "leftmenu-arrow-right")
        }
        if menusections[section].subcategories.count > 0 {
            header.imgvwExpansionIndicator.isHidden = false
        }
        else{
            header.imgvwExpansionIndicator.isHidden = true
        }
        header.imgvwSctionImage.image = menusections[section].sectionImage
        header.btnExpandOutlet.tag = section
        header.btnExpandOutlet.addTarget(self, action: #selector(btnExpandOutlet(sender:)), for: UIControlEvents.touchUpInside)
        return header
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVCell", for: indexPath) as! MenuTVCell
        cell.lblSubcategoriesCount.text = menusections[indexPath.section].noofitems[indexPath.row]
        cell.lblSubcategoriesName.text = menusections[indexPath.section].subcategories[indexPath.row]
        return cell
       /* if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .home, .order,.message,.pos,.settings:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()*/
    }
}

