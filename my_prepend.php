<?php

# This file can be loaded from .htaccess as follows:
#   php_value auto_prepend_file /path/to/my_prepend.php


ini_set('xdebug.var_display_max_depth', 9);
ini_set('xdebug.var_display_max_children', -1);
#ini_set('xdebug.var_display_max_data', 512);
ini_set('xdebug.var_display_max_data', -1);

/*
function var_dump_pre($mixed = null) {
    echo '<pre>';
    var_dump($mixed);
    echo '</pre>';
    return null;
}
*/

# Improved var_dump
function dp($var, $label = "", $file = null, $line = null) {
    if (!is_null($file)) {
        $label .= ", FILE: " . $file;
    }
    if (!is_null($line)) {
        $label .= ", LINE: " . $line;
    }
    pecho($label);
    var_dump($var);
}

# pre + echo
function pecho($mixed = null) {
    echo '<pre>';
    echo "!!==== ";
    echo $mixed;
    echo '</pre>';
    return null;
}



## Debug Functions Usage
/*
dp($result, __METHOD__ . ' (line ' . __LINE__  . ') ');
*/


