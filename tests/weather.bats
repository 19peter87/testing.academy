#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

@test "when city is provided, then some data are received" {
    
    run curl -s "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=3718d7f90e7b081ca8f46aa4305c05ea&q=kosice"
    
    assert_equal $(echo "$output" | jq -r .name) "Kosice"
}

@test "when non existing city is provided, then message with code 404 is returned" {
    
    run curl -s "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=3718d7f90e7b081ca8f46aa4305c05ea&q=vajcovany"
    message=$(echo "$output" | jq -r .message)

    assert_equal $(echo "$output" | jq -r .cod) 404
    assert_equal "$message" "city not found"
}
    
@test "when wrong API key is provided, then 401 with error message is returned" {
    
    run curl -s "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=wrong-key&q=kosice"
    message=$(echo "$output" | jq -r .message)
    
    assert_equal $(echo "$output" | jq -r .cod) 401 # "cod": 401
    assert_equal "$message" "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."
}

