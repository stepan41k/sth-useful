scope "/", SensorMonitorWeb do
  pipe_through :browser
  live "/", MonitorLive
end