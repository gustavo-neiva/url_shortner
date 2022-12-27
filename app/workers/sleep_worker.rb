class SleepWorker
  include Sidekiq::Worker

  def perform(name, sec)
    p("Hi #{name}, sleeping for #{sec} seconds")
    sleep(sec)
    p("Refreshed")
  end
end