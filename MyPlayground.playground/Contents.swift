import UIKit

//MARK: - Question 1

enum DevLevel {
    case jr
    case mid
    case sr
    
}

protocol Labor{
    var name:String {get set}
    var age:Int {get set}
    var isMarried:Bool {get set}
    var salaryFactor:Int {get set}
    var salary:Int {get}
}

class Developer:Labor{
    var name: String
    var age: Int
    var isMarried:Bool
    var experience: DevLevel
    var salaryFactor:Int
    var salary: Int {
        let ageBonus = age > 20 ? age - 20 : 0
        switch experience {
        case .jr:
            return (15) * salaryFactor
        case .mid:
            return (20 + ageBonus) * salaryFactor
        case .sr:
            return (30 + ageBonus) * salaryFactor
            
        }
    }
    
    init(name: String, age:Int, isMarried:Bool, experience: DevLevel, salaryFactor:Int) {
        self.name = name
        self.age = age
        self.isMarried = isMarried
        self.experience = experience
        self.salaryFactor = salaryFactor
    }
    
}


protocol Company{
    var name:String {get set}
    var year:Int {get set}
    var budget:Int {get}
    
    func addFunds(_ value:UInt)
    func removeFunds(_ value:UInt)
    func paySalaries()
}



class TechCompany: Company{
    var name: String
    var year: Int
    private(set) var budget: Int
    var developers: [Developer]
    var developerCount: Int {
        return developers.count
    }
    
    required init(name: String, year: Int, budget: Int) {
        self.name = name
        self.year = year
        self.budget = budget
        self.developers = []
    }
    
    //MARK: - Personel Functions
    func hireDeveloper(dev:Developer){
        developers.append(dev)
    }
    
    // fires a random developer
    func elonMode(){
        guard developerCount > 0 else {
            return
        }
        let luckyNumber = Int.random(in: 0..<developerCount)
        developers.remove(at: luckyNumber)
    }
    
    //MARK: - Accounting Functions
    
    func addFunds(_ value:UInt){
        self.budget += Int(value)
    }
    func removeFunds(_ value:UInt){
        self.budget -= Int(value)
    }
    
    func paySalaries(){
        for i in developers{
            budget -= i.salary
        }
    }
    
}


var dev1 = Developer(name: "KEREM", age: 20, isMarried: false, experience: .jr, salaryFactor: 1000)
var dev2 = Developer(name: "KEREM", age: 20, isMarried: false, experience: .jr, salaryFactor: 1000)

var company1 = TechCompany(name: "Tekno", year: 2000, budget: 80000)

company1.developerCount

company1.hireDeveloper(dev: dev1)

company1.developerCount

company1.budget

var value = 25000

company1.addFunds(UInt(value))
company1.budget
company1.paySalaries()
company1.budget

dev1 === dev2

//MARK: - Question 2

class Zoo:Company{
    var name: String
    var year: Int
    var budget: Int
    var water: Int
    var animalSitters: [AnimalSitter]
    var animalSitterCount: Int{
        return animalSitters.count
    }
    
    func addAnimalSitter(person:AnimalSitter){
        animalSitters.append(person)
    }
    
    func addFunds(_ value:UInt){
        self.budget += Int(value)
    }
    func removeFunds(_ value:UInt){
        self.budget -= Int(value)
    }
    
    func paySalaries() {
        for i in animalSitters{
            self.budget -= i.salary
        }
    }
    func useWater(){
        for i in animalSitters{
            self.water -= i.waterConsumption
        }
    }
    
    init(name:String,year:Int,budget:Int,water:Int) {
        self.name = name
        self.year = year
        self.budget = budget
        self.water = water
        self.animalSitters = []
    }

}

class AnimalSitter:Labor{
    var name: String
    var age: Int
    var isMarried: Bool
    var salaryFactor: Int
    var salary: Int{
        return salaryFactor
    }
    var waterConsumption:Int{
        var water = 0
        for i in animals{
            water += i.waterConsumption
        }
        return water
    }
    
    var animals: [Animal]
    var animalCount:Int {
        return animals.count
    }
    
    init(name:String, age:Int, isMarried:Bool, salaryFactor:Int) {
        self.name = name
        self.age = age
        self.isMarried = isMarried
        self.salaryFactor = salaryFactor
        self.animals = []
    }
    
    func addAnimal(animal: Animal){
        if (animal.owner == nil){
            animals.append(animal)
            animals[animalCount-1].owner = self
        }
        else{
            print("this animal have owner")
        }
    }
        
}


protocol Animal{
    var waterConsumption:Int {get}
    var owner:AnimalSitter? {get set}
    func doSound()
}

class Cat:Animal{
    var owner: AnimalSitter?
    var waterConsumption:Int = 1
    func doSound() {
        print("meow")
    }
    
}

class Dog:Animal{
    var owner: AnimalSitter?
    var waterConsumption:Int = 2
    func doSound() {
        print("bark")
    }
    
}


var zoo1 = Zoo(name: "Zooland", year: 2000, budget: 150000, water: 1000)

var as1 = AnimalSitter(name: "safa", age: 23, isMarried: false, salaryFactor: 1500)

zoo1.addAnimalSitter(person:as1)

var cat1 = Cat()
var cat2 = Cat()
var dog1 = Dog()


as1.addAnimal(animal: cat1)
as1.addAnimal(animal: dog1)

as1.addAnimal(animal: cat1)



