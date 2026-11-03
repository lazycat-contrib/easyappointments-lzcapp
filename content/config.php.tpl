<?php
/* ----------------------------------------------------------------------------
 * Easy!Appointments - Config, generated for LazyCat at first boot.
 *
 * content/init.sh renders this template once and writes it to
 * /var/www/html/config.php. Easy!Appointments reads these constants at startup
 * and does not consult the environment, so the file has to exist before the
 * web server serves the installer.
 * ------------------------------------------------------------------------- */

class Config
{
    // ------------------------------------------------------------------------
    // GENERAL SETTINGS
    // ------------------------------------------------------------------------

    const BASE_URL = '__BASE_URL__';
    const LANGUAGE = 'chinese';
    const DEBUG_MODE = false;

    // ------------------------------------------------------------------------
    // DATABASE SETTINGS
    // ------------------------------------------------------------------------

    const DB_HOST = '__DB_HOST__';
    const DB_NAME = '__DB_NAME__';
    const DB_USERNAME = '__DB_USERNAME__';
    const DB_PASSWORD = '__DB_PASSWORD__';
}
