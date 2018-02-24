# https://www.hackerrank.com/challenges/30-abstract-classes/problem

'use strict';

var _input = '';
var _index = 0;
process.stdin.on('data', (data) => { _input += data; });
process.stdin.on('end', () => {
    _input = _input.split(new RegExp('\n'));
    main();
});
function readLine() { return _input[_index++]; }

/**** Ignore above this line. ****/

class Book {
    constructor(title, author) {
        if (this.constructor === Book) {
            throw new TypeError('Do not attempt to directly instantiate an abstract class.');
        }
        else {
            this.title = title;
            this.author = author;
        }
    }

    display() {
        console.log('Implement the \'display\' method!')
    }
}
