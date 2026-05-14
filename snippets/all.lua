---@diagnostic disable: undefined-global
return {
  s("date", t(os.date("%Y/%m/%d"))),
  s("time", t(os.date("%H:%M:%S"))),
  s("datetime", t(os.date("%Y/%m/%d %H:%M:%S"))),
}
