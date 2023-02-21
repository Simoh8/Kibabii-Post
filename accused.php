<?php require_once('Connections/booster.php'); ?>
<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
  $insertSQL = sprintf("INSERT INTO accused (AccSerialNo, AccName, AccIDno, DATEofBIRTH, AccGender, CFN) VALUES (%s, %s, %s, %s, %s, %s)",
                       GetSQLValueString($_POST['AccSerialNo'], "int"),
                       GetSQLValueString($_POST['AccName'], "text"),
                       GetSQLValueString($_POST['AccIDno'], "int"),
                       GetSQLValueString($_POST['DATEofBIRTH'], "text"),
                       GetSQLValueString($_POST['AccGender'], "text"),
                       GetSQLValueString($_POST['CFN'], "int"));

  mysql_select_db($database_booster, $booster);
  $Result1 = mysql_query($insertSQL, $booster) or die(mysql_error());
}
?>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css">
<table width="100%" border="1">
  <tr>
    <th scope="col"><p><img src="images/logo.jfif" alt="logo " width="139" height="135"></p>
    <p style="font-size:36px">BOOSTER POLICE POST</p></th>
  </tr>
  <tr align="center" bgcolor="#CCFFFF">
    <td height="68"><ul id="MenuBar1" class="MenuBarHorizontal" >
      <li><a href="home.php">Home</a></li>
      <li><a href="case.php" class="MenuBarItemSubmenu">Case</a>
        <ul>
          <li><a href="case.php">Add case</a></li>
        </ul>
      </li>
      <li><a href="officer.php" class="MenuBarItemSubmenu">Officer</a>
        <ul>
          <li><a href="officer.php">Add ofiicer</a></li>
        </ul>
    </li>
      <li><a href="accused.php" class="MenuBarItemSubmenu">Accused</a>
        <ul>
          <li><a href="accused.php">Add accused</a></li>
        </ul>
      </li>
      <li><a href="complainant.php" class="MenuBarItemSubmenu">Complainant</a>
        <ul>
          <li><a href="complainant.php">Add complainant</a></li>
        </ul>
      </li>
      <li><a href="department.php" class="MenuBarItemSubmenu">Department</a>
        <ul>
          <li><a href="department.php">Add department</a></li>
        </ul>
      </li>
      <li><a class="MenuBarItemSubmenu" href="ob.php">OB</a>
        <ul>
<li><a href="ob.php">Add OB</a></li>
        </ul>
      </li>
      <li><a href="equip.php" class="MenuBarItemSubmenu">Equipment</a>
        <ul>
          <li><a href="#">Add equipment</a></li>
        </ul>
      </li>
    </ul>      <label for="select"></label></td>
  </tr>
  <tr>
    <td height="165">&nbsp;
      <form method="post" name="form1" action="<?php echo $editFormAction; ?>">
        <table align="center">
          <tr valign="baseline">
            <td nowrap align="right">AccSerialNo:</td>
            <td><input type="text" name="AccSerialNo" value="" size="32"></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">AccName:</td>
            <td><input type="text" name="AccName" value="" size="32"></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">AccIDno:</td>
            <td><input type="text" name="AccIDno" value="" size="32"></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">DATEofBIRTH:</td>
            <td><input type="text" name="DATEofBIRTH" value="" size="32"></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">AccGender:</td>
            <td><input type="text" name="AccGender" value="" size="32"></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">CFN:</td>
            <td><input type="text" name="CFN" value="" size="32"></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">&nbsp;</td>
            <td><input type="submit" value="Insert record"></td>
          </tr>
        </table>
      </form>
    <p>&nbsp;</p></td>
  </tr>
  <tr bgcolor="#CCCCCC">
    <td height="88" align="center"><p>&copy;BOOSTER POLICE POST. ALL RIGHTS RESERVED</p></td>
  </tr>
</table>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
