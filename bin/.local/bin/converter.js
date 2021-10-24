#!/usr/bin/env node
const {log} = require('console');
const fs = require('fs');
const isCharging = fs.readFileSync("/sys/class/power_supply/AC/online").toString()
if(!Number(isCharging)){
    const chargeBat0 = fs.readFileSync("/sys/class/power_supply/BAT0/energy_now").toString()
    const chargeBat1 = fs.readFileSync("/sys/class/power_supply/BAT1/energy_now").toString()
    const drainingBat0 = fs.readFileSync("/sys/class/power_supply/BAT0/power_now").toString()
    const drainingBat1 = fs.readFileSync("/sys/class/power_supply/BAT1/power_now").toString()
    
    const totalCharge = Number(chargeBat0)+Number(chargeBat1);
    const totalDraining = Number(drainingBat0)+Number(drainingBat1);
    
    const decimalTime = totalCharge /totalDraining;
    const splitedTime = decimalTime.toString().split(".")
    const minutes = (Number("0."+splitedTime[1]) * (60)).toFixed()
    log(splitedTime[0] + ":" + minutes);
}
