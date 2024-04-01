<?php
class Allinoneaccessibility_Record_Model extends Vtiger_Base_Model {

        const TABLE_NAME = 'aioa_widget_settings';

        public static function getInstance() {
                $model = new self();
                $db = PearDatabase::getInstance();
                $query = 'SELECT * FROM '.self::TABLE_NAME;
                $result = $db->pquery($query, array());
                $resultCount = $db->num_rows($result);
                
                if($resultCount > 0) {
                        for ($i = 0; $i < $resultCount; $i++) {
                                
                                $model->set('license_key', $db->query_result($result, $i, 'license_key'));
                                $model->set('color', $db->query_result($result, $i, 'color'));
                                $model->set('position', $db->query_result($result, $i, 'position'));
                                $model->set('icon_type', $db->query_result($result, $i, 'icon_type'));
                                $model->set('icon_size', $db->query_result($result, $i, 'icon_size'));
                                $model->set('is_validkey', $db->query_result($result, $i, 'is_validkey'));
                        }
                        return $model;
                }
                return $model;
        }

        static function getCleanInstance() {
            return new self;
        }
        
        public function save() {
            
            $db = PearDatabase::getInstance();
            $parameters = '';
            $query = 'UPDATE '.self::TABLE_NAME.' SET `license_key` = "'.$this->get('license_key').'" , `color` = "'.$this->get('color').'" ,`position` = "'.$this->get('position').'",`icon_type` = "'.$this->get('icon_type').'",`icon_size` = "'.$this->get('icon_size').'",`is_validkey` = "'.$this->get('is_validkey').'" ORDER BY id ASC LIMIT 1';
            $db->pquery($query, array());
        }
        
        
}