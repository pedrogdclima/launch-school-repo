function greet(name: string):string {
  let message = 'Hello ' + name;
  console.log(message);
  return message;
}

let myObject = {
  model: 'Niro',
  year: 2025,
  make: 'Kia',
}

greet('Pedro');
greet('Torie');
console.log(myObject.model, myObject.name);
