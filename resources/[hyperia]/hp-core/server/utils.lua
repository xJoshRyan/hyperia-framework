Hyperia.LogError = function(err)
    print("[Hyperia Framework] Error: ^1" .. err)
end

Hyperia.FormatDateTime = function(dateTime)
    if not dateTime or dateTime == "0000-00-00 00:00:00" then
        return nil
    end

    local year, month, day, hour, min, sec = datetime:match("(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)")
    if year and month and day and hour and min and sec then
        local timeTable = {
            year = tonumber(year),
            month = tonumber(month),
            day = tonumber(day),
            hour = tonumber(hour),
            min = tonumber(min),
            sec = tonumber(sec),
        }
        return os.date("%B %d, %Y at %I:%M %p", os.time(timeTable))
    else
        return "Invalid date"
    end
end