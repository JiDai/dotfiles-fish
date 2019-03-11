var path = require('path');
var child_process = require('child_process');

var notSyncedFolders = [
    'node_modules',
    '.git',
    'VERSION',
    '.cache',
    '*.pyc',
    '__pycache__',
    '.webassets-cache',
    'vendors',
    'MALegacy/vendor',
    'build',
    'mypro/static/mypro',
    'apps/www/www/frontend/site/src/js/flask-routes.js'
]

var notWatchedFolders = [
    ['not', ['dirname', '.git']],
    ['not', ['dirname', '.idea']],
    ['not', ['match', '**/node_modules/**', 'wholename']],
    ['not', ['match', '**/apps/vendors/**', 'wholename']],
    ['not', ['match', '**/MALegacy/vendor/**', 'wholename']],
    ['not', ['match', '**/.cache/**', 'wholename']],
    ['not', ['match', '**/.webassets-cache/**', 'wholename']],
    ['not', ['match', '**/bower_components/**', 'wholename']],
    ['not', ['match', '**/mypro/static/mypro/**', 'wholename']],
    //['not', ['match', '**/build/**', 'wholename']],
    ['not', ['match', 'VERSION']],
    ['not', ['match', '*.pyc']],
    ['not', ['match', '__pycache__']],
    ['not', ['match', 'apps/www/www/frontend/site/src/js/flask-routes.js']],
];

var subscriptions = [
    {
        active: false,
        name: 'ma',
        type: 'rsync',      // set the subscription to rsync files from a 'source' folder to 'destination' folder

        // source folder to sync
        source: '/Users/jordid/MAWork/MeilleursAgents/',

        // destination to sync, could be local or server location.  Any supported rsync location.
        destination: 'jordid@dev.meilleursagents.org:meilleursagents/',

        // Watchman file query expresion: https://facebook.github.io/watchman/docs/file-query.html
        // Default: ['allof', ['type', 'f']]
        watchExpression: ["allof",
            ['type', 'f'],
            // ["anyof",
            //     ["not", ["dirname", "apps/MyPro/mypro/static/mypro"]],
            //     ["match", "apps/MyPro/mypro/static/mypro/config.js", "wholename"],
            // ],
            // ["anyof",
            //     ["not", ["dirname", "apps/www/www/static/build/estima"]],
            //     ["match", "apps/www/www/static/build/estima/config.js", "wholename"],
            // ],
            ["not", ["match", "apps/*/vendors/**", "wholename"]],

        ].concat(notWatchedFolders),

        // relative paths to ignore from watchman and rsync
        ignoreFolders: notSyncedFolders
    },
    {
        active: true,
        name: 'deploy_api_dev',
        type: 'rsync',      // set the subscription to rsync files from a 'source' folder to 'destination' folder
        source: '/Users/jordid/GitHome/deploy-api-dev/',
        destination: 'jordid@dev.meilleursagents.org:deploy-api-dev/',
        watchExpression: ["allof",
            ['type', 'f'],
        ].concat(notWatchedFolders),
        ignoreFolders: notSyncedFolders
    },
]

const subscriptionsConfig = {};

// Filter active subscriptions
subscriptions.forEach(subscription => {
    if (subscription.active) {
        subscriptionsConfig[subscription.name] = subscription
    }
})

module.exports = {
    debug: true,           // changes the output to show debug information, cmd and stdout output
    emoji: true,            // if your terminal window can support emojis
    rsyncCmd: 'rsync',      // default: 'rsync' -- override to whatever rsync command is installed or located
    subscriptions: subscriptionsConfig,
};