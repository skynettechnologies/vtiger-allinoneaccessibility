<?php

include_once 'include/Zend/Json.php';
require_once('data/CRMEntity.php');
require_once('data/Tracker.php');

class Allinoneaccessibility {

    /**
     * Invoked when special actions are performed on the module.
     *
     * @param String $moduleName
     * @param String $event_type
     */
    function vtlib_handler($moduleName, $event_type) {
        
        if($event_type == 'module.postinstall') {
            global $adb;
            // Initialize settings
            $sql = "INSERT INTO `aioa_widget_settings` (`color`, `position`, `icon_type`, `icon_size`, `license_key`, `is_validkey`) VALUES ('#420083', 'bottom_right', 'aioa-icon-type-1', 'aioa-medium-icon', '',0);";
            $adb->pquery($sql,array());

            $this->linksManager(true);
            
        } else if($event_type == 'module.disabled') {

            $this->linksManager(false);

        } else if($event_type == 'module.enabled') {

            $this->linksManager(true);

        } else if($event_type == 'module.preuninstall') {
            global $adb;
            $sql = "DROP TABLE IF EXISTS `aioa_widget_settings`;";
            $adb->pquery($sql,array());
           
        } else if($event_type == 'module.preupdate') {
            // TODO Handle actions before this module is updated.
        } else if($event_type == 'module.postupdate') {
            // TODO Handle actions after this module is updated.
        }

    }

    /**
     * True - add links, false - delete
     *
     * @param $flag
     */
    function linksManager($flag) {
        $moduleInstance = Vtiger_Module::getInstance('Allinoneaccessibility');

        $vtigerVersion = vtws_getVtigerVersion();
        
        if($vtigerVersion[0] == '7') {
            $url = 'layouts/v7/modules/Allinoneaccessibility/resources/AioaWidget.js';
        } else {
            $url = 'layouts/vlayout/modules/Settings/Allinoneaccessibility/resources/AioaWidget.js';
        }

        if($flag) {
            $moduleInstance->addLink('HEADERSCRIPT', 'AllinoneaccessibilityHeaderScript', $url);
        } else {
            $moduleInstance->deleteLink('HEADERSCRIPT', 'AllinoneaccessibilityHeaderScript');
        }
    }
}

?>