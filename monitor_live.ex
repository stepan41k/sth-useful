defmodule SensorMonitorWeb.MonitorLive do
  use SensorMonitorWeb, :live_view
  alias Phoenix.PubSub

  # При подключении пользователя подписываем его на тему "sensors"
  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(SensorMonitor.PubSub, "sensors")
    
    {:ok, assign(socket, :value, 0)}
  end

  # Рендеринг HTML (прямо в коде для примера)
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center h-screen">
      <h1 class="text-2xl font-bold mb-4">Мониторинг сервера (Real-time)</h1>
      <div class="text-6xl font-mono p-10 bg-gray-100 rounded-lg shadow-xl">
        <%= @value %>%
      </div>
      <div class="mt-4 w-64 bg-gray-200 rounded-full h-4">
        <div class="bg-blue-600 h-4 rounded-full transition-all duration-500" 
             style={"width: #{@value}%"}></div>
      </div>
    </div>
    """
  end

  # Обработка сообщения от GenServer
  def handle_info({:new_reading, val}, socket) do
    {:noreply, assign(socket, :value, val)}
  end
end