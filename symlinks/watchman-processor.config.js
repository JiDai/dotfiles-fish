/**
 * Configuration file for watchman-processor (built on top of Watchman to watch and sync files over rsync)
 * https://www.npmjs.com/package/watchman-processor
 *
 * Usage :
 * - Put this file in your home folder
 * - Run watchman-processor:
 * $ watchman-processor
 *
 * If you want to see verbosity and active watchman-processor debug mode, add DEBUG env flag
 * $ DEBUG=1 watchman-processor
 *
 * Edit `ignoredFolders` to exclude folders
 * Edit `subscriptions` list to add a sync folder. On a subscription you can:
 * - Set a `name`
 * - Set `active` to true/false to enable/disable sync
 * - Change `source` and `destination` folder for rsync
 * - Eventually exclude folders and watch rules
 */


/**
 * List all files and folder you dont' want to watch and sync
 */
const ignoredFolders = [
    '*.log',
    '.eggs/',
    '.git/',
    '.env',
    'dist/',
    'build/',

    // Cache files
    '*.pyc',
    '.cache/',
    '.webassets-cache/',
    '__pycache__/',

    // Vendors
    'apps/*/.venv/',
    'node_modules/',

    // Static files
    'MALegacy/vendor/',
    'MALegacy/static/css/*.css',
    'MALegacy/static/css/versions',
    'MALegacy/config/config.jordid.inc',
    'MALegacy/static/js/*.js',
    'MALegacy/static/js/versions',
    'mypro/static/mypro/',
    'pdfapi/static/css',

    // App build version
    'VERSION',
];

/**
 * Iterate over a list to generate Watchman ignore rules
 * @param {String} filesList List of file paths
 * @returns {[]} Watchman rules
 * @see Watchman file query expresion: https://facebook.github.io/watchman/docs/file-query.html
 */
function getUnwatchExpression(filesList) {
    return ['allof',
        ['type', 'f'],
        ...filesList.map(file => {
            // is dir ?
            if (/\/$/.test(file)) {
                return ['not', ['match', `**/${file}**`, 'wholename']];
            } else {
                return ['not', ['match', `**/${file}`, 'wholename']];
            }
        }),
    ];
}

const subscriptions = [
    {
        active: true,
        name: "ma",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        // source folder to sync:q
        //
        source: "/Users/jordid/MAWork/MeilleursAgents/",
        // destination to sync, could be local or server location.  Any supported rsync location.
        destination: "jordid@jordid:meilleursagents/",
        // Watchman file query expresion: https://facebook.github.io/watchman/docs/file-query.html
        // Default: ['allof', ['type', 'f']]
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: false,
        name: "ma ssr",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        // source folder to sync:q
        //make
        source: "/Users/jordid/MAWork/MeilleursAgents/",
        // destination to sync, could be local or server location.  Any supported rsync location.
        destination: "ssr@ssr:meilleursagents/",
        // Watchman file query expresion: https://facebook.github.io/watchman/docs/file-query.html
        // Default: ['allof', ['type', 'f']]
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: false,
        name: "ma-apiclients",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/MAWork/MA-ApiClients/",
        destination: "jordid@jordid:MA-ApiClients/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: false,
        name: "ma-www",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/GitHome/ma-www/",
        destination: "jordid@jordid:node-www/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: false,
        name: "ma-www ssr",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/GitHome/ma-www/",
        destination: "ssr@ssr:ma-www/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: false,
        name: "ma-www jsons",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/GitHome/ma-www-jsons/",
        destination: "ssr@ssr:ma-www-jsons/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: false,
        name: "sprint-viewer",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/GitHome/sprint-viewer/",
        destination: "jordid@jordid:sprint-viewer/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: true,
        name: "dotfiles_fish",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/dotfiles-fish/",
        destination: "jordid@jordid:dotfiles-fish/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: false,
        name: "jinja-common",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/MAWork/JinjaCommon/",
        destination: "jordid@jordid:JinjaCommon/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: true,
        name: "testcase-finder",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/GitHome/testcase-finder/",
        destination: "jordid@jordid:testcase-finder/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
    {
        active: true,
        name: "gifmeme",
        type: "rsync", // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: "/Users/jordid/GitHome/gifmeme/",
        destination: "sw:gifmeme/",
        watchExpression: getUnwatchExpression(ignoredFolders),
        // relative paths to ignore from watchman and rsync
        ignoreFolders: ignoredFolders,
    },
];

const subscriptionsConfig = {};

// Filter active subscriptions
subscriptions.forEach(subscription => {
    if (subscription.active) {
        subscriptionsConfig[subscription.name] = subscription;
    }
});

module.exports = {
    debug: process.env.DEBUG || false, // changes the output to show debug information, cmd and stdout output
    emoji: true, // if your terminal window can support emojis
    rsyncCmd: 'rsync', // default: 'rsync' -- override to whatever rsync command is installed or located
    subscriptions: subscriptionsConfig,
};
