// https://www.hackerrank.com/challenges/birthday-cake-candles/problem

process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

function birthdayCakeCandles(n, ar) {
    // Complete this function
    let max = -1 / 0;
    let count = 0;
    ar.forEach(el => {
        if (el === max) {
            count++;
        } else if (el > max) {
            max = el;
            count = 1;
        }
    });
    return count;
}

function main() {
    var n = parseInt(readLine());
    ar = readLine().split(' ');
    ar = ar.map(Number);
    var result = birthdayCakeCandles(n, ar);
    process.stdout.write("" + result + "\n");

}
