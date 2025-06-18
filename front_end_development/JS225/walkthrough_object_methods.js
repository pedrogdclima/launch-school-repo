function person(fName, lName, age) {
  return {
    fName,
    lName,
    age,
  }
}

let sam = person('Sam', 'Muller', 48);
let andrea = person('Andrea', 'Bouchard', 34);
let alex = person('Alex', 'Dias', 25);

let people = {
  collection: [],
  currentid: 0,
  fullName: function(person) {
    console.log(`${person.fName} ${person.lName}`);
  },
  rollCall: function() {
    this.collection.forEach(this.fullName);
  },
  nextid: function() {
    return this.currentid++;
  },
  add: function(...persons) {
    persons.forEach( person => {
      person.id = this.nextid();
      this.collection.push(person);
    })
  },
  getidx: function(id) {
    let idx = -1;
    for (let [i, person] of this.collection.entries()) {
      if (person.id === id) {
        idx = i;
        break;
      }
    }
    return idx;
  },
  remove: function(id) {
    let idx = this.getidx(id);
    this.collection.splice(idx, 1);
  }
}

people.add(alex, sam, andrea);

people.rollCall();

console.log(alex, sam, andrea);

people.remove(1);

people.add({fName: 'Pedro', lName: 'Lima', age: 32});

people.rollCall();

console.log(people.collection);
