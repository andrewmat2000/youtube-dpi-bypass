var config = {
    mode: "pac_script",
    pacScript: {
        data: "const array = ['www.youtube.com', 'googlevideo.com', 'ytimg.com', 'yt3.ggpht.com]" +
            "function FindProxyForURL(url, host) {\n" +
            "  if (array.findIndex(x => host.include(x)) != -1)\n" +
            "    return 'PROXY localhost:8080';\n" +
            "  return 'DIRECT';\n" +
            "}"
    }
};

chrome.proxy.settings.set(
    { value: config, scope: 'regular' },
    function () { }
);

