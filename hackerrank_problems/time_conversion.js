// https://www.hackerrank.com/challenges/time-conversion/problem

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

function timeConversion(s) {
    // Complete this function
    const arr = s.split(":");
    arr[arr.length - 1] = arr[arr.length - 1].slice(0, 2);
    const period = s.slice(-2);

    if (period === 'AM') {
        arr[0] = arr[0] === '12' ? '00' : arr[0];
    } else {
        arr[0] = String(12 + (parseInt(arr[0]) % 12));
    }

    return arr.join(':');
}

function main() {
    var s = readLine();
    var result = timeConversion(s);
    process.stdout.write("" + result + "\n");

}
