// https://www.hackerrank.com/challenges/30-abstract-classes/problem

// Declare your class here.
class MyBook extends Book {
    constructor(title, author, price) {
        super(title, author);
        this.price = price;
    }

    display() {
        console.log(`Title: ${this.title}`);
        console.log(`Author: ${this.author}`);
        console.log(`Price: ${this.price}`);
    }
}
