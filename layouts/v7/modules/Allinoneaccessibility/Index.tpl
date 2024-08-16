{* layouts/v7/modules/AllinOneAccessibility/Index.tpl *}

<style>
  .get-strated-btn,
  .get-strated-btn:hover {
    background-color: #2855d3;
    color: white;
    padding: 5px 5px;
    text-decoration: none;
  }

  .aioa-cancel-button {
    text-decoration: none;
    display: inline-block;
    vertical-align: middle;
    border: 2px solid #420083;
    border-radius: 4px 4px 4px 4px;
    background-color: #420083;
    box-shadow: 0px 0px 2px 0px #333333;
    color: #ffffff;
    text-align: center;
    box-sizing: border-box;
    padding: 15px;
    font-size: 20px;
  }

  .aioa-cancel-button:hover {
    border-color: #420083;
    background-color: white;
    box-shadow: 0px 0px 2px 0px #333333;
    color: black;
    text-decoration: none;
  }

  .aioa-cancel-button:hover .mb-text {
    color: #420083;
  }

  .widget {
    float: left;
  }

  .subscription {
    float: right;
  }

  h5 {
    font-weight: 450;
    color: #000;
  }
</style>
<h4 style=" padding: 1%;"><b>All in One Accessibility widget improves website ADA compliance and browser experience for ADA, WCAG 2.1 & 2.2, Section 508, California Unruh Act, Australian DDA, European EAA EN 301 549, UK Equality Act (EA), Israeli Standard 5568, Ontario AODA, Canada ACA, German BITV, France RGAA, Brazilian Inclusion Law (LBI 13.146/2015), Spain UNE 139803:2012, JIS X 8341 (Japan), Italian Stanca Act and Switzerland DDA Standards without changing your website's existing code.
</b></h4>
<div id="domain_button" style="display: none;padding: 2%;">
  <h4 style="color: #aa1111">It appears that you have already registered! Please click on the "Manage Subscription" button to renew your subscription.<br> Once your plan is renewed, please refresh the page.</h4>
  <div style="text-align: left; width:100%; padding-bottom: 10px;">
    <a target="_blank" id="manage_subscription" class="aioa-cancel-button" href="">Manage Subscription</a>
  </div>
</div>

<div id="setting-div" style="width:100%; margin-top: 50px; padding-bottom: 10px; justify-content:space-between; display: none">
  <div style="padding-bottom: 1%;/* padding: 4%; */margin: 4%;margin-top: -2%;">
    <div class="widget">
      <h3>Module Preferences:</h3>
    </div>
    <div class="subscription">
      <a target="_blank" class="aioa-cancel-button" id="aioa_subscriptionsd" href="">Manage Subscription</a>
    </div>
  </div>
  <iframe id="setting-iframe" src="" height="1100px;" width="100%" style="border: none;display: none"></iframe>
</div>

<iframe id="aioa-iframe" src="" height="1100px;" width="100%" style="border: none;display: none"></iframe>

<script>
  var current_domain = window.location.hostname;
  const myHeaders = new Headers();
  myHeaders.append("Cookie", "XSRF-TOKEN=your_token_here; session_cookie_here");

  const formdata = new FormData();
  formdata.append("domain", current_domain);
  const requestOptions = {
    method: "POST",
    headers: myHeaders,
    body: formdata,
    redirect: "follow"
  };

  fetch("https://ada.skynettechnologies.us/check-website", requestOptions)
    .then((response) => response.json())
    .then(function(response) {
      var get_settinglink = response.settinglink;
      var manage_domain = response.manage_domain;
      if (response.status == 3) {
        var show_button = document.getElementById("manage_subscription");
        document.getElementById("aioa-iframe").style.display = 'none';
        document.getElementById("domain_button").style.display = 'block';
        document.getElementById("setting-div").style.display = 'none';
        show_button.href = get_settinglink;
      } else if (response.status > 0 && response.status < 3) {
        var show_button_manage = document.getElementById("aioa_subscriptionsd");
        var iframe = document.getElementById("setting-iframe");
        document.getElementById("aioa-iframe").style.display = 'none';
        document.getElementById("domain_button").style.display = 'none';
        document.getElementById("setting-div").style.display = 'block';
        document.getElementById("setting-iframe").style.display = 'block';
        iframe.src = get_settinglink;
        show_button_manage.href = manage_domain;
      } else {
        var iframe_id = document.getElementById("aioa-iframe");
        document.getElementById("aioa-iframe").style.display = 'block';
        document.getElementById("domain_button").style.display = 'none';
        document.getElementById("setting-div").style.display = 'none';
        iframe_id.src = "https://ada.skynettechnologies.us/trial-subscription?isframe=true&website=" + current_domain + "&developer_mode=true";
      }
    })
    .catch((error) => console.error(error));
</script>

{* Include the default ListView template *}

