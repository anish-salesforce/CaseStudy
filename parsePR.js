const fs = require('fs');
const readline = require('readline');

async function extractTests() {
    // Default: run all tests
    const testsFile = __dirname + '/testsToRun.txt';
    await fs.promises.writeFile(testsFile, 'all');

    const lines = readline.createInterface({
        input: fs.createReadStream(__dirname + '/pr_body.txt'),
        crlfDelay: Infinity
    });

    for await (const line of lines) {
        // Detect pattern: Apex::[...tests...]::Apex
        if (line.includes('Apex::[') && line.includes(']::Apex')) {
            let tests = line.substring(8, line.length - 7); // Extract contents inside brackets
            let spaceSeparatedTests = tests.replace(/,/g, ' '); // Replace commas with spaces
            await fs.promises.writeFile(testsFile, spaceSeparatedTests + '\n');
        }
    }
}

extractTests();
