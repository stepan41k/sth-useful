children = [
  # ... другие процессы
  SensorMonitor.SensorServer,
  {Phoenix.PubSub, name: SensorMonitor.PubSub}
]