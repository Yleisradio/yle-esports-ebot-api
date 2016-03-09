-- MySQL dump 10.13  Distrib 5.6.11, for osx10.6 (i386)
--
--
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertising`
--

DROP TABLE IF EXISTS `advertising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertising` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `season_id` bigint(20) DEFAULT NULL,
  `message` text,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `season_id_idx` (`season_id`),
  CONSTRAINT `advertising_season_id_seasons_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maps`
--

DROP TABLE IF EXISTS `maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `map_name` varchar(50) DEFAULT NULL,
  `score_1` bigint(20) DEFAULT NULL,
  `score_2` bigint(20) DEFAULT NULL,
  `current_side` varchar(255) DEFAULT NULL,
  `status` mediumint(9) DEFAULT NULL,
  `maps_for` varchar(255) DEFAULT NULL,
  `nb_ot` bigint(20) DEFAULT NULL,
  `identifier_id` bigint(20) DEFAULT NULL,
  `tv_record_file` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id_idx` (`match_id`),
  CONSTRAINT `maps_match_id_matchs_id` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maps_score`
--

DROP TABLE IF EXISTS `maps_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maps_score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map_id` bigint(20) NOT NULL,
  `type_score` varchar(255) DEFAULT NULL,
  `score1_side1` bigint(20) DEFAULT NULL,
  `score1_side2` bigint(20) DEFAULT NULL,
  `score2_side1` bigint(20) DEFAULT NULL,
  `score2_side2` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `map_id_idx` (`map_id`),
  CONSTRAINT `maps_score_map_id_maps_id` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matchs`
--

DROP TABLE IF EXISTS `matchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  `season_id` bigint(20) DEFAULT NULL,
  `team_a` bigint(20) DEFAULT NULL,
  `team_a_flag` varchar(2) DEFAULT NULL,
  `team_a_name` varchar(25) DEFAULT NULL,
  `team_b` bigint(20) DEFAULT NULL,
  `team_b_flag` varchar(2) DEFAULT NULL,
  `team_b_name` varchar(25) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `is_paused` tinyint(1) DEFAULT NULL,
  `score_a` bigint(20) DEFAULT NULL,
  `score_b` bigint(20) DEFAULT NULL,
  `max_round` mediumint(9) NOT NULL,
  `rules` varchar(200) NOT NULL,
  `overtime_startmoney` bigint(20) DEFAULT NULL,
  `overtime_max_round` mediumint(9) DEFAULT NULL,
  `config_full_score` tinyint(1) DEFAULT NULL,
  `config_ot` tinyint(1) DEFAULT NULL,
  `config_streamer` tinyint(1) DEFAULT NULL,
  `config_knife_round` tinyint(1) DEFAULT NULL,
  `config_switch_auto` tinyint(1) DEFAULT NULL,
  `config_auto_change_password` tinyint(1) DEFAULT NULL,
  `config_password` varchar(50) DEFAULT NULL,
  `config_heatmap` tinyint(1) DEFAULT NULL,
  `config_authkey` varchar(200) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `map_selection_mode` varchar(255) DEFAULT NULL,
  `ingame_enable` tinyint(1) DEFAULT NULL,
  `current_map` bigint(20) DEFAULT NULL,
  `force_zoom_match` tinyint(1) DEFAULT NULL,
  `identifier_id` bigint(20) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `auto_start` tinyint(1) DEFAULT NULL,
  `auto_start_time` mediumint(9) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_id_idx` (`server_id`),
  KEY `team_a_idx` (`team_a`),
  KEY `team_b_idx` (`team_b`),
  KEY `current_map_idx` (`current_map`),
  KEY `season_id_idx` (`season_id`),
  CONSTRAINT `matchs_current_map_maps_id` FOREIGN KEY (`current_map`) REFERENCES `maps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matchs_season_id_seasons_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `matchs_server_id_servers_id` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `matchs_team_a_teams_id` FOREIGN KEY (`team_a`) REFERENCES `teams` (`id`) ON DELETE SET NULL,
  CONSTRAINT `matchs_team_b_teams_id` FOREIGN KEY (`team_b`) REFERENCES `teams` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_kill`
--

DROP TABLE IF EXISTS `player_kill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_kill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `map_id` bigint(20) NOT NULL,
  `killer_name` varchar(100) DEFAULT NULL,
  `killer_id` bigint(20) DEFAULT NULL,
  `killer_team` varchar(20) DEFAULT NULL,
  `killed_name` varchar(100) DEFAULT NULL,
  `killed_id` bigint(20) DEFAULT NULL,
  `killed_team` varchar(20) DEFAULT NULL,
  `weapon` varchar(100) DEFAULT NULL,
  `headshot` tinyint(1) DEFAULT NULL,
  `round_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id_idx` (`match_id`),
  KEY `map_id_idx` (`map_id`),
  KEY `killer_id_idx` (`killer_id`),
  KEY `killed_id_idx` (`killed_id`),
  CONSTRAINT `player_kill_killed_id_players_id` FOREIGN KEY (`killed_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_kill_killer_id_players_id` FOREIGN KEY (`killer_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_kill_map_id_maps_id` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_kill_match_id_matchs_id` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3350 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `map_id` bigint(20) NOT NULL,
  `player_key` varchar(255) DEFAULT NULL,
  `team` varchar(255) DEFAULT 'other',
  `ip` varchar(255) DEFAULT NULL,
  `steamid` varchar(255) DEFAULT NULL,
  `first_side` varchar(255) DEFAULT NULL,
  `current_side` varchar(255) DEFAULT NULL,
  `pseudo` varchar(255) DEFAULT NULL,
  `nb_kill` bigint(20) DEFAULT '0',
  `assist` bigint(20) DEFAULT '0',
  `death` bigint(20) DEFAULT '0',
  `point` bigint(20) DEFAULT '0',
  `hs` bigint(20) DEFAULT '0',
  `defuse` bigint(20) DEFAULT '0',
  `bombe` bigint(20) DEFAULT '0',
  `tk` bigint(20) DEFAULT '0',
  `nb1` bigint(20) DEFAULT '0',
  `nb2` bigint(20) DEFAULT '0',
  `nb3` bigint(20) DEFAULT '0',
  `nb4` bigint(20) DEFAULT '0',
  `nb5` bigint(20) DEFAULT '0',
  `nb1kill` bigint(20) DEFAULT '0',
  `nb2kill` bigint(20) DEFAULT '0',
  `nb3kill` bigint(20) DEFAULT '0',
  `nb4kill` bigint(20) DEFAULT '0',
  `nb5kill` bigint(20) DEFAULT '0',
  `pluskill` bigint(20) DEFAULT '0',
  `firstkill` bigint(20) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id_idx` (`match_id`),
  KEY `map_id_idx` (`map_id`),
  CONSTRAINT `players_map_id_maps_id` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `players_match_id_matchs_id` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=889 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players_heatmap`
--

DROP TABLE IF EXISTS `players_heatmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players_heatmap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `map_id` bigint(20) NOT NULL,
  `event_name` varchar(50) DEFAULT NULL,
  `event_x` double(18,2) DEFAULT NULL,
  `event_y` double(18,2) DEFAULT NULL,
  `event_z` double(18,2) DEFAULT NULL,
  `player_name` varchar(255) DEFAULT NULL,
  `player_id` bigint(20) DEFAULT NULL,
  `player_team` varchar(20) DEFAULT NULL,
  `attacker_x` double(18,2) DEFAULT NULL,
  `attacker_y` double(18,2) DEFAULT NULL,
  `attacker_z` double(18,2) DEFAULT NULL,
  `attacker_name` varchar(255) DEFAULT NULL,
  `attacker_id` bigint(20) DEFAULT NULL,
  `attacker_team` varchar(20) DEFAULT NULL,
  `round_id` bigint(20) DEFAULT NULL,
  `round_time` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id_idx` (`match_id`),
  KEY `map_id_idx` (`map_id`),
  KEY `player_id_idx` (`player_id`),
  KEY `attacker_id_idx` (`attacker_id`),
  CONSTRAINT `players_heatmap_attacker_id_players_id` FOREIGN KEY (`attacker_id`) REFERENCES `players` (`id`) ON DELETE SET NULL,
  CONSTRAINT `players_heatmap_map_id_maps_id` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `players_heatmap_match_id_matchs_id` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `players_heatmap_player_id_players_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9776 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players_snapshot`
--

DROP TABLE IF EXISTS `players_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `player_id` bigint(20) NOT NULL,
  `player_key` varchar(255) DEFAULT NULL,
  `first_side` varchar(255) DEFAULT NULL,
  `current_side` varchar(255) DEFAULT NULL,
  `nb_kill` bigint(20) DEFAULT '0',
  `assist` bigint(20) DEFAULT '0',
  `death` bigint(20) DEFAULT '0',
  `point` bigint(20) DEFAULT '0',
  `hs` bigint(20) DEFAULT '0',
  `defuse` bigint(20) DEFAULT '0',
  `bombe` bigint(20) DEFAULT '0',
  `tk` bigint(20) DEFAULT '0',
  `nb1` bigint(20) DEFAULT '0',
  `nb2` bigint(20) DEFAULT '0',
  `nb3` bigint(20) DEFAULT '0',
  `nb4` bigint(20) DEFAULT '0',
  `nb5` bigint(20) DEFAULT '0',
  `nb1kill` bigint(20) DEFAULT '0',
  `nb2kill` bigint(20) DEFAULT '0',
  `nb3kill` bigint(20) DEFAULT '0',
  `nb4kill` bigint(20) DEFAULT '0',
  `nb5kill` bigint(20) DEFAULT '0',
  `pluskill` bigint(20) DEFAULT '0',
  `firstkill` bigint(20) DEFAULT '0',
  `round_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id_idx` (`player_id`),
  CONSTRAINT `players_snapshot_player_id_players_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `round`
--

DROP TABLE IF EXISTS `round`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `round` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `map_id` bigint(20) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_text` text,
  `event_time` bigint(20) DEFAULT NULL,
  `kill_id` bigint(20) DEFAULT NULL,
  `round_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id_idx` (`match_id`),
  KEY `map_id_idx` (`map_id`),
  KEY `kill_id_idx` (`kill_id`),
  CONSTRAINT `round_kill_id_player_kill_id` FOREIGN KEY (`kill_id`) REFERENCES `player_kill` (`id`) ON DELETE SET NULL,
  CONSTRAINT `round_map_id_maps_id` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `round_match_id_matchs_id` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21920 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `round_summary`
--

DROP TABLE IF EXISTS `round_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `round_summary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) NOT NULL,
  `map_id` bigint(20) NOT NULL,
  `bomb_planted` tinyint(1) DEFAULT NULL,
  `bomb_defused` tinyint(1) DEFAULT NULL,
  `bomb_exploded` tinyint(1) DEFAULT NULL,
  `win_type` varchar(255) DEFAULT 'normal',
  `team_win` varchar(255) DEFAULT NULL,
  `ct_win` tinyint(1) DEFAULT NULL,
  `t_win` tinyint(1) DEFAULT NULL,
  `score_a` smallint(6) DEFAULT NULL,
  `score_b` smallint(6) DEFAULT NULL,
  `best_killer` bigint(20) DEFAULT NULL,
  `best_killer_nb` bigint(20) DEFAULT NULL,
  `best_killer_fk` tinyint(1) DEFAULT NULL,
  `best_action_type` text,
  `best_action_param` text,
  `backup_file_name` varchar(255) DEFAULT NULL,
  `round_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `match_id_idx` (`match_id`),
  KEY `map_id_idx` (`map_id`),
  KEY `best_killer_idx` (`best_killer`),
  CONSTRAINT `round_summary_best_killer_players_id` FOREIGN KEY (`best_killer`) REFERENCES `players` (`id`) ON DELETE SET NULL,
  CONSTRAINT `round_summary_map_id_maps_id` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `round_summary_match_id_matchs_id` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1298 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `event` varchar(50) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `rcon` varchar(50) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `tv_ip` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_forgot_password`
--

DROP TABLE IF EXISTS `sf_guard_forgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_group`
--

DROP TABLE IF EXISTS `sf_guard_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_group_permission`
--

DROP TABLE IF EXISTS `sf_guard_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_permission`
--

DROP TABLE IF EXISTS `sf_guard_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_remember_key`
--

DROP TABLE IF EXISTS `sf_guard_remember_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_user`
--

DROP TABLE IF EXISTS `sf_guard_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) NOT NULL,
  `username` varchar(128) NOT NULL,
  `algorithm` varchar(128) NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `username` (`username`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_user_group`
--

DROP TABLE IF EXISTS `sf_guard_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`),
  CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sf_guard_user_permission`
--

DROP TABLE IF EXISTS `sf_guard_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `shorthandle` varchar(50) NOT NULL,
  `flag` varchar(2) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams_in_seasons`
--

DROP TABLE IF EXISTS `teams_in_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_in_seasons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `season_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `season_id_idx` (`season_id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `teams_in_seasons_season_id_seasons_id` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teams_in_seasons_team_id_teams_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

