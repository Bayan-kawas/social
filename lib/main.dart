import 'package:flutter/material.dart';
import 'creatDBbdart.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  createDb();
}





//CREATE TABLE `bayan`.`users` ( `id` INT NOT NULL , `first name` TEXT NOT NULL , `last name` TEXT NOT NULL ) ENGINE = InnoDB;
//CREATE TABLE `bayan`.`users` ( `id` INT NOT NULL AUTO_INCREMENT , `first name` TEXT NOT NULL , `last name` TEXT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
//CREATE TABLE `bayan`. ( `id` INT NOT NULL , `content` TEXT NOT NULL , `user_id` INT NOT NULL , `post_id` INT NOT NULL ) ENGINE = InnoDB;
//
//CREATE TABLE `bayan`.`comment likes` ( `id` INT NOT NULL , `user_id` INT NOT NULL , `comment_id` INT NOT NULL ) ENGINE = InnoDB;

