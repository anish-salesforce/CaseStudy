const fs = require('fs');
const readline = require('readline');

async function extractTests() {
    const testsFile = __dirname + '/testsToRun.txt';
    await fs.promises.writeFile(testsFile, 'all');

    const lines = readline.createInterface({
        input: fs.createReadStream(__dirname + '/pr_body.txt'),
        crlfDelay: Infinity
    });

    for await (const line of lines) {
        const match = line.match(/Apex::\[(.*?)\]::Apex/);
        if (match && match[1]) {
            const spaceSeparatedTests = match[1].replace(/,/g, ' ');
            await fs.promises.writeFile(testsFile, spaceSeparatedTests + '\n');
        }
    }
}

extractTests();
