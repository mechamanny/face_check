class Demo
  def initialize(application)
    @application = application
  end

  def info
    @application.response.to_json
  end

  def razzle(razzlees)
  	'razzle ' + razzlees.join(', ')
  end
end
