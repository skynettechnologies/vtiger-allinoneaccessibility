<?php

class Allinoneaccessibility_List_View extends Vtiger_Index_View {

        public function process(Vtiger_Request $request) {
                $recordModel = Allinoneaccessibility_Record_Model::getInstance();
                
                $site_URL = vglobal('site_URL');
                $domain = parse_url($site_URL, PHP_URL_HOST);
                
                $viewer = $this->getViewer($request);
                
                setcookie('domain_name', $domain,time() + (10 * 365 * 24 * 60 * 60)); 
                setcookie('aioa_token', $recordModel->get('license_key'),time() + (10 * 365 * 24 * 60 * 60)); 
                setcookie('aioa_color', urldecode($recordModel->get('color')),time() + (10 * 365 * 24 * 60 * 60)); 
                setcookie('aioa_position', $recordModel->get('position'),time() + (10 * 365 * 24 * 60 * 60)); 
                setcookie('aioa_icontype', $recordModel->get('icon_type'),time() + (10 * 365 * 24 * 60 * 60)); 
                setcookie('aioa_iconsize', $recordModel->get('icon_size'),time() + (10 * 365 * 24 * 60 * 60));
                
				/* Get Banner coupon HtML*/
				$c = curl_init();

				curl_setopt_array($c, array(
				CURLOPT_URL => 'https://www.skynettechnologies.com/add-ons/discount_offer.php?platform=vitiger',
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_ENCODING => '',
				CURLOPT_MAXREDIRS => 10,
				CURLOPT_TIMEOUT => 0,
				CURLOPT_FOLLOWLOCATION => true,
				CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				CURLOPT_CUSTOMREQUEST => 'GET',
				));
				
				$response = curl_exec($c);
				
				curl_close($c);
				/* Get Banner coupon HtML*/

                $viewer->assign('site_url', $site_URL);
                $viewer->assign('domain', $domain);
                $viewer->assign('RECORD_MODEL',$recordModel);
				$viewer->assign('coupon_html',$response);
                $viewer->view('List.tpl', $request->getModule());
                $this->checkAndConvertJsScripts();
        }
        
        function getHeaderScripts(Vtiger_Request $request) {
                $moduleName = $request->getModule();
                return $this->checkAndConvertJsScripts(array("modules.$moduleName.resources.AioaWidget"));
        }

        function checkAndConvertJsScripts($jsFileNames) {
		$fileExtension = 'js';
               
		$jsScriptInstances = array();
		if($jsFileNames) {
			foreach($jsFileNames as $jsFileName) {
				// TODO Handle absolute inclusions (~/...) like in checkAndConvertCssStyles
				$jsScript = new Vtiger_JsScript_Model();

				// external javascript source file handling
				if(strpos($jsFileName, 'http://') === 0 || strpos($jsFileName, 'https://') === 0) {
					$jsScriptInstances[$jsFileName] = $jsScript->set('src', $jsFileName);
					continue;
				}

				$completeFilePath = Vtiger_Loader::resolveNameToPath($jsFileName, $fileExtension);
                                
				if(file_exists($completeFilePath)) {
					if (strpos($jsFileName, '~') === 0) {
						$filePath = ltrim(ltrim($jsFileName, '~'), '/');
						// if ~~ (reference is outside vtiger6 folder)
						if (substr_count($jsFileName, "~") == 2) {
							$filePath = "../" . $filePath;
						}
					} else {
						$filePath = str_replace('.','/', $jsFileName) . '.'.$fileExtension;
					}

					$jsScriptInstances[$jsFileName] = $jsScript->set('src', $filePath);
				} else {
					$fallBackFilePath = Vtiger_Loader::resolveNameToPath(Vtiger_JavaScript::getBaseJavaScriptPath().'/'.$jsFileName, 'js');
					if(file_exists($fallBackFilePath)) {
						$filePath = str_replace('.','/', $jsFileName) . '.js';
						$jsScriptInstances[$jsFileName] = $jsScript->set('src', Vtiger_JavaScript::getFilePath($filePath));
					}
				}
			}
		}
                
		return $jsScriptInstances;
	}

}
