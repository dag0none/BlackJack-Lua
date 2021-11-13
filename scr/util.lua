function math.sign(v)
    return v > 0 and 1 or v < 0 and -1 or 0
end

function smoothApproach(_value, _target, _amount)
    local diff = _target - _value
    if math.abs(diff) < 0.05 then
        return _target
    else 
        return _value + math.sign(diff) * math.abs(diff) * _amount
    end
end
