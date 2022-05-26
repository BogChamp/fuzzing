<?php
require __DIR__ . '/code-coverage.php';
// put full path to Smarty.class.php
require('./libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('./templates');
$smarty->setCompileDir('./templates_c');
$smarty->setCacheDir('./cache');
$smarty->setConfigDir('./configs');

$smarty->assign('name', '<script>alert("Ned")</script>');
$smarty->assign('last_name', '<script>alert("Forse")</script>');
$smarty->assign('price', '<script>alert(100)</script>');
$smarty->assign('owner', '<script>alert("Ben")</script>');
$smarty->assign('cost', '<script>alert(15000)</script>');
$smarty->assign('php', '<script>alert(5.8)</script>');
$smarty->assign('user', '<script>alert("nick")</script>');
$smarty->assign('pass', '<script>alert("qwerty")</script>');
$smarty->assign('amount', '<script>alert(2000)</script>');
$smarty->assign('template', '<script>alert("index.tpl")</script>');
$arr = array('<script>alert(1)</script>', '<script>akdfaos</script>', '<script>alert("asd")</script>');
$smarty->assign('vars', $arr);

$smarty->display('script2.tpl');
?>
