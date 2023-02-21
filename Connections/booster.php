<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_booster = "localhost";
$database_booster = "police";
$username_booster = "root";
$password_booster = "";
$booster = mysql_pconnect($hostname_booster, $username_booster, $password_booster) or trigger_error(mysql_error(),E_USER_ERROR); 
?>