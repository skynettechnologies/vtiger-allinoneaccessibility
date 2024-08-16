function load_aioa_script() {
    // Create the script element
    let scriptEle = document.createElement("script");

    // Set the attributes for the script element
    scriptEle.setAttribute("src", "https://www.skynettechnologies.com/accessibility/js/all-in-one-accessibility-js-widget-minify.js?aioa_reg_req=true&colorcode=&token=&position=bottom_right");
    scriptEle.setAttribute("type", "text/javascript");
    scriptEle.setAttribute("async", "");
    scriptEle.setAttribute("id", "aioa-adawidget");

    // Append the script element to the head of the document
    document.getElementsByTagName("head")[0].appendChild(scriptEle);
}

window.addEventListener("load", (event) => {
    setTimeout(() => {
        load_aioa_script();
    }, 3000);
});

function getCookieValue(name) {
    const regex = new RegExp(`(^| )${name}=([^;]+)`);
    const match = document.cookie.match(regex);
    return match ? match[2] : 'undefined';
}
