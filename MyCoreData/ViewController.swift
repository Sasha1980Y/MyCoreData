//
//  ViewController.swift
//  MyCoreData
//
//  Created by Alexander Yakovenko on 3/1/18.
//  Copyright © 2018 Alexander Yakovenko. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = CoreDataManager.instance.managedObjectContext
    
    var array: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // зробити запис до бази даних
    @IBAction func saveButton(_ sender: Any) {
        
        // Описание сущности
        let entityDescription = NSEntityDescription.entity(forEntityName: "Model", in: context)
        
        // Создание нового объекта
        let managedObject = Model(entity: entityDescription!, insertInto: context)
        
        // Установка значения атрибута
        
        // managedObject це один запис до бази даних
        
        managedObject.setValue(100, forKey: "number")
        managedObject.setValue("Sasha2", forKey: "name")
    
        // Запись объекта
        do {
            try context.save()
        } catch {
            print(error)
        }
        
    }
    // прочитати записи з бази даних
    // отримуємо результат у вигляді массиву
    
    @IBAction func readButton(_ sender: Any) {
        //array = loadQuestion()!
        array = selectQuestion()!
        
        for item in array {
            print("**************")
            print(item.name ?? "Not name")
            print(item.number)
        }
    }
    
    // отримуємо всі записи з CoreData
    func loadQuestion() -> [Model]? {
        let fetchRequest: NSFetchRequest<Model> = Model.fetchRequest()
        
        do {
            let array = try context.fetch(fetchRequest) as [Model]
            return array
        } catch let errore {
            print("error FetchRequest \(errore)")
        }
        
        return nil
    }
    
    // вибираємо записи з  name = " ім'я "  н-д: "Sasha1"
    func selectQuestion() -> [Model]? {
        let fetchRequest: NSFetchRequest<Model> = Model.fetchRequest()
        //let name = "Sasha1"
        let digit: Int16 = 45
        
        // дивитися більше в документації Apple NSFetchRequest
        
        // для чисел
        fetchRequest.predicate = NSPredicate(format: "number == %ld", digit)
        
        // для String
        //fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            let array = try context.fetch(fetchRequest) as [Model]
            return array
        } catch let errore {
            print("error FetchRequest \(errore)")
        }
        
        return nil
    }
}

