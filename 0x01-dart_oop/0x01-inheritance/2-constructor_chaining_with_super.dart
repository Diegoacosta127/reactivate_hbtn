class Employee {
  String name = '';
  int id = 0;

  Employee(this.name, this.id);
}

class Manager extends Employee {
  String department = '';
  Manager(super.name, super.id, this.department);
}

void main() {
  Manager mgr = Manager('Alice', 1001, 'HR');
  print('${mgr.name}, ID: ${mgr.id}, Dept: ${mgr.department}');
}
