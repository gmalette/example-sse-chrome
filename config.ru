require 'pubsubstub'

class App
  def initialize(n)
    @next = n
  end

  def call(env)
    if env['HTTP_ACCEPT'].include?('text/html')
      [200, {'Content-Type' => 'text/html'}, [File.read(File.join(File.dirname(__FILE__), 'index.html'))]]
    else
      @next.call(env)
    end
  end
end
run App.new(Pubsubstub::StreamAction)
