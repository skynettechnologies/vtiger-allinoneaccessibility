<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

include_once('vtlib/Vtiger/Event.php');
include_once('vtlib/Vtiger/Module.php');

/**
 * Module class definition
 */
class AllinOneAccessibility {

    /**
     * Invoked when special actions are performed on the module.
     *
     * @param String Module name
     * @param String Event Type
     */
    function vtlib_handler($moduleName, $eventType) {
        try {
            if ($eventType == 'module.postinstall') {
                $this->addCustomJavaScript();
                $this->log("The All in One Accessibility module has been installed.");
            }

            if ($eventType == 'module.enabled') {
                $this->addCustomJavaScript();
                $this->registerEvents();
                $this->log("The All in One Accessibility module has been enabled.");
            }

            if ($eventType == 'module.disabled') {
                $this->removeCustomJavaScript();
                $this->log("The All in One Accessibility module has been disabled.");
            }

            if ($eventType == 'module.preuninstall') {
                $this->removeCustomJavaScript();
                $this->log("The All in One Accessibility module is about to be uninstalled.");
            }
        } catch (Exception $e) {
            $this->log("Error: " . $e->getMessage());
        }
    }

    /**
     * Function to add the custom JavaScript to the header
     */
    function addCustomJavaScript() {
        $moduleInstance = Vtiger_Module::getInstance('AllinOneAccessibility');
        if ($moduleInstance) {
            $moduleInstance->addLink('HEADERSCRIPT', 'AllInOneAccessibilityJS', 'modules/AllinOneAccessibility/resources/AioaWidget.js');
        }
    }

    /**
     * Function to remove the custom JavaScript from the header
     */
    function removeCustomJavaScript() {
        $moduleInstance = Vtiger_Module::getInstance('AllinOneAccessibility');
        if ($moduleInstance) {
            $moduleInstance->deleteLink('HEADERSCRIPT', 'AllInOneAccessibilityJS');
        }
    }

    /**
     * Function to register events
     */
    function registerEvents() {
        $AccountsInstance = Vtiger_Module::getInstance('Accounts');
        if ($AccountsInstance) {
            Vtiger_Event::register($AccountsInstance, 'vtiger.entity.aftersave', 'AllinOneAccessibilityHandler', 'modules/AllinOneAccessibility/AllinOneAccessibility.php');
        }
    }

    /**
     * Function to log messages
     */
    function log($message) {
        $logFile = 'modules/AllinOneAccessibility/logs/module.log';
        file_put_contents($logFile, date('Y-m-d H:i:s') . " - " . $message . PHP_EOL, FILE_APPEND);
    }
}
