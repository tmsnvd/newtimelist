<?php

/**
 * Class TopazMessageDropDown
 * Message center drop down list
 */
class TopazMessageDropDown extends CWidget
{

    /**
     * Initializes the widget.
     */
    public function init()
    {

    }

    /**
     * Runs the widget.
     */
    public function run()
    {

        $count = Message::model()->unread()->count();
        $msgs = Message::model()->unread()->recently()->with('employee')->findAll();

        echo '<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-envelope-alt"></i>';

        if ($count > 0)
        {
            echo "<span class='label label-lightred'>$count</span></a>";
        }

        echo '<ul class="dropdown-menu pull-right message-ul">';

        foreach ($msgs as $msg)
        {
            echo "<li><a href='#'>";

            $this->widget('application.extensions.VGGravatarWidget',
                array(
                    'size' => 40,
                    'rating' => 'R', //  G, PG, R, X, Defaults to G,
                    'default' => 'retro',
                    'email' => md5(time() + rand()),
                    'htmlOptions' => array('alt' => Yii::app()->user->name)
                ));
            echo '<div class="details">
                                    <div class="name">' . $msg->employee->name . ' ' . $msg->employee->surname . '</div>
                                    <div class="message">
                                        ' . $msg->title . '...
                                    </div>
                                </div>';

            echo "</a></li>";
        }

        echo "<li>", CHtml::link(Yii::t('menu', 'Pranešimų centras') . '<i class="icon-arrow-right"></i>', array('message/index/'), array('class' => 'more-messages'));
        echo '</li></ul></li>';
    }

}