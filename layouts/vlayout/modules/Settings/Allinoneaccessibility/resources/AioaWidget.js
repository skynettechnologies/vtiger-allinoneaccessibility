function load_aioa_script() {
    
    let aioa_script_token = (getCookieValue('aioa_token') != 'undefined') ? getCookieValue('aioa_token') : '';
    let aioa_script_color = (decodeURIComponent(getCookieValue('aioa_color')) != 'undefined') ? decodeURIComponent(getCookieValue('aioa_color')) : '#420083';
    let aioa_script_position = (getCookieValue('aioa_position') != 'undefined') ? getCookieValue('aioa_position'): 'bottom_right';
    let aioa_script_icon_type = (getCookieValue('aioa_icontype') != 'undefined') ? getCookieValue('aioa_icontype'): 'aioa-icon-type-1';
    let aioa_script_icon_size = (getCookieValue('aioa_iconsize') != 'undefined') ? getCookieValue('aioa_iconsize'): 'aioa-medium-icon';
    
    let aioa_script_tag = document.createElement("script");
    aioa_script_tag.src = "https://www.skynettechnologies.com/accessibility/js/all-in-one-accessibility-js-widget-minify.js?colorcode=" + aioa_script_color + "&token=" + aioa_script_token + "&position=" + aioa_script_position + "." + aioa_script_icon_type + "." + aioa_script_icon_size + "";
    aioa_script_tag.id = "aioa-adawidget";
    document.getElementsByTagName("head")[0].appendChild(aioa_script_tag);
}
window.addEventListener("load", (event) => {
    setTimeout(() => {
        load_aioa_script();
    }, 3000)
});

function getCookieValue(name) 
{
    const regex = new RegExp(`(^| )${name}=([^;]+)`)
    const match = document.cookie.match(regex);
    return match ? match[2] : 'undefined';
   
}