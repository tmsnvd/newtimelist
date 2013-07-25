<?php

return CMap::mergeArray(
    require(dirname(__FILE__) . '/main.php'),
    array(
        'components' => array(
            'fixture' => array(
                'class' => 'system.test.CDbFixtureManager',
            ),
            'db' => array(
                'connectionString' => 'mysql:host=localhost;dbname=newtimelist_test',
                'emulatePrepare' => true,
                'username' => 'dev',
                'password' => 'dev',
                'charset' => 'utf8',
                'enableProfiling' => true,
                'enableParamLogging' => true
            ),
            'log' => array(
                'class' => 'CLogRouter',
                'routes' => array(
                    array(
                        'class' => 'CFileLogRoute',
                        'levels' => 'error, warning',
                    )
                )
            )
        )
    )
);
