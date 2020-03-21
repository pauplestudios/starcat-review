<?php

class NotificationTest extends \Codeception\TestCase\WPTestCase
{

    public function create_woocommerce_order($order_id){
        $current_timestamp = time();
        $this->Data->add_order_timestamp($current_timestamp, $order_id);
    }

    public function test_add_order_to_schedule()
    {
    
        $this->Data =  new \StarcatReview\Includes\Utils\Notification\Notification_Test_Data();
        $Notification = new \StarcatReview\Includes\Utils\Notification\Notification($this->Data);

        $Notification->add_order_to_schedule(16);
        $this->create_woocommerce_order(16);

        $new_schedule = $Notification->get_schedule_from_db();

        /* Add new order to schedule */
        $this->assertArrayHasKey(16, $new_schedule);
        $this->assertEquals('LATER', $new_schedule[16]['emails'][0]['status']);
        $this->assertEquals(0, $new_schedule[16]['emails'][0]['attempts']);

        /* Prevent Duplicate orders in schedule */
        $Notification->add_order_to_schedule(16);
        $new_schedule = $Notification->get_schedule_from_db();
        $this->assertArrayHasKey(16, $new_schedule);

        $has_no_dupes =  (count($new_schedule) === count(array_unique($new_schedule, SORT_REGULAR)));
        $this->assertEquals(true, $has_no_dupes);
    }

} // END TEST CLASS