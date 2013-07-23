<?php

/**
 * Class EmployeeTest
 */
class EmployeeTest extends CDbTestCase
{
    public $fixtures = array(
        'employee' => 'Employee'
    );

    /**
     * Test the TEST
     */
    public function testApprove()
    {
        $this->assertTrue(TRUE);
    }


}