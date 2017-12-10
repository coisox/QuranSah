<?php if (!defined('APPLICATION')) exit();

// Conversations
$Configuration['Conversations']['Version'] = '2.3.1';

// Database
$Configuration['Database']['Name'] = 'quransah_forum';
$Configuration['Database']['Host'] = 'localhost';
$Configuration['Database']['User'] = 'root';
$Configuration['Database']['Password'] = '';

// EnabledApplications
$Configuration['EnabledApplications']['Conversations'] = 'conversations';
$Configuration['EnabledApplications']['Vanilla'] = 'vanilla';

// EnabledLocales
$Configuration['EnabledLocales']['vf_ms_MY'] = 'ms_MY';

// EnabledPlugins
$Configuration['EnabledPlugins']['GettingStarted'] = 'GettingStarted';
$Configuration['EnabledPlugins']['HtmLawed'] = 'HtmLawed';
$Configuration['EnabledPlugins']['noCaptcha'] = true;

// Garden
$Configuration['Garden']['Title'] = 'Quransah Forum';
$Configuration['Garden']['Cookie']['Salt'] = 'vzKwCg2V3LfCOJrI';
$Configuration['Garden']['Cookie']['Domain'] = '';
$Configuration['Garden']['Registration']['ConfirmEmail'] = '1';
$Configuration['Garden']['Registration']['Method'] = 'Captcha';
$Configuration['Garden']['Registration']['InviteExpiration'] = '1 week';
$Configuration['Garden']['Registration']['CaptchaPrivateKey'] = '';
$Configuration['Garden']['Registration']['CaptchaPublicKey'] = '';
$Configuration['Garden']['Registration']['InviteRoles']['3'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['4'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['8'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['32'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['16'] = '0';
$Configuration['Garden']['Email']['SupportName'] = 'Quransah Forum';
$Configuration['Garden']['Email']['Format'] = 'text';
$Configuration['Garden']['Email']['SupportAddress'] = 'coisox@gmail.com';
$Configuration['Garden']['Email']['UseSmtp'] = '1';
$Configuration['Garden']['Email']['SmtpHost'] = 'smtp.gmail.com';
$Configuration['Garden']['Email']['SmtpUser'] = 'coisox';
$Configuration['Garden']['Email']['SmtpPassword'] = 'Try001122';
$Configuration['Garden']['Email']['SmtpPort'] = '587';
$Configuration['Garden']['Email']['SmtpSecurity'] = 'tls';
$Configuration['Garden']['Email']['OmitToName'] = false;
$Configuration['Garden']['SystemUserID'] = 1;
$Configuration['Garden']['InputFormatter'] = 'Markdown';
$Configuration['Garden']['Version'] = '2.3.1';
$Configuration['Garden']['Cdns']['Disable'] = false;
$Configuration['Garden']['CanProcessImages'] = true;
$Configuration['Garden']['Installed'] = true;
$Configuration['Garden']['DefaultAvatar'] = 'defaultavatar/RBHDS265I1D6.jpg';
$Configuration['Garden']['HomepageTitle'] = 'Quransah Forum';
$Configuration['Garden']['Description'] = '';
$Configuration['Garden']['Logo'] = 'U5XJPJNA6T21.jpg';
$Configuration['Garden']['MobileLogo'] = '0J0OTP5CA8XJ.jpg';
$Configuration['Garden']['FavIcon'] = 'favicon_86f0827cc8a4712d.ico';
$Configuration['Garden']['Locale'] = 'ms_MY';

// Plugins
$Configuration['Plugins']['GettingStarted']['Dashboard'] = '1';
$Configuration['Plugins']['GettingStarted']['Discussion'] = '1';
$Configuration['Plugins']['GettingStarted']['Registration'] = '1';
$Configuration['Plugins']['GettingStarted']['Plugins'] = '1';

// Routes
$Configuration['Routes']['DefaultController'] = 'discussions';

// Vanilla
$Configuration['Vanilla']['Version'] = '2.3.1';

// Last edited by admin (127.0.0.1)2017-12-10 13:26:50