require 'rack'

# Create an object that responds to a #call method
# The #call method should take one argument, conventionally called env,
# that bundles all the data about the request



# class App
#   def call(env)
#     # The #call method should return an array with three elements:
#     # An HTTP status code (like '200' or '404')
#     # A hash of headers
#     # A response body
#
#   end
# end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write(req.path)
  res.finish
end

# Pass the object to Rack::Server#start
Rack::Server.start(
  app: app,
  Port: 3000
)
