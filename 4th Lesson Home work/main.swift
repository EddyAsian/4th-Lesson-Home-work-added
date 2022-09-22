

import Foundation

// разобрать числа от 1 до 1000. Выписать через запятую все числа, кратные 2, 3, 4, 5 (для каждого числа разные переменные)


var multiple2 = ""
var multiple3 = ""
var multiple4 = ""
var multiple5 = ""

for item in 1...1000 {
    if item % 2 == 0{
        multiple2 += "\(item), "   //кратные 2
    }
        if item % 3 == 0{
            multiple3 += "\(item), " //кратные 3
        }
    if item % 4 == 0{
        multiple4 += "\(item), "   //кратные 4
    }
    if item % 5 == 0{
        multiple5 += "\(item), "    //кратные 5
    }
}


print(multiple2)
print("")
print(multiple3)
print("")
print(multiple4)
print("")
print(multiple5)




//#2
// Создать программу используя известные вам методы Рассчитать сумму кредита. Изначально сумма - 1000000 сом. Процентная ставка в год - 24%. С каждым годом % снижается на 1. Рассчитать за какой срок человек сможет выплатить кредит, если на момент получения кредита его зарплата - 20000 сом и каждые 2 месяца она увеличивается на 2000





//кредит каждый раз будет уменьшаться по циклу, размер ежемесячной оплаты будет увеличиваться из за увеличения зарплаты и остаток по кредиту будет уменьшаться от 1 миллиона до 0. учитываю ежегодное уменьшение процентной ставки от 24 процентов до ...... по циклу пока не будет выполнено условие.


var credit: Float = 1000000.0 //сумма кредита изначально и остаток
var numMonth = 0              // отсчет месяца
var salary: Float = 20000.0   // начальная зарплата
var percent: Float = 24.0     //годовой процент за 1 год и уменьшается на 1 каждые 12 месяцев
var sumTotal: Float = 0.0

func oneYear () {            // считает уменьшение годового налога 1...6 так как функция создана обьединяя 2 месяца
    for _ in 1...6 {
        every2Month()
    }
    percent -= 1
}

while credit - salary != 0 {
    oneYear()
}


func every2Month () {
    if credit > salary {
        credit += credit * (percent / 1200)
        numMonth += 1
        print("За \(numMonth) месяц, оплачено-\(salary) с. Нужно погасить \(credit-salary) сомов из остатка суммы кредита-\(credit).")
        sumTotal += salary
        credit -= salary
        
    }
    if credit > salary {
        credit += credit * (percent / 1200)
        salary += 2000
        numMonth += 1
        print("За \(numMonth) месяц, оплачено-\(salary) с. Нужно погасить \(credit-salary) сомов из остатка суммы кредита-\(credit).")
        sumTotal += salary
        credit -= salary
        
    }
    if credit < salary {
        credit += credit * (percent / 1200)
        sumTotal += salary
        salary = credit
        numMonth += 1
        print("За \(numMonth) месяц, оплачено-\(salary) с. Нужно погасить \(credit-salary) сомов из остатка суммы кредита-\(credit).")
        salary = 0
        credit = 0
        print("")
        print("Был взят кредит 1000000 сомов. Вы выплатили все за ",numMonth ,"месяцев. Общая сумма составила  -", sumTotal, "сомов с учетом годовых процентов.")

    }
}

//доп
//Используя условные операторы, функции и циклы создать следующую программу: Записать в одну переменную типа String 20 разных слов (с разной длиной) через запятую.После того, как созданная ранее функция примет как аргумент созданную строку - вернет следующее (например) - “Яблоко - 6 символов \n Морковь - 7 символов” и т.д до последнего слова



var string = ""
var phrase = " Я, освобожденный, Джанго, Дым, был, дар, дан, блантом, Понтовало, нам, по, головам, клубы, дыма, man, for, you, все, свое, тебе, дарю, "
var numSymbol = 0

for phrase in phrase {
    if phrase != "," {
        numSymbol += 1
        string += String(phrase)
        
    }
    if phrase == "," {
        print("\(string) - \(numSymbol-1) символов")
        numSymbol = 0
        string = ""
        
    }
}




    //Калькулятор
//Добавить в ваш калькулятор функции нахождения cos, sin, tg, ctg,(по углу) и %

print("Функции для калькулятора")

print("Введите первое число")
var num1 = readLine()!
               
print("Какое действие с ним совершить?\nНапишите один из вариантов: \n+, -, *, /\nили sin, cos, tan, cot")

let sign = readLine()!

print("Введите второе число")

var num2 = readLine()!

 let sinD = (Double(num2)! * 4 * (180 - Double(num2)!)) / (40500 - Double(num2)! * (180 - Double(num2)!))
let cosD = ((90 - (Double(num2)!)) * 4 * (180 - (90 - Double(num2)!))) / (40500 - (90 - Double(num2)!) * (180 - (90 - Double(num2)!)))
let tanD = sinD / cosD
let cotD = cosD / sinD

calculator(num1: Double(num1)!, sign: sign, num2: Double(num2)!)

func calculator(num1: Double, sign: String, num2: Double) {
    if sign == "+" {
        print(num1, "+", num2, "=", num1 + num2)
    }else if sign == "-" {
        print(num1, "-", num2, "=", num1 - num2)
        
    }else if sign == "*" {
        print(num1, "*", num2, "=", num1 * num2)
        
    }else if sign == "/"{
        print(num1, "/", num2, "=", num1 / num2)
        
    }else if sign == "sin" {
        print(num1, "* sin", num2, "=", sinD * num1)
    }
    else if sign == "cos" {
        print(num1, "* cos", num2, "=", cosD * num1)
    }
    else if sign == "tan" {
        print(num1, "* tan", num2, "=", tanD * num1)
    }
    else if sign == "cot" {
        print(num1, "* cot", num2, "=", cotD * num1)
    }
    else {
        print("Неверно. Выберите символ из списка (+ - * / или sin, cos, tan, cot)")
    }
}
