<?php
use App\Kernel;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Debug\DebugClassLoader;

//require dirname(__DIR__).'/config/bootstrap.php';
require_once dirname(__DIR__).'/vendor/autoload_runtime.php';

// If you don't want to setup permissions the proper way, just uncomment the following PHP line
// read https://symfony.com/doc/current/setup.html#checking-symfony-application-configuration-and-setup
// for more information

// This check prevents access to debug front controllers that are deployed by accident to production servers.
// Feel free to remove this, extend it, or make something more sophisticated.

if (isset($_SERVER['HTTP_CLIENT_IP'])
    || isset($_SERVER['HTTP_X_FORWARDED_FOR'])
    || !(in_array(@$_SERVER['REMOTE_ADDR'], array('127.0.0.1', '192.168.10.1', '192.168.10.10', '::1'), true) || PHP_SAPI === 'cli-server')

) {
    header('HTTP/1.0 403 Forbidden');
    exit('You are not allowed to access this file. Check '.basename(__FILE__).' for more information.');
}

//$loader = require_once __DIR__.'/../app/autoload.php';

if ($trustedHosts = $_SERVER['TRUSTED_HOSTS'] ?? $_ENV['TRUSTED_HOSTS'] ?? false) {
    Request::setTrustedHosts([$trustedHosts]);
}

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};

