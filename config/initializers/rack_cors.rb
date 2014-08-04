CatsApi::Application.config.middleware.use Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :put, :options]
  end
end