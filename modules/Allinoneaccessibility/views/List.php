<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

/**
 * List View
 */
class AllinOneAccessibility_List_View extends Vtiger_Index_View {

    public function process(Vtiger_Request $request) {
        $viewer = $this->getViewer($request);

        $viewer->view('Index.tpl', $request->getModule());
    }
    /**
     * True - add links, false - delete
     *
     * @param $flag
     */
    function linksManager($flag) {
        $moduleInstance = Vtiger_Module::getInstance('Allinoneaccessibility');

        $vtigerVersion = vtws_getVtigerVersion();

        if ($vtigerVersion[0] == '7') {
            $url = 'layouts/v7/modules/Allinoneaccessibility/resources/AioaWidget.js';
        } else {
            $url = 'layouts/vlayout/modules/Settings/Allinoneaccessibility/resources/AioaWidget.js';
        }

        if ($flag) {
            $moduleInstance->addLink('HEADERSCRIPT', 'AllinoneaccessibilityHeaderScript', $url);
        } else {
            $moduleInstance->deleteLink('HEADERSCRIPT', 'AllinoneaccessibilityHeaderScript');
        }
    }
}
