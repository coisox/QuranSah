<?php

$PluginInfo['noCaptcha'] = [
    'Name' => 'No Captcha',
    'Description' => 'This plugin deactivates the captcha shown on registration.',
    'Version' => '1.1.0',
    'RequiredApplications' => ['Vanilla' => '>= 2.3.1'],
    'MobileFriendly' => true,
    'HasLocale' => true,
    'Author' => 'Robin Jurinka',
    'AuthorUrl' => 'https://open.vanillaforums.com/profile/r_j',
    'License' => 'MIT'
];

class NoCaptchaPlugin extends Gdn_Plugin {
    public function base_captcha_handler($sender, $args) {
        $args['Handled'] = true;
    }
}

if (!function_exists('validateCaptcha')) {
    function validateCaptcha() {
        return true;
    }
}
