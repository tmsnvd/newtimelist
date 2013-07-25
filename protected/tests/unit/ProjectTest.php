<?php

/**
 * Class ProjectTest
 */
class ProjectTest extends PHPUnit_Framework_TestCase
{
    public $fixtures = array(
        'project' => 'Project'
    );

    /**
     * test table name
     */
    public function testTableName()
    {
        $employee = new Project;
        $this->assertEquals('project', $employee->tableName());
    }

    /**
     *
     */
    public function testRules()
    {
        $employee = new Project;
        $this->assertGreaterThan(0, count($employee->rules()));
    }

    /**
     *
     */
    public function testAttributeLabels()
    {
        $employee = new Project;
        $this->assertGreaterThan(0, count($employee->attributeLabels()));
    }

    /**
     *
     */
    public function testSearch()
    {
        $employee = new Project;
        $this->assertInstanceOf('CActiveDataProvider', $employee->search());
    }

}
