##  ********************************************
##  Coppermine Photo Gallery
##  ************************
##  Copyright (c) 2003-2016 Coppermine Dev Team
##  v1.0 originally written by Gregory Demar
##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License version 3
##  as published by the Free Software Foundation.
##
##  ********************************************
##  Coppermine version: 1.6.01
##  $HeadURL$
####  ********************************************

# The following line has to be removed when the moderator group feature will be re-enabled!
UPDATE CPG_albums SET moderator_group = 0;

# Fix legacy datetime zero values
UPDATE CPG_users SET `user_lastvisit`='1000-01-01 00:00:00' WHERE `user_lastvisit`='0000-00-00 00:00:00';
UPDATE CPG_users SET `user_regdate`='1000-01-01 00:00:00' WHERE `user_regdate`='0000-00-00 00:00:00';
UPDATE CPG_comments SET `msg_date`='1000-01-01 00:00:00' WHERE `msg_date`='0000-00-00 00:00:00';
UPDATE CPG_pictures SET `mtime`='1000-01-01 00:00:00' WHERE `mtime`='0000-00-00 00:00:00';

INSERT INTO CPG_config VALUES ('upload_create_album_directory', '1');
INSERT INTO CPG_config VALUES ('ecard_captcha', '1');
INSERT INTO CPG_config VALUES ('cookies_need_consent', '0');
INSERT INTO CPG_config VALUES ('album_sort_order', 'pa');
INSERT INTO CPG_config VALUES ('custom_sortorder_thumbs', '1');
INSERT INTO CPG_config VALUES ('link_last_upload', '0');
INSERT INTO CPG_config VALUES ('editpics_ignore_newer_than', '0');

ALTER TABLE CPG_users ADD user_password_salt varchar(255) NOT NULL default '';
ALTER TABLE CPG_users ADD user_password_hash_algorithm varchar(25) NOT NULL default '';
ALTER TABLE CPG_users ADD user_password_iterations varchar(25) NOT NULL default '';

ALTER TABLE CPG_comments CHANGE `msg_date` `msg_date` datetime NOT NULL default '1000-01-01 00:00:00';
ALTER TABLE CPG_pictures CHANGE `mtime` `mtime` datetime NOT NULL default '1000-01-01 00:00:00';
ALTER TABLE CPG_users CHANGE `user_lastvisit` `user_lastvisit` datetime NOT NULL default '1000-01-01 00:00:00';
ALTER TABLE CPG_users CHANGE `user_regdate` `user_regdate` datetime NOT NULL default '1000-01-01 00:00:00';

INSERT INTO CPG_config VALUES ('batch_add_hide_existing_files', '0');
INSERT INTO CPG_config VALUES ('only_empty_albums', '0');
INSERT INTO CPG_config VALUES ('user_manager_hide_file_stats', '0');
INSERT INTO CPG_config VALUES ('album_uploads_default', 'NO');

# Add field to plugin table to signify enabled/disabled
ALTER TABLE CPG_plugins ADD `enabled` TINYINT(1) NOT NULL DEFAULT '1' AFTER `name`;

INSERT INTO CPG_config VALUES ('last_updates_check', '1');