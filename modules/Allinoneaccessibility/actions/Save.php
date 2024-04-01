<?php

class Allinoneaccessibility_Save_Action extends Vtiger_Action_Controller {

    public function checkPermission(Vtiger_Request $request) {
        return true;
    }

    public function process(Vtiger_Request $request) {
        
        $recordModel = Allinoneaccessibility_Record_Model::getCleanInstance();
        $recordModel->set('license_key', $request->get('license_key'));
        $recordModel->set('color', $request->get('color'));
        $recordModel->set('position', $request->get('position'));
        $recordModel->set('icon_type', $request->get('icon_type'));
        $recordModel->set('icon_size', $request->get('icon_size'));
        
        $url = "https://www.skynettechnologies.com/add-ons/license-api.php?";
        $postdata['token'] = $request->get('license_key');
        $postdata['SERVER_NAME'] = parse_url(vglobal('site_URL'), PHP_URL_HOST);

        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $postdata);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        $resp = curl_exec($curl);
        $resp = json_decode($resp);

        if (empty($resp->accessibilityloader) ){
                $is_valid = 0;
        }else{
                $is_valid = 1;
        }
        $recordModel->set('is_validkey', $is_valid);
        $response = new Vtiger_Response();
        $recordModel->save();
        $response->setResult(true);
        $response->emit();
    }
}