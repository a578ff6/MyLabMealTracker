//
//  FoodTableViewController.swift
//  MyLabMealTracker
//
//  Created by 曹家瑋 on 2023/10/8.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    /// 建立Meal資訊
    var meals: [Meal] {
        // 創建食物物件
        let breakfastFood1 = Food(name: "培根", description: "香脆的豬肉培根")
        let breakfastFood2 = Food(name: "雞蛋", description: "炒蛋或煎蛋")
        let breakfastFood3 = Food(name: "吐司", description: "全麥吐司")
        
        let lunchFood1 = Food(name: "漢堡", description: "帶起司的牛肉漢堡")
        let lunchFood2 = Food(name: "薯條", description: "香脆的法式薯條")
        let lunchFood3 = Food(name: "沙拉", description: "新鮮的蔬菜沙拉")
        
        let dinnerFood1 = Food(name: "牛排", description: "烤牛肉牛排")
        let dinnerFood2 = Food(name: "馬鈴薯", description: "馬鈴薯泥")
        let dinnerFood3 = Food(name: "蔬菜", description: "蒸蔬菜")
        
        // 創建Meal物件，並分別設置它們的Food
        let breakfast = Meal(name: "早餐", food: [breakfastFood1, breakfastFood2, breakfastFood3])
        let lunch = Meal(name: "午餐", food: [lunchFood1, lunchFood2, lunchFood3])
        let dinner = Meal(name: "晚餐", food: [dinnerFood1, dinnerFood2, dinnerFood3])
        
        // 回傳一個包含三個Meal的array
        return [breakfast, lunch, dinner]
    }

    // 設置 PropertyKeys，儲存cell的重用標識符
    struct PropertyKeys {
        static let foodCell = "Food"
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 雖然在storybaord有設置id了，但還是練習用程式碼來設置
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: PropertyKeys.foodCell)
        
        // 設置cell的佈局邊距遵循螢幕的可讀寬度
        // 適用於支援多種螢幕大小和方向，確保內容在各種情況下均易於閱讀
        self.tableView.cellLayoutMarginsFollowReadableWidth = true
    }
    

    // MARK: - Table view data source

    // section數量設置
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count  // 依照Meal的數量返回section(早餐、午餐、晚餐)
    }

    // 返回特定區段（section）的行數(row)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 使用區段(section)索引來取得對應的餐點（例如：早餐、午餐、晚餐）
        let meal = meals[section]
        // 使用餐點中的食物陣列的數量來設定該區段的行數(row)
        let food = meal.food.count
        
        // 返回食物數量
        return food
    }


    // cell 內容的設置
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 使用重用標識符 “Food” 來從表格視圖的重用池中取出（dequeue）一個單元格（cell）。
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.foodCell, for: indexPath)
        
        // indexPath.section 從 meals data source 中提取出區段（section）對應的 meal 數據。
        let meal = meals[indexPath.section]
        // indexPath.row 從提取出的 meal 中獲取對應 行(row) 的 food 數據。
        let food = meal.food[indexPath.row]
        
        // 取得cell的預設內容配置對象。
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        
        // 將設定好的內容配置對象分配給cell的內容配置。
        cell.contentConfiguration = content

        return cell
    }
    
    // 配置section標題
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // 設置meal的 section
        let meal = meals[section]
        
        // 返回section標題的名稱
        return meal.name
    }

}
