const urls = ["*://www.youtube.com/*", "*://*.googlevideo.com/*", "*://i.ytimg.com/*", "*://yt3.ggpht.com/*"];

function handleProxyRequest(requestInfo) {
    return { type: "http", host: "localhost", port: 8080 };
}

browser.proxy.onRequest.addListener(handleProxyRequest, {
    urls: ["<all_urls>"],
});