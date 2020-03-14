<?php

class Notification{

    public function __construct(){
        require_once SCR_PATH . 'includes/lib/notification-addon/starcat-review-notificaiton.php';
        
    }
}

new Notification();
?>