defmodule SensorMonitor.SensorServer do
  use GenServer
  alias Phoenix.PubSub

  # Запуск процесса
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  # Инициализация: запускаем цикл обновлений
  def init(state) do
    schedule_update()
    {:ok, state}
  end

  # Обработка таймера
  def handle_info(:update, state) do
    new_value = :rand.uniform(100) # Имитация данных (0-100%)
    
    # Рассылаем данные всем подписчикам через PubSub
    PubSub.broadcast(SensorMonitor.PubSub, "sensors", {:new_reading, new_value})
    
    schedule_update()
    {:noreply, state}
  end

  defp schedule_update do
    Process.send_after(self(), :update, 1000) # Повтор через 1 сек
  end
end