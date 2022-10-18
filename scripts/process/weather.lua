local process = Process("weather")

process.onStart(function(this)

    local r = Rect("test", "square", 0, 0, 1000, 1000)
    --r.weather(nil, false)
    --r.weather(WEATHER_TYPE.rain, true)
    --r.weather(WEATHER_TYPE.snowstorm, true)

    local w = Weather(r, WEATHER_TYPE.mistBlueHeave)
    w.enable(true).period(5)

end)

