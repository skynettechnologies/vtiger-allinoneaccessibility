<link rel="stylesheet" href="modules/Allinoneaccessibility/css/aioawidget.css">

<h2>{'All in One Accessibility™'|vtranslate:$MODULE}</h2>
<hr>
{if ({$RECORD_MODEL->get('is_validkey')} == 0 ) } 
    <div style="margin-bottom:10px;">{$coupon_html}</div>
{/if}
<div class="panel panel-default aioa-settings-panel">
    <div class="panel-body">
        <div id="pageloader">
            <img src="http://cdnjs.cloudflare.com/ajax/libs/semantic-ui/0.16.1/images/loader-large.gif" alt="processing..." />
        </div>
        <form enctype="multipart/form-data" id="form-module" class="SettingAddForm">
            <input type="hidden" id="isvalid_key" class="isvalid_key" name="isvalid_key" value="">
            <input type="hidden" id="site_url" class="aioa-domain" value="{$site_url}">
            <input type="hidden" id="domain"  value="{$domain}">
            <div class="form-group row">
                <label class="col-sm-2" for="input-status">License key required for full version:</label>
                <div class="col-sm-3">
                    <input type="text" name="license_key" value="{$RECORD_MODEL->get('license_key')}" placeholder="Enter License Key"
                        id="input-name" class="form-control license_key" />
                </div>
                <div class="col-sm-7"></div>
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <div style="margin-top: 5px;">
                    <span id="invalid-key-msg" class="{if (({$RECORD_MODEL->get('is_validkey')} == 1 )) } d-none {/if} text-danger">{if ({$RECORD_MODEL->get('license_key')} != '' )} Key is Invalid! {/if}</span>
                    <p id="license_key_msg" class="{if (({$RECORD_MODEL->get('is_validkey')} == 1 )) } d-none {/if}">
                        Please <a href="https://www.skynettechnologies.com/add-ons/cart/?add-to-cart=116&variation_id=117&quantity=1&utm_source={$domain}=&utm_medium=vtiger-module&utm_campaign=purchase-plan" target="_blank" style="color:blue">Upgrade</a>
                        to full version of All in One Accessibility Pro.</p>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2" for="input-status">Color :</label>
                <div class="col-sm-2">
                    <input type="text" name="color" value="{$RECORD_MODEL->get('color')}"
                         id="colorCode" class="form-control">
                    </input>
                </div>
                <div class="col-sm-2">
                    <input type="color" id="colorpicker" name="colorCode" pattern="^#+([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$" 
                        value="{$RECORD_MODEL->get('color')}" style="height: 37px"> 
                </div>
                <div class="col-sm-6"></div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2" for="input-status">Icon Position :</label>
                <div class="col-sm-10">
                    <div style="font-weight: bold">
                        Where would you like to place the accessibility icon on your site?
                    </div>
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2">
                    <input type="radio" name="position" id="aioaPositionTL" class="aioa-position" value="top_left" {if $RECORD_MODEL->get('position')=='top_left'
                        } checked {/if}>
                    <label for="aioaPositionTL" style="font-weight:normal !important">Top left</label><br>
                    <input type="radio" name="position" id="aioaPositionTC" class="aioa-position" value="top_center" {if
                        $RECORD_MODEL->get('position')=='top_center'} checked {/if}>
                    <label for="aioaPositionTC" style="font-weight:normal !important">Top Center</label><br>
                    <input type="radio" name="position" id="aioaPositionTR" class="aioa-position" value="top_right" {if
                        $RECORD_MODEL->get('position')=='top_right'} checked {/if}>
                    <label for="aioaPositionTR" style="font-weight:normal !important">Top Right</label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" name="position" id="aioaPositionBL" class="aioa-position" value="bottom_left" {if
                        $RECORD_MODEL->get('position')=='bottom_left'} checked {/if}>
                    <label for="aioaPositionBL" style="font-weight:normal !important">Bottom left</label><br>
                    <input type="radio" name="position" id="aioaPositionBR" class="aioa-position" value="bottom_right" {if
                        $RECORD_MODEL->get('position')=='bottom_right'} checked {/if}>
                    <label for="aioaPositionBR" style="font-weight:normal !important">Bottom Right</label><br>
                    <input type="radio" name="position" id="aioaPositionBC" class="aioa-position" value="bottom_center" {if
                        $RECORD_MODEL->get('position')=='bottom_center'} checked {/if}>
                    <label for="aioaPositionBC" style="font-weight:normal !important">Bottom Center</label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" name="position" id="aioaPositionML" class="aioa-position" value="middel_left" {if
                        $RECORD_MODEL->get('position')=='middel_left'} checked {/if}>
                    <label for="aioaPositionML" style="font-weight:normal !important">Middle left</label><br>
                    <input type="radio" name="position" id="aioaPositionMR" class="aioa-position" value="middel_right" {if
                        $RECORD_MODEL->get('position')=='middel_right'} checked {/if}>
                    <label for="aioaPositionMR" style="font-weight:normal !important">Middle Right</label>
                </div>
            </div>
            <div class="form-group row mt-4 icon common-class aioa-icon-type{if ({$RECORD_MODEL->get('is_validkey')} == 0)} d-none{/if}">
                <label class="col-sm-2">Select icon type:</label>
                <div class="col-sm-2">
                    <input type="radio" id="edit-type-1" name="icon_type" value="aioa-icon-type-1"
                        class="input-hidden icon_type" {if $RECORD_MODEL->get('icon_type')=='aioa-icon-type-1'} checked {/if}>
                    <label for="edit-type-1" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/aioa-icon-type-1.svg"
                            width="65" height="65" id="aioa-icon-type-1-img" style="margin: auto" />
                        <span class="visually-hidden">Type 1</span>
                    </label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" id="edit-type-2" name="icon_type" value="aioa-icon-type-2"
                        class="input-hidden icon_type" {if $RECORD_MODEL->get('icon_type')=='aioa-icon-type-2'} checked {/if}>
                    <label for="edit-type-2" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/aioa-icon-type-2.svg"
                            width="65" height="65" id="aioa-icon-type-2-img" style="margin: auto" />
                        <span class="visually-hidden">Type 2</span>
                    </label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" id="edit-type-3" name="icon_type" value="aioa-icon-type-3"
                        class="input-hidden icon_type" {if $RECORD_MODEL->get('icon_type')=='aioa-icon-type-3'} checked {/if}>
                    <label for="edit-type-3" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/aioa-icon-type-3.svg"
                            width="65" height="65" id="aioa-icon-type-3-img" style="margin: auto" />
                        <span class="visually-hidden">Type 3</span>
                    </label>
                </div>
            </div>
            <div class="form-group row mt-4 icon common-class {if ({$RECORD_MODEL->get('is_validkey')} == 0)} d-none{/if}">
                <label class="col-sm-2" style="margin: auto">Select icon size:</label>
                <div class="col-sm-2">
                    <input type="radio" id="edit-size-big" name="icon_size" value="aioa-big-icon" class="input-hidden aioa-iconsize"
                        {if $RECORD_MODEL->get('icon_size')=='aioa-big-icon'} checked {/if}>
                    <label for="edit-size-big" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/{$RECORD_MODEL->get('icon_type')}.svg"
                            width="75" height="75" style="margin: auto" class="icon-img" />
                        <span class="visually-hidden">Type 1</span>
                    </label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" id="edit-size-medium" name="icon_size" value="aioa-medium-icon"
                        class="input-hidden aioa-iconsize" {if $RECORD_MODEL->get('icon_size')=='aioa-medium-icon'} checked {/if}>
                    <label for="edit-size-medium" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/{$RECORD_MODEL->get('icon_type')}.svg"
                            width="65" height="65" style="margin: auto" class="icon-img" />
                        <span class="visually-hidden">Type 2</span>
                    </label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" id="edit-size-default" name="icon_size" value="aioa-default-icon"
                        class="input-hidden aioa-iconsize" {if $RECORD_MODEL->get('icon_size')=='aioa-default-icon'} checked {/if}>
                    <label for="edit-size-default" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/{$RECORD_MODEL->get('icon_type')}.svg"
                            width="55" height="55" style="margin: auto" class="icon-img" />
                        <span class="visually-hidden">Type 3</span>
                    </label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" id="edit-size-small" name="icon_size" value="aioa-small-icon"
                        class="input-hidden aioa-iconsize" {if $RECORD_MODEL->get('icon_size') =='aioa-small-icon'} checked {/if}>
                    <label for="edit-size-small" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/{$RECORD_MODEL->get('icon_type')}.svg"
                            width="45" height="45" style="margin: auto" class="icon-img" />
                        <span class="visually-hidden">Type 3</span>
                    </label>
                </div>
                <div class="col-sm-2">
                    <input type="radio" id="edit-size-extra-small" name="icon_size"
                        value="aioa-extra-small-icon"" class="input-hidden aioa-iconsize" {if $RECORD_MODEL->get('icon_size')=='aioa-extra-small-icon'}
                        checked {/if}>
                    <label for="edit-size-extra-small" class="icon-label">
                        <img src="https://skynettechnologies.com/sites/default/files/python/{$RECORD_MODEL->get('icon_type')}.svg"
                            width="35" height="35" style="margin: auto" class="icon-img" />
                        <span class="visually-hidden">Type 3</span>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <button type="submit" class="btn-lg btn-purple float-right" id="submitBtn">Save</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
	
	$('#colorpicker').on('input', function() {
		$('#colorCode').val(this.value);
	});

	$('#colorCode').on('input', function() {
		$('#colorpicker').val(this.value);
	});

	$("input[name=icon_type]:radio").change(function () {
        
		var iconType = $(this).val();
		var iconImg = $("#"+iconType+"-img").attr("src");
		console.log($("#"+iconType+"-img").attr("src"));
		$(".icon-img").attr("src", iconImg);
	});

    setTimeout(function() {
		$('.alert').fadeOut('slow');
	}, 2000); 
    
	$('.SettingAddForm').submit(function(event){
    
        event.preventDefault(); 
        $("#pageloader").fadeIn();       
        var site_url = $("#site_url").val();
        var form=$(".SettingAddForm");
        
        var dataUrl = site_url+"index.php?module=Allinoneaccessibility&action=Save&app=TOOLS";
        $.ajax({
            url: dataUrl,
            type: 'POST',
            data:$(".SettingAddForm input").serialize(),
            success: function(response) {
                location.reload();
            },
            error: function(error) {
                console.error(error);
            }
        });

    })
    
</script>





 