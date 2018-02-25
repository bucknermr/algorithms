// https://www.hackerrank.com/challenges/mini-max-sum/problem

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

function miniMaxSum(arr) {
    // Complete this function
    const total_sum = arr.reduce((acc, n) => acc + n, 0);
    let min = 1 / 0
    let max = -1 / 0
    arr.forEach(n => {
        const sum = total_sum - n;
        if (sum < min) { min = sum; }
        if (sum > max) { max = sum; }
    });
    console.log(`${min} ${max}`);
}

function main() {
    arr = readLine().split(' ');
    arr = arr.map(Number);
    miniMaxSum(arr);

}
