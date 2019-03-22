/*:
 # Visitor Design Pattern
 
 [The visitor design pattern is a way of separating an algorithm from an object structure on which it operates. A practical result of this separation is the ability to add new operations to existent object structures without modifying the structures. It is one way to follow the open/closed principle.](https://en.wikipedia.org/wiki/Visitor_pattern)
 
 The Visitor pattern is often maligned as too complex. In fact, it allows you to separate things that change for different reasons.
 
 For example, let's say there is a list of employees and we want to create the following report of hourly employees:
 
     Emp#    Name           QTD-hours    QTD-pay
     1429    Bob Martin     432          $22,576
     1532    Romain Asnar   490          $28,776

 Using the visitor pattern will allow any changes of the format and content of a report and not change the `Employee` object.
 */
protocol Employee {
    var name: String { get }
    func accept(visitor: EmployeeVisitor)
}

struct HourlyEmployee: Employee {
    var name: String
    
    func accept(visitor: EmployeeVisitor) {
        visitor.visit(hourlyEmployee: self)
    }
}

protocol EmployeeVisitor {
    func visit(hourlyEmployee: HourlyEmployee)
}

class HoursAndPayReport: EmployeeVisitor {
    func visit(hourlyEmployee: HourlyEmployee) {
        print("Successfully generated report for \(hourlyEmployee.name).")
    }
}

var report = HoursAndPayReport()
var employees: [Employee] = [
    HourlyEmployee(name: "Bob Martin"),
    HourlyEmployee(name: "Romain Asnar"),
]

for employee in employees {
    employee.accept(visitor: report);
}
/*:
 This solves the Single Responsibility Principle by moving the report generation into a new object. Moreover, each new report will be added to a new derivative of EmployeeVisitor
 */
