var config = {
    mode: "fixed_servers",
    rules: {
        singleProxy: {
            scheme: "http",
            host: "localhost",
            port: 8080
        },
        bypassList: [
            "*://www.youtube.com/*",
            "*://*.googlevideo.com/*",
            "*://i.ytimg.com/*",
            "*://yt3.ggpht.com/*"
        ]
    }
};

chrome.proxy.settings.set(
    { value: config, scope: 'regular' },
    function () { }
);

