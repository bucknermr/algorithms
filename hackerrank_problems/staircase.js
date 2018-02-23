// https://www.hackerrank.com/challenges/staircase/problem

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

function staircase(n) {
    // Complete this function
    spaces = n - 1;
    hashes = 1;
    for (let i = 0; i < n; i++) {
        console.log(' '.repeat(spaces) + '#'.repeat(hashes));
        spaces--;
        hashes++;
    }
}

function main() {
    var n = parseInt(readLine());
    staircase(n);

}
