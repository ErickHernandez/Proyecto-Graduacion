<?php

function get_db_credentials(){
    $cred = array();

    $cred["host"] = "proyectograd-replica.c3vmmkmxglze.us-east-1.rds.amazonaws.com";
    $cred["name"] = "prod";
    $cred["user"] = "prod";
    $cred["pass"] = "A4aShqST9L#";

    return $cred;
}